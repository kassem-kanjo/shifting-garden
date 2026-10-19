# Midjourney: prompts, codes and job IDs

version: V8.2 (HD on by default, 2944×1648 at 16:9)
what's new: Style Creator in the sidebar, V8 personalization profiles (not used)
moodboard: none. The look came from the prompt; flat graphic wording mattered more than any code.
style lock: shared prompt tail (below)

## Shared style tail (round 2 onward)
`bold flat graphic Japanese kacho-e woodblock print, thick even black keylines around every shape, solid flat colour fills with no gradients, limited palette of peony pink, coral, saffron yellow, cobalt blue, jade green and vermilion on warm cream washi paper, generous open cream paper space, visible wood grain in the flat colour, slight misregistration --ar 16:9 --raw --s 100 --no text, letters, kanji, signature, seal, stamp, inscription, watermark, artist mark, margin, border, frame, gradient`

## Session 10-19
| Round | Scene | Job | Result |
|---|---|---|---|
| 1 | peonies + wisteria | f2bb1354 | lovely but painterly; fake seals |
| 1 | koi + waves | ffa6292f | painterly, too realistic |
| 1 | cranes + pine | 67434245 | painterly; seals |
| 1 | flowers + swallows | (lost: typed into the open settings panel) | |
| 2 | flowers + swallows | b71ffced | **pick 3** → `sources/flowers and swallows.webp` (clean) |
| 2 | cranes | 9c14b304 | all signed, one with an inner frame; rejected |
| 2 | koi | efc38178 | #2 had a fake © watermark; rejected |
| 2 | peonies + butterflies | 40d91fe2 | **pick 2** → `sources/peonies and butterflies.webp` (clean) |
| 3 | koi (stronger --no) | 5d0d3dd4 | pick 1, signature bottom-right → Editor erase |
| 3 | cranes (stronger --no) | 2afe9233 | pick 4, signature bottom-left + margin → Editor erase |
| edit | cranes repaint | 00afa554 | pick 2, margin cropped in code → `sources/cranes and pine.png` |

Lesson: V8 adds fake signatures and seals to "woodblock print" prompts even with a long `--no` list. Budget one Editor erase per scene (small brush, prompt for the background only). The OpenCV inpaint in `tools/clean_marks.py` is fine on flat sky but smears on patterned water.
