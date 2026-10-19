# Shifting Garden for macOS

Packages `web/index.html` + `web/scenes.js` as a screensaver (`Shifting Garden.saver`).
Needs macOS 12+. Built with Apple's Command Line Tools only (no Xcode).

| Task | Command |
|---|---|
| Build | `mac/build.sh` (output in `mac/dist/`: the `.saver` and `Shifting-Garden-screensaver.zip`) |
| Install | `mac/install.sh` (rebuilds, copies to `~/Library/Screen Savers/`, restarts `legacyScreenSaver`) |
| Select | System Settings > Screen Saver > Shifting Garden |
| Uninstall | `rm -rf "$HOME/Library/Screen Savers/Shifting Garden.saver"` |

The build is a universal binary (arm64 + x86_64), ad-hoc signed, not notarised. If you
download the zip rather than build it, macOS may ask you to allow it in System Settings > Privacy & Security.

Build options: `WEB_SRC=/path/to/web` builds from another folder; `web/thumbnail.png`, if present, becomes the picker thumbnail.
Only `.html`, `.js`, `.css` and `.png` files from `web/` are bundled. The version lives at the top of `build.sh`.

## Why the host drives the frames

Inside the `legacyScreenSaver` process, WebKit does not count the web view as visible, so the page's
own `requestAnimationFrame` never fires. The page is loaded with `?saver=1` (no cursor, no UI, no
own loop) and the saver calls `window.shiftingGardenStep()` about 30 times a second from `animateOneFrame`.
