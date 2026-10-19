# Decisions

What was kept, and what was tried and dropped, with the reason.

| Date | Decision | Why | Dropped |
|---|---|---|---|
| 10-19 | Rotating set of four scenes, one at a time | variety without clutter (user's pick) | one big collage (needs cut-out assets and a composition step) |
| 10-19 | Guest blocks from other scenes | the scenes bleed into each other inside one scene (user's pick) | |
| 10-19 | Breathe: scatter, then replay the slides in reverse | guaranteed to come back exactly whole; a reversed random walk still looks random | greedy "move toward home" (gets stuck short of whole) |
| 10-19 | Slides in waves on a fixed beat | makes the countdown exact (≤ 0.04 s in simulation) | per-hole random clocks (duration unknowable) |
| 10-19 | Smooth eased glide, 1.2 s, several blocks at once | user found single, quick moves unsatisfying | held "glitch step" jumps (read as lag); 0.85 s glide with one block at a time |
| 10-19 | Glitch looks made one per frame from a queue | blocks landing together never stall a frame (slowest effect 4.5 ms) | generating on landing |
| 10-19 | No drawn grid; blocks butt together, the gaps show the cells | user disliked black lines, especially blocks sliding under them | fixed black grid lines (as in the reference) |
| 10-19 | Screenprint treatment of every scene | user disliked the overall texture; flat inks + keylines are closest to the reference | Midjourney's wood grain as is; softened grain; riso grain; a code paper-grain overlay |
| 10-19 | Bare-paper blocks only get printing glitches | halftone or mosaic on blank paper looked like a fault | any effect on any block |
| 10-19 | One-plate misregistration, two-ink flip | RGB splits and channel swaps looked like a bad TV, not print | RGB rainbow split, neon channel rotation |
| 10-19 | Scenes as data URIs in `scenes.js` | the canvas stays readable from `file://` and inside the screensaver | loading image files (taints the canvas) |
| 10-19 | Midjourney Editor erase for fake signatures | V8 signs woodblock prompts even with a long `--no` list | OpenCV inpaint (smears on patterned water) |
| 10-19 | No seal | user asked to remove it | red 庭 seal bottom right, after the reference |

Preview note: the Claude app's browser pane runs this page at about 8 fps. Judge motion in a real browser or the screensaver.
