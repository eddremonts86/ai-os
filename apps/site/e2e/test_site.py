"""End-to-end checks of the built landing page, in a real Chromium.

Serves dist/ on a free local port and drives it with Playwright. Build first (`pnpm build`);
`pnpm test:e2e` does both. Needs `pip install playwright && playwright install chromium`.
"""

import functools
import gzip
import http.server
import json
import re
import threading
import unittest
from contextlib import contextmanager
from pathlib import Path

try:
    from playwright.sync_api import sync_playwright
except ImportError:  # pragma: no cover - reported as a skip, CI installs it
    sync_playwright = None

SITE = Path(__file__).resolve().parent.parent
DIST = SITE / "dist"
STATS = json.loads((SITE / "src" / "stats.json").read_text(encoding="utf-8"))
PACKAGE = json.loads((SITE.parent / "create-ai-os" / "package.json").read_text(encoding="utf-8"))["name"]
COMMAND = f"npx {PACKAGE}"
DESKTOP = {"width": 1280, "height": 800}
PHONE = {"width": 375, "height": 812}
FIRST_LOAD_GZIP_BUDGET = 150_000  # bytes, entry JS + CSS from dist/index.html


class QuietHandler(http.server.SimpleHTTPRequestHandler):
    def log_message(self, *args):
        pass


@unittest.skipIf(sync_playwright is None, "playwright is not installed")
@unittest.skipUnless((DIST / "index.html").is_file(), "run `pnpm build` first: dist/ is missing")
class SiteE2E(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        handler = functools.partial(QuietHandler, directory=str(DIST))
        cls.server = http.server.ThreadingHTTPServer(("127.0.0.1", 0), handler)
        threading.Thread(target=cls.server.serve_forever, daemon=True).start()
        cls.url = f"http://127.0.0.1:{cls.server.server_address[1]}/"
        cls.pw = sync_playwright().start()
        cls.browser = cls.pw.chromium.launch()

    @classmethod
    def tearDownClass(cls):
        cls.browser.close()
        cls.pw.stop()
        cls.server.shutdown()
        cls.server.server_close()

    @contextmanager
    def visit(self, viewport=DESKTOP, **context_options):
        context = self.browser.new_context(viewport=viewport, **context_options)
        page = context.new_page()
        problems = []
        page.on("console", lambda m: problems.append(f"console.{m.type}: {m.text}") if m.type in ("error", "warning") else None)
        page.on("pageerror", lambda e: problems.append(f"pageerror: {e}"))
        page.on("requestfailed", lambda r: problems.append(f"request failed: {r.url}"))
        page.on("response", lambda r: problems.append(f"HTTP {r.status}: {r.url}") if r.status >= 400 else None)
        page.goto(self.url, wait_until="networkidle")
        try:
            yield page
            self.assertEqual(problems, [], "the page logged errors, warnings or failed requests")
        finally:
            context.close()

    def test_loads_cleanly_with_the_page_identity(self):
        with self.visit() as page:
            self.assertIn("AI-OS", page.title())
            self.assertEqual(page.locator("h1").count(), 1)
            self.assertIn("operating system", page.locator("h1").inner_text())
            self.assertEqual(page.locator("main").count(), 1)

    def test_hero_quotes_the_published_numbers(self):
        with self.visit() as page:
            hero = page.locator("#top").inner_text()
            self.assertIn(f"{STATS['skills_linked']} skills and {STATS['mcp_enabled']} MCP servers", hero)

    def test_in_page_anchors_resolve_and_scroll_to_their_target(self):
        with self.visit() as page:
            hrefs = page.eval_on_selector_all("a[href^='#']", "els => els.map(e => e.getAttribute('href'))")
            self.assertIn("#install", hrefs)
            for href in hrefs:
                self.assertEqual(page.locator(href).count(), 1, href)
            page.get_by_role("link", name="See what it installs").click()
            page.wait_for_function("location.hash === '#install'")
            page.wait_for_function(
                "() => { const r = document.getElementById('install').getBoundingClientRect(); return r.top < innerHeight && r.bottom > 0 }"
            )

    def test_copy_button_puts_the_command_on_the_clipboard(self):
        with self.visit(permissions=["clipboard-read", "clipboard-write"]) as page:
            button = page.get_by_role("button", name=COMMAND)
            button.click()
            page.wait_for_function("document.querySelector('[aria-live=polite]').textContent === 'Copied'")
            self.assertEqual(page.evaluate("navigator.clipboard.readText()"), COMMAND)
            page.wait_for_function("document.querySelector('[aria-live=polite]').textContent === ''", timeout=5000)

    @staticmethod
    def install_panel(page):
        # The previous panel can linger while its exit animation runs; wait until only one is left.
        page.wait_for_function("document.querySelectorAll('#install pre').length === 1")
        return page.locator("#install pre").inner_text()

    def test_install_tabs_switch_by_mouse_and_keyboard(self):
        with self.visit() as page:
            tabs = page.get_by_role("tab")
            self.assertEqual(tabs.all_inner_texts(), ["macOS", "Windows", "Linux"])
            self.assertEqual(tabs.nth(0).get_attribute("aria-selected"), "true")
            tabs.nth(1).click()
            self.assertIn("powershell -ExecutionPolicy Bypass", self.install_panel(page))
            tabs.nth(0).focus()
            page.keyboard.press("ArrowRight")
            self.assertEqual(tabs.nth(1).get_attribute("aria-selected"), "true")
            tabs.nth(1).click()
            tabs.nth(2).click()
            self.assertIn("Debian / Ubuntu", self.install_panel(page))
            for index in range(3):
                tabs.nth(index).click()
                self.assertIn(COMMAND, self.install_panel(page))

    def test_hero_demo_types_the_command_and_ends_ready(self):
        with self.visit() as page:
            demo = page.locator("#top figure")
            self.assertIn(f"{STATS['skills_linked']} skills", demo.get_attribute("aria-label"))
            page.wait_for_function(
                "text => document.querySelector('#top figure .ss-term__cmd')?.textContent === text", arg=COMMAND, timeout=8000
            )
            page.wait_for_function(
                "() => document.querySelector('#top figure .ai-badge')?.dataset.tone === 'success'", timeout=12000
            )
            self.assertIn(str(STATS["skills_linked"]), demo.inner_text())

    def test_install_counts_run_up_to_the_published_values(self):
        with self.visit() as page:
            page.locator("#install ul").scroll_into_view_if_needed()
            expected = [f"{STATS[key]:,}" for key in ("brew_total", "npm_globals", "pip_packages", "skills_linked", "commands")]
            page.wait_for_function(
                "expected => [...document.querySelectorAll('#install ul li [aria-hidden=true]')].map(e => e.textContent).join() === expected.join()",
                arg=expected,
                timeout=8000,
            )

    def test_reduced_motion_shows_final_values_without_counting(self):
        with self.visit(reduced_motion="reduce") as page:
            page.locator("#install ul").scroll_into_view_if_needed()
            page.wait_for_timeout(300)
            shown = page.eval_on_selector_all("#install ul li [aria-hidden=true]", "els => els.map(e => e.textContent)")
            self.assertEqual(shown, [f"{STATS[key]:,}" for key in ("brew_total", "npm_globals", "pip_packages", "skills_linked", "commands")])

    def test_screenshot_image_loads_with_its_intrinsic_size(self):
        with self.visit() as page:
            image = page.locator("img[alt^='Plansmith']")
            image.scroll_into_view_if_needed()
            page.wait_for_function("document.querySelector(\"img[alt^='Plansmith']\").complete")
            natural = image.evaluate("img => [img.naturalWidth, img.naturalHeight]")
            self.assertEqual(natural, [1200, 630])

    def test_no_horizontal_scroll_on_phone_or_desktop(self):
        for viewport in (PHONE, DESKTOP):
            with self.visit(viewport=viewport) as page:
                overflow = page.evaluate("document.documentElement.scrollWidth - innerWidth")
                self.assertLessEqual(overflow, 0, f"{viewport}: page is {overflow}px wider than the viewport")

    def test_every_heading_is_visible_text_in_reading_order(self):
        with self.visit() as page:
            levels = page.eval_on_selector_all("h1, h2, h3", "els => els.map(e => Number(e.tagName[1]))")
            self.assertEqual(levels[0], 1)
            self.assertTrue(all(b - a <= 1 for a, b in zip(levels, levels[1:])), f"heading levels skip a step: {levels}")

    def test_first_load_js_and_css_stay_within_the_gzip_budget(self):
        # From the bundle-optimizer audit (2026-11-14): 158.7 kB before LazyMotion, about 145 kB after. Lower the
        # budget when the page gets lighter; raise it only with a reason in the commit.
        html = (DIST / "index.html").read_text(encoding="utf-8")
        files = re.findall(r'(?:src|href)="/?(assets/[^"]+\.(?:js|css))"', html)
        self.assertTrue(files, "no entry JS/CSS found in dist/index.html")
        total = sum(len(gzip.compress((DIST / f).read_bytes(), 9)) for f in files)
        self.assertLessEqual(total, FIRST_LOAD_GZIP_BUDGET, f"first-load JS+CSS is {total} bytes gzip: {files}")

    def test_core_web_vitals_and_no_long_tasks_after_load(self):
        # Lab numbers on a local unthrottled build: a regression alarm, not field data (perf-auditor does that).
        context = self.browser.new_context(viewport=DESKTOP)
        page = context.new_page()
        page.add_init_script("""
            window.__v = {lcp: 0, cls: 0, long: []};
            new PerformanceObserver(l => l.getEntries().forEach(e => window.__v.lcp = e.startTime))
                .observe({type: 'largest-contentful-paint', buffered: true});
            new PerformanceObserver(l => l.getEntries().forEach(e => { if (!e.hadRecentInput) window.__v.cls += e.value }))
                .observe({type: 'layout-shift', buffered: true});
            new PerformanceObserver(l => l.getEntries().forEach(e => window.__v.long.push([e.startTime, e.duration])))
                .observe({type: 'longtask', buffered: true});
        """)
        try:
            page.goto(self.url, wait_until="networkidle")
            page.mouse.wheel(0, 4000)
            page.wait_for_timeout(1500)
            v = page.evaluate("window.__v")
            self.assertLess(v["lcp"], 2500, f"LCP {v['lcp']:.0f} ms")
            self.assertLess(v["cls"], 0.1, f"CLS {v['cls']:.3f}")
            after_load = [d for start, d in v["long"] if start > v["lcp"] and d > 200]
            self.assertEqual(after_load, [], f"main-thread tasks over 200 ms after LCP: {after_load}")
        finally:
            context.close()

    def test_repeated_reloads_do_not_grow_the_dom_or_log_errors(self):
        # A small stability check (stability-tester goes further): ten reloads, same DOM size, no errors.
        with self.visit() as page:
            sizes = []
            for _ in range(10):
                page.reload(wait_until="networkidle")
                sizes.append(page.evaluate("document.getElementsByTagName('*').length"))
            self.assertLessEqual(max(sizes) - min(sizes), 5, f"DOM size drifts across reloads: {sizes}")


if __name__ == "__main__":
    unittest.main()
