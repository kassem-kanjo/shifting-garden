#!/usr/bin/env bash
# Builds the Shifting Garden macOS screensaver using only Apple's Command Line Tools.
# Run from anywhere:  mac/build.sh        Output goes to mac/dist/ (git-ignored).
# WEB_SRC and DIST can be overridden for testing.
set -euo pipefail

VERSION="0.1.0"            # the one place the version number lives
MIN_MACOS="12.0"
SAVER_ID="com.kassemkanjo.shiftinggarden.saver"
PRINCIPAL="ShiftingGardenSaverView"   # must match @objc(...) in the Swift file

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$HERE/.." && pwd)"
WEB="${WEB_SRC:-$ROOT/web}"
DIST="${DIST:-$HERE/dist}"
SAVER="$DIST/Shifting Garden.saver"
COPYRIGHT="Copyright 2026 Kassem Kanjo."

for tool in swiftc lipo sips codesign ditto plutil xcrun; do
  command -v "$tool" >/dev/null || { echo "error: '$tool' not found. Install the Command Line Tools: xcode-select --install" >&2; exit 1; }
done
[ -f "$WEB/index.html" ] || { echo "error: $WEB/index.html not found" >&2; exit 1; }
SDK="$(xcrun --sdk macosx --show-sdk-path 2>/dev/null || echo /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk)"
[ -d "$SDK" ] || { echo "error: macOS SDK not found (run: xcode-select --install)" >&2; exit 1; }

echo "Shifting Garden $VERSION: building into $DIST"
rm -rf "$SAVER" "$DIST/Shifting-Garden-screensaver.zip"
mkdir -p "$SAVER/Contents/MacOS" "$SAVER/Contents/Resources"

# Compile for arm64 and x86_64 and join into one universal bundle binary.
OUT="$SAVER/Contents/MacOS/ShiftingGardenSaver"
for arch in arm64 x86_64; do
  swiftc -swift-version 5 -O -sdk "$SDK" -target "$arch-apple-macos$MIN_MACOS" \
    -emit-library -Xlinker -bundle -module-name ShiftingGardenSaver \
    "$HERE/saver/ShiftingGardenSaverView.swift" -o "$OUT.$arch"
done
lipo -create "$OUT.arm64" "$OUT.x86_64" -output "$OUT"
rm -f "$OUT.arm64" "$OUT.x86_64"

# Web page: only .html .js .css .png from web/ (top level and subfolders), same layout.
(cd "$WEB" && find . -type f \( -name '*.html' -o -name '*.js' -o -name '*.css' -o -name '*.png' \) ! -name '.*' -print0) |
  while IFS= read -r -d '' f; do
    mkdir -p "$SAVER/Contents/Resources/$(dirname "$f")"
    cp "$WEB/$f" "$SAVER/Contents/Resources/$f"
  done

# Thumbnail for System Settings: optional.
if [ -f "$WEB/thumbnail.png" ]; then
  sips -z 116 180 "$WEB/thumbnail.png" --out "$SAVER/Contents/Resources/thumbnail@2x.png" >/dev/null
  sips -z 58 90 "$WEB/thumbnail.png" --out "$SAVER/Contents/Resources/thumbnail.png" >/dev/null
else
  echo "- no web/thumbnail.png: skipping thumbnail"
fi

cat > "$SAVER/Contents/Info.plist" <<PLIST
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>CFBundleDevelopmentRegion</key><string>en</string>
  <key>CFBundleExecutable</key><string>ShiftingGardenSaver</string>
  <key>CFBundleIdentifier</key><string>$SAVER_ID</string>
  <key>CFBundleInfoDictionaryVersion</key><string>6.0</string>
  <key>CFBundleName</key><string>Shifting Garden</string>
  <key>CFBundlePackageType</key><string>BNDL</string>
  <key>CFBundleShortVersionString</key><string>$VERSION</string>
  <key>CFBundleVersion</key><string>$VERSION</string>
  <key>LSMinimumSystemVersion</key><string>$MIN_MACOS</string>
  <key>NSHumanReadableCopyright</key><string>$COPYRIGHT</string>
  <key>NSPrincipalClass</key><string>$PRINCIPAL</string>
</dict>
</plist>
PLIST
plutil -lint "$SAVER/Contents/Info.plist" >/dev/null
codesign --force --deep -s - "$SAVER"

ditto -c -k --keepParent "$SAVER" "$DIST/Shifting-Garden-screensaver.zip"

echo
echo "Done. Built version $VERSION (arm64 + x86_64, macOS $MIN_MACOS or newer, ad-hoc signed, not notarised):"
echo "  $SAVER"
echo "  $DIST/Shifting-Garden-screensaver.zip"
