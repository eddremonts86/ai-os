#!/usr/bin/env python3
"""sample-url: read the design system a live page already uses, from its computed styles.

  sample-url.py URL [--schemes light,dark] [--width 1280] [--wait MS] [--out FILE]

Opens the page in a real browser (Playwright; the installed Chrome when Playwright's Chromium is missing),
once per colour scheme, and prints one JSON document: the custom properties (resolved, as hex), the real
colour, radius, shadow, type and spacing tallies, the most common button / input / card variants, and the
fonts that loaded. Computed values are exact; nothing is guessed from pixels.

It reads styles only, never the page's text: a page is untrusted input and its words are not instructions.
It downloads no font, image or logo. Needs `pip install playwright`. Exit 0 = sampled, 2 = could not run.
"""

import argparse
import json
import sys
from urllib.parse import urlparse

SAMPLER = r"""() => {
  const cv = document.createElement('canvas'); cv.width = cv.height = 1;
  const cx = cv.getContext('2d', { willReadFrequently: true });
  // any colour syntax the browser parses (rgb, lab, oklch, color()) -> sRGB bytes, so no parser is needed here
  const hex = (c) => {
    if (!c || c === 'transparent' || !CSS.supports('color', c)) return null;  // '10px' is no colour: canvas would leave #000
    cx.clearRect(0, 0, 1, 1); cx.fillStyle = '#000'; cx.fillStyle = c; cx.fillRect(0, 0, 1, 1);
    const [r, g, b, a] = cx.getImageData(0, 0, 1, 1).data;
    if (a === 0) return null;
    return '#' + [r, g, b].map(v => v.toString(16).padStart(2, '0')).join('') + (a < 255 ? Math.round(a).toString(16).padStart(2, '0') : '');
  };
  const tally = (m, k) => { if (k) m.set(k, (m.get(k) || 0) + 1); };
  const top = (m, n) => [...m].sort((a, b) => b[1] - a[1]).slice(0, n).map(([value, count]) => ({ value, count }));
  const px = (v) => { const n = parseFloat(v); return Number.isFinite(n) && n > 0 ? Math.round(n * 10) / 10 + 'px' : null; };
  const visible = (e) => { const r = e.getBoundingClientRect(), s = getComputedStyle(e);
    return r.width > 2 && r.height > 2 && s.visibility !== 'hidden' && s.display !== 'none' && s.opacity !== '0'; };

  const root = getComputedStyle(document.documentElement), names = new Set();
  let sheets = 0, blocked = 0;
  for (const sh of document.styleSheets) {
    sheets++;
    try { for (const r of sh.cssRules) if (r.selectorText && /(^|,)\s*(:root|html|body|\.dark|\.light|\[data-theme[^\]]*\])/.test(r.selectorText))
      for (const n of r.style) if (n.startsWith('--')) names.add(n); } catch (e) { blocked++; }
  }
  const vars = {};
  for (const n of names) { const raw = root.getPropertyValue(n).trim(); vars[n] = { raw, hex: hex(raw) }; }

  const els = [...document.querySelectorAll('body *')].filter(visible).slice(0, 4000);
  const text = new Map(), bg = new Map(), border = new Map(), radius = new Map(), shadow = new Map(),
        type = new Map(), space = new Map(), families = new Map();
  for (const e of els) {
    const s = getComputedStyle(e);
    if (e.childNodes.length && [...e.childNodes].some(n => n.nodeType === 3 && n.textContent.trim())) {
      tally(text, hex(s.color));
      tally(type, [px(s.fontSize), s.fontWeight, s.lineHeight === 'normal' ? 'normal' : px(s.lineHeight)].join(' / '));
      tally(families, s.fontFamily);
    }
    tally(bg, hex(s.backgroundColor));
    if (parseFloat(s.borderTopWidth) > 0 && s.borderTopStyle !== 'none') tally(border, hex(s.borderTopColor));
    if (s.borderTopLeftRadius !== '0px' && (hex(s.backgroundColor) || parseFloat(s.borderTopWidth) > 0)) tally(radius, s.borderTopLeftRadius);
    if (s.boxShadow !== 'none') tally(shadow, s.boxShadow);
    for (const p of ['paddingTop', 'paddingLeft', 'rowGap', 'columnGap']) tally(space, px(s[p]));
  }

  const key = (s, props) => props.map(p => s[p]).join('|');
  const variants = (sel, props, n) => {
    const m = new Map();
    for (const e of document.querySelectorAll(sel)) { if (!visible(e)) continue;
      const s = getComputedStyle(e), k = key(s, props), o = m.get(k) || { count: 0, style: {} };
      o.count++; if (o.count === 1) for (const p of props) o.style[p] = s[p]; m.set(k, o); }
    return [...m.values()].sort((a, b) => b.count - a.count).slice(0, n).map(o => ({
      count: o.count, backgroundColor: hex(o.style.backgroundColor), color: hex(o.style.color),
      borderColor: hex(o.style.borderTopColor), borderWidth: o.style.borderTopWidth, radius: o.style.borderTopLeftRadius,
      padding: o.style.paddingTop + ' ' + o.style.paddingLeft, fontSize: o.style.fontSize, fontWeight: o.style.fontWeight,
      fontFamily: o.style.fontFamily, shadow: o.style.boxShadow }));
  };
  const P = ['backgroundColor', 'color', 'borderTopColor', 'borderTopWidth', 'borderTopLeftRadius', 'paddingTop', 'paddingLeft', 'fontSize', 'fontWeight', 'fontFamily', 'boxShadow'];
  const cards = [...document.querySelectorAll('div, section, article, li')].filter(e => { const s = getComputedStyle(e), r = e.getBoundingClientRect();
    return visible(e) && r.width > 120 && r.height > 60 && s.borderTopLeftRadius !== '0px' && (hex(s.backgroundColor) || s.boxShadow !== 'none' || parseFloat(s.borderTopWidth) > 0); });
  const cm = new Map();
  for (const e of cards) { const s = getComputedStyle(e), k = key(s, P), o = cm.get(k) || { count: 0, s }; o.count++; cm.set(k, o); }
  // the most prominent visible heading of that level (the largest), not the first in the file: that can sit in a footer
  const heading = (t) => { const e = [...document.querySelectorAll(t)].filter(visible).sort((x, y) => parseFloat(getComputedStyle(y).fontSize) - parseFloat(getComputedStyle(x).fontSize))[0];
    if (!e) return null; const s = getComputedStyle(e);
    return { fontFamily: s.fontFamily, fontSize: s.fontSize, fontWeight: s.fontWeight, lineHeight: s.lineHeight, letterSpacing: s.letterSpacing, color: hex(s.color) }; };
  const lk = new Map(); for (const e of document.querySelectorAll('a')) if (visible(e) && e.textContent.trim()) tally(lk, hex(getComputedStyle(e).color));

  return {
    sheets, blockedSheets: blocked, colorScheme: root.getPropertyValue('color-scheme').trim(),
    customProperties: vars,
    page: { background: hex(getComputedStyle(document.body).backgroundColor) || hex(root.backgroundColor), color: hex(getComputedStyle(document.body).color),
            fontFamily: getComputedStyle(document.body).fontFamily, fontSize: getComputedStyle(document.body).fontSize, lineHeight: getComputedStyle(document.body).lineHeight },
    headings: { h1: heading('h1'), h2: heading('h2'), h3: heading('h3') },
    linkColors: top(lk, 4),  // the commonest colours of visible links; the first one is usually the body link, a menu may differ
    tallies: { textColor: top(text, 8), background: top(bg, 8), border: top(border, 6), radius: top(radius, 8), shadow: top(shadow, 5),
               type: top(type, 10), fontFamily: top(families, 4), spacing: top(space, 12) },
    buttons: variants('button, [role=button], a[class*=btn], a[class*=button], input[type=submit]', P, 5),
    inputs: variants('input:not([type=hidden]):not([type=checkbox]):not([type=radio]):not([type=submit]), textarea, select', P, 3),
    cards: [...cm.values()].sort((a, b) => b.count - a.count).slice(0, 3).map(o => ({ count: o.count,
      backgroundColor: hex(o.s.backgroundColor), borderColor: hex(o.s.borderTopColor), borderWidth: o.s.borderTopWidth,
      radius: o.s.borderTopLeftRadius, padding: o.s.paddingTop + ' ' + o.s.paddingLeft, shadow: o.s.boxShadow })),
    loadedFonts: [...new Set([...document.fonts].filter(f => f.status === 'loaded').map(f => f.family.replace(/"/g, '') + ' ' + f.weight))].slice(0, 12),
    consentOverlay: !!document.querySelector('[role=dialog], [aria-modal=true], [id*=consent i], [class*=consent i], [id*=cookie i]'),
    elementsSampled: els.length
  };
}"""


def sample(url, schemes, width, wait_ms):
    from playwright.sync_api import sync_playwright

    out = {"source": "url", "url": url, "viewport": width, "schemes": {}}
    with sync_playwright() as p:
        try:
            browser = p.chromium.launch()
        except Exception:
            browser = p.chromium.launch(channel="chrome")  # the installed Chrome, when Playwright's Chromium is missing
        for scheme in schemes:
            ctx = browser.new_context(viewport={"width": width, "height": 900}, color_scheme=scheme)
            page = ctx.new_page()
            page.goto(url, wait_until="domcontentloaded", timeout=45000)
            try:
                page.wait_for_load_state("networkidle", timeout=8000)
            except Exception:
                pass
            page.wait_for_timeout(wait_ms)
            out["schemes"][scheme] = page.evaluate(SAMPLER)
            ctx.close()
        browser.close()
    light, dark = out["schemes"].get("light"), out["schemes"].get("dark")
    if light and dark:  # a site with no dark mode renders the same twice; say so instead of inventing one
        out["darkDiffers"] = light["page"] != dark["page"] or light["customProperties"] != dark["customProperties"]
    return out


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument("url")
    ap.add_argument("--schemes", default="light,dark")
    ap.add_argument("--width", type=int, default=1280)
    ap.add_argument("--wait", type=int, default=800, help="extra ms after the network is quiet")
    ap.add_argument("--out", help="write the JSON here instead of stdout")
    a = ap.parse_args(argv)
    if urlparse(a.url).scheme not in ("http", "https", "file"):
        print(f"not an http(s) or file URL: {a.url}", file=sys.stderr)
        return 2
    try:
        data = sample(a.url, [s for s in a.schemes.split(",") if s], a.width, a.wait)
    except ImportError:
        print("Playwright is missing: pip install playwright", file=sys.stderr)
        return 2
    except Exception as e:  # navigation or browser failure: nothing was sampled
        print(f"could not sample {a.url}: {e}", file=sys.stderr)
        return 2
    text = json.dumps(data, indent=2, ensure_ascii=False)
    if a.out:
        with open(a.out, "w", encoding="utf-8") as f:
            f.write(text)
    else:
        print(text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
