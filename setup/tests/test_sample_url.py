"""sample-url.py reads a page's real design values: a fixture page with known tokens, light and dark,
must come back with exactly those values (computed styles, not a guess). Skipped without Playwright + a browser."""

import importlib.util
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SCRIPT = ROOT / "ai-config/skills/aios-ui-system-extract/scripts/sample-url.py"

PAGE = """<!doctype html><meta charset=utf-8><title>fixture</title>
<style>
:root { --radius: 12px; --background: #ffffff; --foreground: #111111; --primary: oklch(0.55 0.2 260); color-scheme: light dark; }
@media (prefers-color-scheme: dark) { :root { --background: #0a0a0a; --foreground: #fafafa; } }
body { margin: 0; background: var(--background); color: var(--foreground); font: 16px/24px Georgia, serif; }
h1 { font: 700 32px/40px Georgia, serif; letter-spacing: -0.5px; }
button { background: var(--primary); color: #fff; border: 0; border-radius: var(--radius); padding: 10px 20px; font: 600 14px Georgia, serif; }
.card { width: 300px; height: 120px; margin: 16px; background: var(--background); border: 1px solid #e5e5e5; border-radius: 16px; padding: 24px; }
input { border: 1px solid #cccccc; border-radius: 6px; padding: 8px 12px; }
</style>
<h1>Heading</h1><p>Body text</p><button>Go</button><button>Again</button><input value=x>
<div class=card>Card</div>"""


def load():
    spec = importlib.util.spec_from_file_location("sample_url", SCRIPT)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


class SampleUrlTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        try:
            import playwright  # noqa: F401
        except ImportError:
            raise unittest.SkipTest("needs Playwright")
        f = Path(tempfile.mkdtemp()) / "page.html"
        f.write_text(PAGE, encoding="utf-8")
        try:
            cls.out = load().sample(f.as_uri(), ["light", "dark"], 1280, 0)
        except Exception as e:  # no browser to launch
            raise unittest.SkipTest(f"needs a Chromium or Chrome: {e}")

    def test_custom_properties_come_back_resolved_per_scheme(self):
        light, dark = (self.out["schemes"][s]["customProperties"] for s in ("light", "dark"))
        self.assertEqual(light["--background"]["hex"], "#ffffff")
        self.assertEqual(dark["--background"]["hex"], "#0a0a0a")
        self.assertEqual(light["--radius"]["raw"], "12px")
        self.assertRegex(light["--primary"]["hex"], r"^#[0-9a-f]{6}$")  # oklch() became sRGB without a parser
        self.assertTrue(self.out["darkDiffers"])
        self.assertIsNone(light["--radius"]["hex"])  # a length is not a colour: canvas would have said #000000

    def test_real_values_of_the_components(self):
        s = self.out["schemes"]["light"]
        self.assertEqual(s["page"]["background"], "#ffffff")
        self.assertEqual(s["headings"]["h1"]["fontSize"], "32px")
        self.assertEqual(s["headings"]["h1"]["fontWeight"], "700")
        btn = s["buttons"][0]
        self.assertEqual((btn["count"], btn["radius"], btn["fontSize"], btn["color"]), (2, "12px", "14px", "#ffffff"))
        self.assertEqual(s["inputs"][0]["radius"], "6px")
        self.assertEqual(s["cards"][0]["radius"], "16px")
        self.assertEqual(s["cards"][0]["borderColor"], "#e5e5e5")

    def test_it_refuses_what_is_not_a_url(self):
        self.assertEqual(load().main(["javascript:alert(1)"]), 2)


if __name__ == "__main__":
    unittest.main()
