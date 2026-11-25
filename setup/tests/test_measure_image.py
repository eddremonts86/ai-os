"""measure-image.py reads real values from pixels: a synthetic screenshot with known colours, corner radii,
text-line heights and paddings must be measured back (within a pixel or two). Skipped without Playwright + a browser."""

import importlib.util
import math
import struct
import tempfile
import unittest
import zlib
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SCRIPT = ROOT / "ai-config/skills/aios-ui-system-extract/scripts/measure-image.py"
W, H = 600, 400


def png(path, pixels):
    raw = b"".join(b"\x00" + bytes(c for px in pixels[y * W:(y + 1) * W] for c in px) for y in range(H))
    chunk = lambda t, d: struct.pack(">I", len(d)) + t + d + struct.pack(">I", zlib.crc32(t + d))
    path.write_bytes(b"\x89PNG\r\n\x1a\n" + chunk(b"IHDR", struct.pack(">IIBBBBB", W, H, 8, 2, 0, 0, 0))
                     + chunk(b"IDAT", zlib.compress(raw)) + chunk(b"IEND", b""))


def rounded(x0, y0, x1, y1, r):
    """True inside a hard-edged rounded rectangle (x1, y1 exclusive)."""
    def inside(x, y):
        if not (x0 <= x < x1 and y0 <= y < y1):
            return False
        cx = min(max(x + 0.5, x0 + r), x1 - r)
        cy = min(max(y + 0.5, y0 + r), y1 - r)
        return math.hypot(x + 0.5 - cx, y + 0.5 - cy) <= r
    return inside


def fixture(path):
    shapes = [  # painter's order: page, card (radius 16), button inside it (radius 8), two text bars, a green pill
        ((244, 244, 245), lambda x, y: True),
        ((255, 255, 255), rounded(40, 40, 340, 240, 16)),
        ((79, 70, 229), rounded(60, 170, 160, 206, 8)),
        ((17, 17, 17), lambda x, y: 60 <= x < 200 and 70 <= y < 82),
        ((17, 17, 17), lambda x, y: 60 <= x < 260 and 95 <= y < 105),
        ((22, 163, 74), rounded(380, 60, 560, 100, 20)),
        ((204, 204, 204), lambda x, y: 400 <= x < 560 and 200 <= y < 300),   # a square box with a 1px border
        ((255, 255, 255), lambda x, y: 401 <= x < 559 and 201 <= y < 299),
    ]
    pixels = []
    for y in range(H):
        for x in range(W):
            c = shapes[0][0]
            for color, inside in shapes[1:]:
                if inside(x, y):
                    c = color
            pixels.append(c)
    png(path, pixels)


def load():
    spec = importlib.util.spec_from_file_location("measure_image", SCRIPT)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


class MeasureImageTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        try:
            import playwright  # noqa: F401
        except ImportError:
            raise unittest.SkipTest("needs Playwright")
        cls.dir = Path(tempfile.mkdtemp())
        cls.path = cls.dir / "shot.png"
        fixture(cls.path)
        cls.mod = load()
        try:
            cls.out = cls.mod.measure(str(cls.path))
        except Exception as e:  # no browser to launch
            raise unittest.SkipTest(f"needs a Chromium or Chrome: {e}")
        cls.box = {b["hex"]: b for b in sorted(cls.out["boxes"], key=lambda b: b["width"])}  # two white boxes: the wider wins

    def test_palette_and_page_background(self):
        self.assertEqual(self.out["background"], "#f4f4f5")
        self.assertTrue({"#ffffff", "#4f46e5", "#16a34a", "#111111"} <= {p["hex"] for p in self.out["palette"]})

    def test_corner_radius_of_each_box(self):
        self.assertAlmostEqual(self.box["#ffffff"]["radius"], 16, delta=2)
        self.assertAlmostEqual(self.box["#4f46e5"]["radius"], 8, delta=1.5)
        self.assertTrue(self.box["#16a34a"]["pill"])

    def test_a_square_box_with_a_border_is_not_read_as_rounded(self):
        boxed = next(b for b in self.out["boxes"] if (b["width"], b["height"]) == (158, 98))
        self.assertLessEqual(boxed["radius"] or 0, 1.5)

    def test_size_ink_and_text_lines_of_the_card(self):
        card = self.box["#ffffff"]
        self.assertEqual((card["width"], card["height"]), (300, 200))
        self.assertEqual(card["ink"]["hex"], "#111111")
        self.assertEqual([line["inkHeight"] for line in card["textLines"]], [12, 10])

    def test_padding_inside_the_card_is_measured(self):
        self.assertIn(20, [s["value"] for s in self.out["spacing"]])  # the button sits 20px from the card's left edge

    def test_device_scale_divides_lengths(self):
        out = self.mod.measure(str(self.path), scale=2)
        card = next(b for b in out["boxes"] if b["hex"] == "#ffffff")
        self.assertEqual((card["width"], card["height"]), (150, 100))

    def test_it_refuses_what_is_not_an_image(self):
        self.assertEqual(self.mod.main([str(self.dir / "missing.png")]), 2)
        (self.dir / "x.txt").write_text("hi")
        self.assertEqual(self.mod.main([str(self.dir / "x.txt")]), 2)


if __name__ == "__main__":
    unittest.main()
