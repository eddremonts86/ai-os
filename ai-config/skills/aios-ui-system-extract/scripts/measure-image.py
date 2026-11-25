#!/usr/bin/env python3
"""measure-image: measure the design values in a screenshot of a site or app, from its pixels.

  measure-image.py IMAGE [--scale N] [--out FILE]

Prints one JSON document of MEASURED values: the palette by area, the flat boxes (surfaces, cards, buttons,
pills) with their corner radius, the text colour and text-line heights inside each, and the gaps and paddings
between them. `--scale` is the screenshot's device pixel ratio (2 for a retina capture): lengths are divided by it.

What a picture cannot give is left to the caller (a model that looks at the image): the role of each colour, the
font family, hover and focus states, a dark mode. Font sizes here are approximate (the height of a text line's ink).
The browser decodes the image and does the pixel math, so there is no Pillow or NumPy; same engine as
aios-ui-verify's compare.py. Needs `pip install playwright`. Exit 0 = measured, 2 = could not run.
"""

import argparse
import base64
import json
import mimetypes
import sys
from pathlib import Path

PAGE = "<!doctype html><meta charset=utf-8><canvas id=c></canvas>"

MEASURE = r"""async ([b64, mime, maxW, scale]) => {
  const img = new Image(); img.src = `data:${mime};base64,${b64}`; await img.decode();
  const k = Math.min(1, maxW / img.naturalWidth), W = Math.round(img.naturalWidth * k), H = Math.round(img.naturalHeight * k);
  const cv = document.getElementById('c'); cv.width = W; cv.height = H;
  const cx = cv.getContext('2d', { willReadFrequently: true });
  cx.fillStyle = '#fff'; cx.fillRect(0, 0, W, H); cx.drawImage(img, 0, 0, W, H);  // transparency is shown on white
  const d = cx.getImageData(0, 0, W, H).data, N = W * H;
  const hex = (r, g, b) => '#' + [r, g, b].map(v => Math.round(v).toString(16).padStart(2, '0')).join('');
  const dist = (i, c) => Math.hypot(d[i] - c[0], d[i + 1] - c[1], d[i + 2] - c[2]);
  const cd = (a, b) => Math.hypot(a[0] - b[0], a[1] - b[1], a[2] - b[2]);
  const lum = c => { const f = v => { v /= 255; return v <= 0.03928 ? v / 12.92 : ((v + 0.055) / 1.055) ** 2.4; }; return 0.2126 * f(c[0]) + 0.7152 * f(c[1]) + 0.0722 * f(c[2]); };
  const contrast = (a, b) => { const x = lum(a), y = lum(b); return (Math.max(x, y) + 0.05) / (Math.min(x, y) + 0.05); };
  const px = v => Math.round(v / k / scale * 10) / 10;  // analysis pixels -> CSS pixels

  // 1. palette: 5-bit bins, then merge bins whose colours are close, so antialiasing shades join their colour
  const bins = new Map();
  for (let i = 0; i < d.length; i += 4) { const key = (d[i] >> 3) << 10 | (d[i + 1] >> 3) << 5 | d[i + 2] >> 3;
    const o = bins.get(key) || { n: 0, r: 0, g: 0, b: 0 }; o.n++; o.r += d[i]; o.g += d[i + 1]; o.b += d[i + 2]; bins.set(key, o); }
  const clusters = [];
  for (const o of [...bins.values()].sort((a, b) => b.n - a.n)) {
    const c = [o.r / o.n, o.g / o.n, o.b / o.n], hit = clusters.find(x => cd(x.c, c) <= 9);  // one bin wide: #fff and #f4f4f5 must stay two colours
    if (hit) hit.n += o.n; else clusters.push({ c, n: o.n });
  }
  const palette = clusters.filter(x => x.n / N >= 0.002).slice(0, 14).map(x => ({ hex: hex(...x.c), share: Math.round(x.n / N * 1000) / 10, rgb: x.c.map(Math.round) }));

  // 2. flat boxes: connected areas of one palette colour
  const boxes = []; let pageBg = null;
  const seen = new Uint8Array(N), stack = new Int32Array(N);
  for (const p of palette.slice(0, 10)) {
    const m = new Uint8Array(N); for (let i = 0, j = 0; j < N; i += 4, j++) m[j] = dist(i, p.rgb) <= 10 ? 1 : 0;
    seen.fill(0);
    for (let s = 0; s < N; s++) {
      if (!m[s] || seen[s]) continue;
      let sp = 0, area = 0, x0 = W, y0 = H, x1 = 0, y1 = 0; stack[sp++] = s; seen[s] = 1;
      while (sp) { const j = stack[--sp], x = j % W, y = (j - x) / W; area++;
        if (x < x0) x0 = x; if (x > x1) x1 = x; if (y < y0) y0 = y; if (y > y1) y1 = y;
        if (x > 0 && m[j - 1] && !seen[j - 1]) { seen[j - 1] = 1; stack[sp++] = j - 1; }
        if (x < W - 1 && m[j + 1] && !seen[j + 1]) { seen[j + 1] = 1; stack[sp++] = j + 1; }
        if (y > 0 && m[j - W] && !seen[j - W]) { seen[j - W] = 1; stack[sp++] = j - W; }
        if (y < H - 1 && m[j + W] && !seen[j + W]) { seen[j + W] = 1; stack[sp++] = j + W; } }
      const w = x1 - x0 + 1, h = y1 - y0 + 1;
      if (area < Math.min(N * 0.002, 1500) || w < 12 || h < 12) continue;  // relative, but never so big that a button on a tall full-page capture is lost
      const b = { rgb: p.rgb, hex: p.hex, x0, y0, x1, y1, w, h, area, fill: area / (w * h) };
      if ((w >= W * 0.9 && h >= H * 0.9) || area / N >= 0.4) { if (!pageBg || area > pageBg.area) pageBg = b; } else if (b.fill >= 0.6) boxes.push(b);
    }
  }
  boxes.sort((a, b) => b.area - a.area); boxes.length = Math.min(boxes.length, 60);  // small controls must not lose their place to big cards

  // 3. corner radius: the cut-away corner is (1 - pi/4) r^2 pixels of the colour just outside it
  const at = (x, y) => (y * W + x) * 4;
  const corner = (b, cxn, cyn, sx, sy) => {
    const ox = cxn - 3 * sx, oy = cyn - 3 * sy;  // 3px out: past a 1-2px border, so a square bordered box reads as square
    if (ox < 0 || oy < 0 || ox >= W || oy >= H) return null;
    const out = [d[at(ox, oy)], d[at(ox, oy) + 1], d[at(ox, oy) + 2]];
    if (cd(out, b.rgb) <= 10) return null;  // same colour inside and out (white card on a white page): no visible edge to measure
    const v = [out[0] - b.rgb[0], out[1] - b.rgb[1], out[2] - b.rgb[2]], len2 = v[0] * v[0] + v[1] * v[1] + v[2] * v[2];
    // fraction of a pixel that is fill: 1 - its share of the way to the outside colour; off that line it is other content, so fill
    const fillAt = (x, y) => { if (x < 0 || y < 0 || x >= W || y >= H) return 1; const o = at(x, y), q = [d[o] - b.rgb[0], d[o + 1] - b.rgb[1], d[o + 2] - b.rgb[2]];
      const t = Math.max(0, Math.min(1, (q[0] * v[0] + q[1] * v[1] + q[2] * v[2]) / len2));
      return Math.hypot(q[0] - t * v[0], q[1] - t * v[1], q[2] - t * v[2]) <= 24 ? 1 - t : 1; };
    // A box sits on fractional coordinates, so the row and column just outside its edge are partly fill: the true corner is
    // that much further out. Measure that sliver on the middle of each straight edge, then count what the corner cuts away.
    const fx = fillAt(cxn - sx, Math.round((b.y0 + b.y1) / 2)), fy = fillAt(Math.round((b.x0 + b.x1) / 2), cyn - sy);
    const K = Math.min(48, Math.floor(Math.min(b.w, b.h) / 2)); let filled = 0;
    for (let j = -1; j <= K; j++) { const wy = j < 0 ? 1 : Math.max(0, Math.min(1, K - j - fy));
      for (let i = -1; i <= K; i++) { const wx = i < 0 ? 1 : Math.max(0, Math.min(1, K - i - fx));
        if (wx && wy) filled += fillAt(cxn + sx * i, cyn + sy * j) * wx * wy; } }
    return Math.min(K, Math.sqrt(Math.max(0, K * K - filled) / (1 - Math.PI / 4)));
  };
  for (const b of boxes) {
    const rs = [corner(b, b.x0, b.y0, 1, 1), corner(b, b.x1, b.y0, -1, 1), corner(b, b.x0, b.y1, 1, -1), corner(b, b.x1, b.y1, -1, -1)].filter(v => v !== null);
    const r = rs.length ? rs.reduce((a, v) => a + v, 0) / rs.length : null;  // null: no visible corner to measure
    b.radius = r === null ? null : r < 1.5 ? 0 : Math.round(r / k / scale * 10) / 10; b.pill = r !== null && r >= Math.min(b.w, b.h) / 2 - 1.5 && r > 4;
  }

  // 4. ink: the most contrasting frequent colour inside the box that is not its own fill, and the text lines in it
  for (const b of boxes) {
    const h = new Map(), pad = Math.max(3, Math.round((b.radius || 0) * k * scale * 0.3));
    for (let y = b.y0 + pad; y <= b.y1 - pad; y++) for (let x = b.x0 + pad; x <= b.x1 - pad; x++) { const o = at(x, y);
      if (dist(o, b.rgb) > 40) { const key = (d[o] >> 4) << 8 | (d[o + 1] >> 4) << 4 | d[o + 2] >> 4; const e = h.get(key) || { n: 0, r: 0, g: 0, b: 0 }; e.n++; e.r += d[o]; e.g += d[o + 1]; e.b += d[o + 2]; h.set(key, e); } }
    const top = [...h.values()].sort((a, z) => z.n - a.n).slice(0, 4).map(e => ({ c: [e.r / e.n, e.g / e.n, e.b / e.n], n: e.n }));
    const best = top.sort((a, z) => contrast(z.c, b.rgb) - contrast(a.c, b.rgb))[0];
    if (!best) { b.ink = null; b.lines = []; continue; }
    b.ink = { hex: hex(...best.c), contrast: Math.round(contrast(best.c, b.rgb) * 10) / 10 };
    const rows = []; for (let y = b.y0 + pad; y <= b.y1 - pad; y++) { let on = false;
      for (let x = b.x0 + pad; x <= b.x1 - pad && !on; x++) on = dist(at(x, y), best.c) <= 40; rows.push(on); }
    b.lines = []; let st = -1;
    rows.forEach((on, i) => { if (on && st < 0) st = i; if ((!on || i === rows.length - 1) && st >= 0) { const hh = i - st + (on ? 1 : 0); if (hh >= 3) b.lines.push({ y: px(st + pad + b.y0), inkHeight: px(hh) }); st = -1; } });
    b.lines = b.lines.slice(0, 8);
  }

  // 5. spacing: padding of a box inside another, and gaps between neighbours
  const inside = (a, p) => a !== p && a.x0 >= p.x0 - 2 && a.y0 >= p.y0 - 2 && a.x1 <= p.x1 + 2 && a.y1 <= p.y1 + 2 && a.area < p.area;
  const sp = new Map(), add = v => { v = Math.round(v / k / scale); if (v >= 2 && v <= 200) sp.set(v, (sp.get(v) || 0) + 1); };
  for (const a of boxes) {
    const par = boxes.filter(p => inside(a, p)).sort((x, y) => x.area - y.area)[0];
    if (par) add(Math.min(a.x0 - par.x0, a.y0 - par.y0, par.x1 - a.x1, par.y1 - a.y1));
    for (const b of boxes) { if (a === b || inside(a, b) || inside(b, a)) continue;
      const ox = Math.min(a.x1, b.x1) - Math.max(a.x0, b.x0), oy = Math.min(a.y1, b.y1) - Math.max(a.y0, b.y0);
      if (ox > 0.5 * Math.min(a.w, b.w) && b.y0 > a.y1) add(b.y0 - a.y1 - 1);
      if (oy > 0.5 * Math.min(a.h, b.h) && b.x0 > a.x1) add(b.x0 - a.x1 - 1); }
  }
  const tally = (arr) => { const m = new Map(); arr.forEach(v => m.set(v, (m.get(v) || 0) + 1)); return [...m].sort((a, z) => z[1] - a[1]).slice(0, 8).map(([value, count]) => ({ value, count })); };
  const covered = (boxes.reduce((s, b) => s + b.area, 0) + (pageBg ? pageBg.area : 0)) / N;

  return {
    image: { width: img.naturalWidth, height: img.naturalHeight, analysedWidth: W, deviceScale: scale },
    background: pageBg && pageBg.hex, palette,
    boxes: boxes.slice(0, 24).map(b => ({ hex: b.hex, x: px(b.x0), y: px(b.y0), width: px(b.w), height: px(b.h), share: Math.round(b.area / N * 1000) / 10,
      radius: b.radius, pill: b.pill, ink: b.ink, textLines: b.lines })),
    radii: tally(boxes.filter(b => b.radius > 0 || b.pill).map(b => b.pill ? 'full' : b.radius)),
    spacing: [...sp].sort((a, z) => z[1] - a[1]).slice(0, 10).map(([value, count]) => ({ value, count })),
    flatShare: Math.round(covered * 100) / 100
  };
}"""


def measure(path, scale=1.0, max_width=1600):
    from playwright.sync_api import sync_playwright

    p = Path(path).expanduser()
    mime = mimetypes.guess_type(p.name)[0] or "image/png"
    b64 = base64.b64encode(p.read_bytes()).decode()
    with sync_playwright() as pw:
        try:
            browser = pw.chromium.launch()
        except Exception:
            browser = pw.chromium.launch(channel="chrome")  # the installed Chrome, when Playwright's Chromium is missing
        page = browser.new_page()
        page.set_content(PAGE)
        out = page.evaluate(MEASURE, [b64, mime, max_width, scale])
        browser.close()
    out["source"] = "image"
    notes = ["lengths are measured and approximate (JPEG noise, antialiasing); font sizes are text-line ink heights, not points",
             "roles, font family, hover/focus states and dark mode cannot come from one picture: read them from the image itself"]
    if out["flatShare"] < 0.35:
        notes.append("less than 35% of the image is flat colour (gradients or photos): treat every value as weak")
    if scale == 1 and out["image"]["width"] >= 2000:
        notes.append("a wide capture is often a 2x retina screenshot: re-run with --scale 2 if the lengths look doubled")
    out["notes"] = notes
    return out


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument("image")
    ap.add_argument("--scale", type=float, default=1.0, help="device pixel ratio of the screenshot (2 for retina)")
    ap.add_argument("--out", help="write the JSON here instead of stdout")
    a = ap.parse_args(argv)
    p = Path(a.image).expanduser()
    if not p.is_file() or p.suffix.lower() not in (".png", ".jpg", ".jpeg", ".webp", ".gif"):
        print(f"not an image file (png, jpg, webp, gif): {a.image}", file=sys.stderr)
        return 2
    if a.scale <= 0:
        print("--scale must be positive", file=sys.stderr)
        return 2
    try:
        data = measure(a.image, a.scale)
    except ImportError:
        print("Playwright is missing: pip install playwright", file=sys.stderr)
        return 2
    except Exception as e:
        print(f"could not measure {a.image}: {e}", file=sys.stderr)
        return 2
    text = json.dumps(data, indent=2, ensure_ascii=False)
    if a.out:
        Path(a.out).write_text(text, encoding="utf-8")
    else:
        print(text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
