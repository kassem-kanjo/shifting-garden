# Brief: Shifting Garden (screensaver)

**What:** a macOS screensaver (and browser page) of Japanese woodblock flower-and-bird scenes, cut into a grid of square tiles like a sliding puzzle. A few cells are empty; a neighbour slides into a gap, leaving a new gap, forever. Tiles carry digital corruption (dither, ASCII, halftone, misregistration, colour flips) that re-rolls as they travel.
**Canvas:** 16:9 scenes, rendered live at screen size · **Figma:** not used (motion piece, built in code) · **Repo:** github.com/kassem-kanjo/shifting-garden

## Decisions (user, 10-19)
- Subjects: a **rotating set** of 3–4 scenes in one palette: flowers + swallows, koi + waves, cranes + pine, peonies + butterflies.
- Behaviour: **breathe**. It drifts apart, slides back toward the whole picture, then drifts apart again.
- Pace: **calm**. Waves of slides every ~2.6 s, every gap moving at once, 1.2 s eased glide (user: no single quick moves).
- Countdown at the bottom to the whole picture (user, 10-19); exact, from a fixed beat.
- Guest blocks from the other scenes (user, 10-19).
- No black grid lines; blocks butt together (user, 10-19).
- Texture: flat screenprint, posterised inks with crisp keylines (user picked B of four, 10-19).

## Style (from the inspo)
- Kachō-e woodblock: flat colour areas, thin dark keylines, visible wood grain and paper fibre, cream washi ground.
- ~~Black grid lines~~ dropped at the user's request; the gaps show the grid.
- Corruption is per tile, about 25–35% of tiles: ordered-dither pixels, ASCII/code glyphs, halftone dots, RGB/CMYK misregistration, inverted or posterised colour, 8-bit blocks along edges.
- ~~Red seal in a corner~~ dropped at the user's request.

## Palette

| Role | Name | Hex |
|---|---|---|
| Paper | washi cream | #F3E9D2 |
| Pink | peony pink | #EE8FB4 |
| Coral | coral | #F07F5E |
| Saffron | chrysanthemum yellow | #F6C21B |
| Cobalt | swallow blue | #3E62C4 |
| Leaf | jade green | #2E7D62 |
| Mint glitch | mint | #6FE3C4 |
| Red | vermilion | #E8341C |
| Ink | sumi | #1A1A1A |

## Assets

| Asset | Source | Treatment | Status |
|---|---|---|---|
| Scene 1: chrysanthemums, hydrangea, swallows | MJ, full-bleed plate | tiled + glitched in code | done|
| Scene 2: koi and waves | MJ | same | done|
| Scene 3: cranes and pine | MJ | same | done|
| Scene 4: peonies and butterflies | MJ | same | done|
| Paper grain | code | dropped (texture feedback) | dropped |
| Seal | code | dropped: user, 10-19 | dropped |

**Why full-bleed plates and not cut-out assets:** the code slices each scene into tiles, so every scene has to be one continuous picture edge to edge. All the separate layers (glitch, ASCII, grid, seal, paper) are made in code on top of it.
