"""Remove the fake signatures and seals Midjourney paints into its prints.

Only pixels inside each listed box that look like ink (dark strokes or seal red) are
repainted, so the paper, sky or water texture around them survives. Also crops off a
painted margin when the print came with one.

usage: python3 tools/clean_marks.py <in> <out> <x0,y0,x1,y1> [<box> ...] [--crop=px]
"""
import sys
import cv2
import numpy as np

src, dst, *rest = sys.argv[1:]
crop = 0
boxes = []
for a in rest:
    if a.startswith("--crop="):
        crop = int(a.split("=")[1])
    else:
        boxes.append([int(v) for v in a.split(",")])

im = cv2.imread(src, cv2.IMREAD_COLOR)
mask = np.zeros(im.shape[:2], np.uint8)
hsv = cv2.cvtColor(im, cv2.COLOR_BGR2HSV)
for x0, y0, x1, y1 in boxes:
    roi, h = im[y0:y1, x0:x1], hsv[y0:y1, x0:x1]
    grey = cv2.cvtColor(roi, cv2.COLOR_BGR2GRAY)
    local = np.median(grey)
    dark = grey < local - 45                                        # brush strokes
    red = ((h[..., 0] < 12) | (h[..., 0] > 165)) & (h[..., 1] > 70)  # seal ink
    m = ((dark | red) * 255).astype(np.uint8)
    m = cv2.dilate(m, np.ones((7, 7), np.uint8), iterations=2)
    mask[y0:y1, x0:x1] = np.maximum(mask[y0:y1, x0:x1], m)
out = cv2.inpaint(im, mask, 11, cv2.INPAINT_TELEA)
if crop:
    H, W = out.shape[:2]
    out = out[crop:H - crop, crop:W - crop]
cv2.imwrite(dst, out, [cv2.IMWRITE_PNG_COMPRESSION, 3])
print(f"{dst}: {len(boxes)} marks, {int(mask.sum() / 255)} px repainted, crop {crop}")
