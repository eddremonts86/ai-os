#!/usr/bin/env python3
"""aios-ui-verify: open pages in a real browser and fail on mechanical UI defects.

  verify.py URL_OR_FILE [...] [--out DIR] [--widths 375,768,1280] [--schemes light,dark]
                              [--axe PATH] [--wait MS] [--slices N]

For every page x width x colour scheme it saves a full-page screenshot, the first screen
(or --slices N consecutive screens, readable where the full page is not) and checks:
  - console errors, uncaught exceptions, failed or 4xx/5xx requests
  - horizontal overflow (the page is wider than the viewport)
  - accessibility with axe-core: serious/critical fail, moderate/minor are reported
  - CSS animations still running under prefers-reduced-motion (reported, never fails)

Exit 0 = PASS, 1 = FAIL, 2 = could not run. axe-core is looked up in the nearest
node_modules/axe-core up from the current directory, or --axe; without it the run says
"a11y NOT CHECKED" in the verdict instead of passing silently.

Needs Playwright with Chromium: run with ~/.ai-os/venv/bin/python (the AI-OS venv has it).
It judges mechanics only. Whether the page looks right is for someone to look at the screenshots.
"""

import argparse
import json
import re
import sys
from pathlib import Path
from urllib.parse import urlparse

SERIOUS = {"serious", "critical"}


def to_url(arg):
    if urlparse(arg).scheme in ("http", "https", "file"):
        return arg
    p = Path(arg).expanduser().resolve()
    if p.exists():
        return p.as_uri()
    raise SystemExit(f"not a URL and not a file: {arg}")


def find_axe(explicit):
    if explicit:
        p = Path(explicit).expanduser()
        return p if p.is_file() else None
    for d in [Path.cwd(), *Path.cwd().parents]:
        p = d / "node_modules" / "axe-core" / "axe.min.js"
        if p.is_file():
            return p
    return None


def slug(url, width, scheme):
    u = urlparse(url)
    s = re.sub(r"[^a-z0-9]+", "-", (u.netloc + u.path).lower()).strip("-") or "page"
    return f"{s}-{width}-{scheme}.png"


def settle(page, wait_ms):
    """Load, let the network go quiet, then scroll through so reveal-on-scroll content exists."""
    try:
        page.wait_for_load_state("networkidle", timeout=6000)
    except Exception:
        pass
    height = page.evaluate("document.documentElement.scrollHeight")
    for y in range(0, height, max(300, page.viewport_size["height"] // 2)):
        page.evaluate(f"window.scrollTo(0, {y})")
        page.wait_for_timeout(80)
    # loading="lazy" images only start once scrolled near; wait for them, or a card shows up empty in the shot.
    page.evaluate("""() => Promise.all([...document.images].map(i => i.complete ? 0 :
        new Promise(r => { i.onload = i.onerror = r; setTimeout(r, 4000); })))""")
    page.evaluate("window.scrollTo(0, 0)")
    page.wait_for_timeout(wait_ms)


OVERFLOW_JS = """() => {
  const w = document.documentElement.clientWidth;
  const bad = [...document.querySelectorAll('body *')].filter(e => {
    const r = e.getBoundingClientRect();
    return r.width > 0 && r.right > w + 1 && getComputedStyle(e).position !== 'fixed';
  }).slice(0, 3).map(e => e.tagName.toLowerCase() + (e.className && typeof e.className === 'string' ? '.' + e.className.trim().split(/\\s+/)[0] : ''));
  return { over: document.documentElement.scrollWidth - w, elements: bad };
}"""


def check(browser, url, width, scheme, out, axe_src, wait_ms, slices):
    ctx = browser.new_context(viewport={"width": width, "height": 800}, color_scheme=scheme)
    page = ctx.new_page()
    errors, failed = [], []
    page.on("console", lambda m: errors.append(f"console: {m.text[:160]}") if m.type == "error" else None)
    page.on("pageerror", lambda e: errors.append(f"exception: {str(e)[:160]}"))
    page.on("requestfailed", lambda r: failed.append(f"{r.url[-80:]} ({r.failure})"))
    page.on("response", lambda r: failed.append(f"{r.url[-80:]} ({r.status})") if r.status >= 400 else None)
    page.goto(url, wait_until="load", timeout=30000)
    settle(page, wait_ms)
    shot = out / slug(url, width, scheme)
    page.screenshot(path=str(shot), full_page=True)
    # A tall page shrinks to an unreadable strip, so also keep readable viewport-sized pieces:
    # the first screen always, and `slices` consecutive screens when asked.
    vh = page.viewport_size["height"]
    total = page.evaluate("document.documentElement.scrollHeight")
    for i in range(max(slices, 1)):
        y = i * vh
        if y >= total:
            break
        name = shot.stem + ("-fold" if i == 0 and slices == 0 else f"-s{i + 1}") + ".png"
        page.screenshot(path=str(out / name), full_page=True,
                        clip={"x": 0, "y": y, "width": width, "height": min(vh, total - y)})

    problems, notes = [], []
    problems += errors[:3] + [f"request failed: {f}" for f in failed[:3]]
    o = page.evaluate(OVERFLOW_JS)
    if o["over"] > 1:
        problems.append(f"horizontal overflow {o['over']}px: {', '.join(o['elements']) or 'unknown element'}")

    axe = "not run"
    if axe_src:
        page.add_script_tag(content=axe_src.read_text(encoding="utf-8"))
        res = page.evaluate("axe.run(document, {resultTypes: ['violations']})")
        bad = [v for v in res["violations"] if v["impact"] in SERIOUS]
        rest = [v for v in res["violations"] if v["impact"] not in SERIOUS]
        axe = f"{len(bad)} serious, {len(rest)} minor"
        problems += [f"a11y {v['impact']}: {v['id']} ({len(v['nodes'])} nodes)" for v in bad[:4]]
        notes += [f"a11y {v['impact']}: {v['id']}" for v in rest[:3]]

    ctx.close()
    ctx = browser.new_context(viewport={"width": width, "height": 800}, color_scheme=scheme, reduced_motion="reduce")
    p2 = ctx.new_page()
    p2.goto(url, wait_until="load", timeout=30000)
    p2.wait_for_timeout(300)
    running = p2.evaluate("document.getAnimations().filter(a => a.constructor.name === 'CSSAnimation' && a.playState === 'running').length")
    if running:
        notes.append(f"{running} CSS animation(s) still running under prefers-reduced-motion")
    ctx.close()
    return {"url": url, "width": width, "scheme": scheme, "ok": not problems, "problems": problems,
            "notes": notes, "axe": axe, "screenshot": str(shot)}


def main():
    ap = argparse.ArgumentParser(description="Mechanical UI gate: screenshots + console + overflow + axe.")
    ap.add_argument("pages", nargs="+")
    ap.add_argument("--out", default="ui-verify")
    ap.add_argument("--widths", default="375,768,1280")
    ap.add_argument("--schemes", default="light,dark")
    ap.add_argument("--axe")
    ap.add_argument("--wait", type=int, default=500)
    ap.add_argument("--slices", type=int, default=0, help="also save N consecutive viewport-sized screenshots (default: just the first screen)")
    a = ap.parse_args()
    try:
        from playwright.sync_api import sync_playwright
    except ImportError:
        print("playwright is not installed for this Python. Run with ~/.ai-os/venv/bin/python", file=sys.stderr)
        return 2
    urls = [to_url(p) for p in a.pages]
    widths = [int(w) for w in a.widths.split(",")]
    schemes = a.schemes.split(",")
    out = Path(a.out)
    out.mkdir(parents=True, exist_ok=True)
    axe_path = find_axe(a.axe)
    axe_src = axe_path
    results = []
    with sync_playwright() as p:
        browser = p.chromium.launch()
        for url in urls:
            for w in widths:
                for s in schemes:
                    try:
                        results.append(check(browser, url, w, s, out, axe_src, a.wait, a.slices))
                    except Exception as e:
                        results.append({"url": url, "width": w, "scheme": s, "ok": False,
                                        "problems": [f"could not load: {str(e)[:200]}"], "notes": [], "axe": "not run", "screenshot": ""})
        browser.close()

    for r in results:
        print(f"{'PASS' if r['ok'] else 'FAIL'}  {r['url']}  {r['width']}px {r['scheme']}  a11y: {r['axe']}")
        for x in r["problems"]:
            print(f"      x {x}")
        for x in r["notes"]:
            print(f"      . {x}")
    failed = [r for r in results if not r["ok"]]
    (out / "report.json").write_text(json.dumps(results, indent=2), encoding="utf-8")
    caveat = "" if axe_path else " (a11y NOT CHECKED: no axe-core found, install it in the project or pass --axe)"
    print(f"\n{'FAIL' if failed else 'PASS'}: {len(results) - len(failed)}/{len(results)} combinations ok{caveat}")
    print(f"screenshots + report.json: {out.resolve()}")
    return 1 if failed else 0


if __name__ == "__main__":
    for _s in (sys.stdout, sys.stderr):
        if hasattr(_s, "reconfigure"):
            _s.reconfigure(encoding="utf-8", errors="replace")
    sys.exit(main())
