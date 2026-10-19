#!/usr/bin/env bash
# Builds the saver and installs it for the current user. Changes no system settings.
set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DIST="${DIST:-$HERE/dist}"
SAVER="$DIST/Shifting Garden.saver"
DEST="$HOME/Library/Screen Savers"

"$HERE/build.sh"   # always rebuild so a stale copy never gets installed
mkdir -p "$DEST"
rm -rf "$DEST/Shifting Garden.saver"
ditto "$SAVER" "$DEST/Shifting Garden.saver"
# Make the screensaver host reload so it picks up the new build.
killall legacyScreenSaver 2>/dev/null || true

echo "Installed: $DEST/Shifting Garden.saver"
echo "To use it: System Settings > Screen Saver, then pick \"Shifting Garden\" (under Other)."
