# Log: Shifting Garden

date · phase · what · why · where

## Phase 0: Setup
- 10-19 · 0 · project folder from template, inspo saved · · Screensavers/01 Shifting Garden
- 10-19 · 0 · user picked: rotating scenes, breathe, calm · · BRIEF.md
- 10-19 · 0 · will reuse Number Snake .saver wrapper (WKWebView, swiftc, no Xcode) · proven on this Mac · ../../../Number snake /mac
- 10-19 · 0 · Mac wrapper delegated to a Sonnet agent: builds universal, signed, plist OK (not yet run inside legacyScreenSaver) · · mac/

## Phase 2: Assets
- 10-19 · 2 · round 1 MJ: four scenes, too painterly, fake seals · reference is flatter and brighter · notes/prompts.md
- 10-19 · 2 · round 2: flat-graphic tail; flowers #3 and peonies #2 clean · · sources/
- 10-19 · 2 · user: one scene at a time plus "guest blocks" from other scenes · · BRIEF.md
- 10-19 · 2 · rounds 3 + Editor erase for koi and cranes (MJ keeps signing) · · sources/

## Phase 3: Engine
- 10-19 · 3 · web/index.html: grid cut, holes, scatter, exact reverse gather, scene wave · verified by sim: picture returns with 0 misplaced · web/
- 10-19 · 3 · glitches: dither, ascii, mosaic, halftone, one-plate misregister, two-ink print, wrong crop, guest, wash, specks · from the inspo · web/index.html
- 10-19 · 3 · user disliked glide + texture → glitch-step jump (4 held steps, sheared slices, red/mint plate edges); grain removed; scenes cleaned and brightened in pack step · · tools/pack_scenes.py
- 10-19 · 3 · user asked for countdown → fixed-beat scheduler so time-to-whole is exact (sim error ≤ 0.08 s); pixel-digit label on the bottom grid line · · web/index.html
- 10-19 · 3 · bare-paper tiles only get effects that print something (specks, ascii, guest, wash) · plain-paper glitches looked like faults · web/index.html
- 10-19 · 3 · user: motion laggy, wants several at once and slower → 1.2 s eased glide in staggered waves; glitch queue · preview pane measured at 8 fps (pane throttling, not the engine: 0.4 ms/frame) · web/index.html
- 10-19 · 3 · user disliked overall texture + black lines → four texture options shown, picked B flat screenprint; grid lines removed, soft lift shadow on moving blocks · · export/texture options.jpg, tools/pack_scenes.py
- 10-19 · 4 · saver rebuilt and installed to ~/Library/Screen Savers (not yet selected or watched in legacyScreenSaver) · · mac/
- 10-19 · 5 · README, CHANGELOG, DECISIONS; demo.gif + hero · · docs/
- 10-19 · 3 · seal removed (user) · · web/index.html
