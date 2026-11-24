"""aios-ui-system-check's tokens.py: scan a project's de facto tokens, WCAG contrast, and the contract check."""

import contextlib
import importlib.util
import io
import json
import re
import shutil
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
spec = importlib.util.spec_from_file_location("tokens", ROOT / "ai-config/skills/aios-ui-system-check/scripts/tokens.py")
tokens = importlib.util.module_from_spec(spec)
spec.loader.exec_module(tokens)

BRAND = (ROOT / "context/global/06_brand.md").read_text(encoding="utf-8")
# | `void` | `oklch(0.14 0.012 275)` | `#08090e` | Page background |
PALETTE = {name: (oklch, hexa) for name, oklch, hexa in
           re.findall(r"^\| `([\w-]+)` \| `(oklch\([^)]*\))` \| `(#[0-9a-f]{6})` \|", BRAND, re.M)}

SURFACES = ("background", "card", "popover", "primary", "secondary", "muted", "accent", "sidebar", "sidebar-primary",
            "sidebar-accent")
OTHERS = ("destructive", "border", "input", "ring", "chart-1", "chart-2", "chart-3", "chart-4", "chart-5",
          "sidebar-border", "sidebar-ring")
SINGLE = {"radius": "0.5rem", "font-sans": "'Inter', sans-serif", "font-mono": "ui-monospace, monospace",
          "shadow-sm": "0 1px 2px rgb(0 0 0 / 0.05)", "shadow-md": "0 4px 6px rgb(0 0 0 / 0.1)",
          "shadow-lg": "0 10px 15px rgb(0 0 0 / 0.1)", "ease-out": "cubic-bezier(0.16, 1, 0.3, 1)",
          "duration-fast": "120ms", "duration-base": "200ms"}


def palette(surface, text):
    """A complete colour contract: every surface one colour, every text colour another, the rest a mid grey."""
    p = {name: surface for name in SURFACES}
    p.update({name + "-foreground": text for name in SURFACES if name != "background"})
    p["foreground"] = text
    p.update({name: "oklch(0.6 0 0)" for name in OTHERS})
    return p


LIGHT = palette("oklch(1 0 0)", "oklch(0.145 0 0)")
DARK = palette("#0a0a0a", "rgb(250 250 250)")
LIGHT["destructive"], DARK["destructive"] = "#b91c1c", "#f87171"  # error text must pass on its own background


def block(selector, values):
    return selector + " {\n" + "".join(f"  --{k}: {v};\n" for k, v in values.items()) + "}\n"


def stylesheet(light=None, dark=None, single=None):
    return (block("@theme inline", SINGLE if single is None else single) + block(":root", light or LIGHT)
            + block(".dark", dark or DARK))


def design_md(light=None, dark=None):
    colors = "".join(f'  {k}: "{v}"\n  {k}-dark: "{(dark or DARK)[k]}"\n' for k, v in (light or LIGHT).items())
    return ("---\nname: fixture\ndescription: a test system\ncolors:\n  # every contract colour, light then dark\n"
            + colors + 'rounded:\n  base: "0.5rem"\ncomponents:\n  card: { backgroundColor: "{colors.card}" }\n'
            "---\n\n# Design: fixture\n\n## Exports\n- not ours: #123456\n")


class Fixtures(unittest.TestCase):
    def project(self, files):
        root = Path(tempfile.mkdtemp())
        self.addCleanup(shutil.rmtree, root, True)
        for name, text in files.items():
            (root / name).parent.mkdir(parents=True, exist_ok=True)
            (root / name).write_text(text, encoding="utf-8")
        return root

    def system(self, css=None, md=None):
        return self.project({"components.json": json.dumps({"tailwind": {"css": "src/index.css"}}),
                             "src/index.css": stylesheet() if css is None else css,
                             "DESIGN.md": design_md() if md is None else md})

    def cli(self, *argv):
        out = io.StringIO()
        with contextlib.redirect_stdout(out), contextlib.redirect_stderr(io.StringIO()):
            code = tokens.main([str(a) for a in argv])
        return code, out.getvalue()


class ColourTests(unittest.TestCase):
    def near(self, value, expected, alpha=1.0):
        r, g, b, a = tokens.parse_color(value)
        self.assertLessEqual(max(abs(x - y) for x, y in zip((r, g, b), expected)), 1, value)
        self.assertAlmostEqual(a, alpha, 2, value)

    def test_hex_rgb_and_hsl_in_legacy_and_modern_syntax(self):
        for value, rgb, alpha in [
            ("#fff", (255, 255, 255), 1), ("#08090E", (8, 9, 14), 1), ("#ffffff80", (255, 255, 255), 0.5),
            ("#f008", (255, 0, 0), 0.53), ("rgb(255, 0, 0)", (255, 0, 0), 1), ("rgba(255,0,0,0.5)", (255, 0, 0), 0.5),
            ("rgb(255 0 0 / 50%)", (255, 0, 0), 0.5), ("rgb(100% 0% 0%)", (255, 0, 0), 1),
            ("hsl(0, 100%, 50%)", (255, 0, 0), 1), ("hsla(0, 100%, 50%, 0.5)", (255, 0, 0), 0.5),
            ("hsl(120 100% 25%)", (0, 128, 0), 1), ("hsl(210deg 50% 40% / 25%)", (51, 102, 153), 0.25),
            ("  RGB(0 0 0)  ", (0, 0, 0), 1),
        ]:
            self.near(value, rgb, alpha)

    def test_oklch_lightness_as_number_or_percent_and_alpha(self):
        self.near("oklch(1 0 0)", (255, 255, 255))
        self.near("oklch(0% 0 0)", (0, 0, 0))
        self.near("oklch(62.8% 0.2577 29.23)", (255, 0, 0))
        self.near("oklch(0.628 0.2577 29.23deg / 0.4)", (255, 0, 0), 0.4)
        self.near("oklch(1 0 0 / 10%)", (255, 255, 255), 0.1)
        self.assertEqual(tokens.oklch_to_srgb(0.5, 0.5, 30)[0], 255)  # out of gamut: clamped, not wrapped

    def test_oklch_conversion_matches_every_brand_palette_row(self):
        self.assertEqual(len(PALETTE), 12)
        for name, (oklch, hexa) in PALETTE.items():
            got, want = tokens.parse_color(oklch)[:3], tokens.parse_color(hexa)[:3]
            self.assertLessEqual(max(abs(a - b) for a, b in zip(got, want)), 1, f"{name}: {oklch} gave {got}, table says {want}")

    def test_an_unreadable_value_raises_valueerror(self):
        for value in ["tomato", "oklch(1 0)", "#12", "#ggg", "color-mix(in oklch, red, blue)", "rgb(a b c)", ""]:
            with self.assertRaises(ValueError, msg=value):
                tokens.parse_color(value)

    def test_var_resolves_through_the_block_then_root_with_a_cycle_guard(self):
        blocks = tokens.parse_css(":root { --brand: #b3ee55; --ring: var(--brand); --a: var(--b); --b: var(--a); "
                                  "--gone: var(--nope); --fallback: var(--nope, #000); }\n.dark { --brand: #ff49b6; }")
        scopes = tokens.modes(blocks)
        self.assertEqual(tokens.color("--ring", scopes["light"])[:3], (0xb3, 0xee, 0x55))
        self.assertEqual(tokens.color("--ring", scopes["dark"])[:3], (0xff, 0x49, 0xb6))
        self.assertEqual(tokens.color("--fallback", scopes["light"])[:3], (0, 0, 0))
        for name in ("--a", "--gone"):
            with self.assertRaises(ValueError):
                tokens.color(name, scopes["light"])


class ContrastTests(unittest.TestCase):
    def test_wcag_ratio(self):
        self.assertAlmostEqual(tokens.ratio((0, 0, 0), (255, 255, 255)), 21.0, 6)
        self.assertAlmostEqual(tokens.ratio((255, 255, 255), (0, 0, 0)), 21.0, 6)
        self.assertAlmostEqual(tokens.ratio((119, 119, 119), (255, 255, 255)), 4.48, 2)

    def test_brand_ratios_from_the_hex_column(self):
        published = dict(re.findall(r"(\w+) ([\d.]+):1", re.search(r"^Dark on `#08090e`: (.*)$", BRAND, re.M).group(1)))
        self.assertEqual(published, {"ink": "18.26", "muted": "8.01", "faint": "4.27", "acid": "14.47", "cyan": "12.30"})
        void = tokens.parse_color(PALETTE["void"][1])[:3]
        for name, want in published.items():
            got = tokens.ratio(tokens.parse_color(PALETTE[name][1])[:3], void)
            self.assertEqual(f"{got:.2f}", want, name)

    def test_pairs_thresholds_and_both_modes(self):
        h = {name: hexa for name, (_, hexa) in PALETTE.items()}
        rows = tokens.contrast(tokens.parse_css(
            ":root { --background: #fff; --foreground: #000; --ring: #999; }\n"
            f".dark {{ --background: {h['void']}; --foreground: {h['ink']}; --card: {h['panel']}; "
            f"--muted: {h['panel-2']}; --muted-foreground: {h['faint']}; --primary: {h['acid']}; "
            f"--primary-foreground: {h['void']}; --ring: {h['acid']}; }}"))
        got = {(r["mode"], r["fg"], r["bg"]): r for r in rows}
        self.assertEqual(set(got), {
            ("light", "--foreground", "--background"), ("light", "--ring", "--background"),
            ("dark", "--foreground", "--background"), ("dark", "--ring", "--background"),
            ("dark", "--muted-foreground", "--background"), ("dark", "--muted-foreground", "--card"),
            ("dark", "--muted-foreground", "--muted"), ("dark", "--primary-foreground", "--primary"),
            ("dark", "--ring", "--card")})
        faint = got["dark", "--muted-foreground", "--background"]
        self.assertEqual((round(faint["ratio"], 2), faint["need"], faint["ok"]), (4.27, 4.5, False))
        self.assertTrue(got["dark", "--foreground", "--background"]["ok"])
        self.assertEqual(got["dark", "--ring", "--background"]["need"], 3.0)
        light_ring = got["light", "--ring", "--background"]  # #999 on white is 2.85: under 3:1
        self.assertEqual((round(light_ring["ratio"], 2), light_ring["ok"]), (2.85, False))

    def test_a_translucent_foreground_is_composited_on_its_background(self):
        rows = tokens.contrast(tokens.parse_css(":root { --background: #fff; --foreground: rgb(0 0 0 / 50%); }"))
        self.assertEqual(round(rows[0]["ratio"], 2), round(tokens.ratio((128, 128, 128), (255, 255, 255)), 2))

    def test_last_declaration_wins_when_dark_appears_twice(self):
        blocks = tokens.parse_css(
            "/* .dark { --background: #f00; } */\n:root { --background: #fff; --foreground: #000; }\n"
            ".dark { --background: #eee; --foreground: #ddd; }\n@layer base { body { color: red; } }\n"
            ".dark {\n  --background: #08090e;\n  --foreground: #f4f5f9\n}\n")
        self.assertEqual(blocks[".dark"], {"--background": "#08090e", "--foreground": "#f4f5f9"})
        dark = [r for r in tokens.contrast(blocks) if r["mode"] == "dark"]
        self.assertEqual([round(r["ratio"], 2) for r in dark], [18.26])

    def test_selectors_and_nesting(self):
        blocks = tokens.parse_css(
            "@theme inline { --font-sans: 'Inter', sans-serif; }\n@theme { --radius: 4px; }\n"
            "@layer base { :root, :host { --a: 1; } }\n"
            "@media (prefers-color-scheme: dark) { :root { --a: 2; } }\n.card { --pad: 8px; color: red; }\n")
        self.assertEqual(blocks["@theme"], {"--font-sans": "'Inter', sans-serif", "--radius": "4px"})
        self.assertEqual(blocks[":root"], {"--a": "1"})  # a layer is transparent, a media query is not
        self.assertEqual(blocks["@media (prefers-color-scheme: dark) :root"], {"--a": "2"})
        self.assertEqual(blocks[".card"], {"--pad": "8px"})

    def test_cli_prints_each_pair_and_exits_1_on_a_failure(self):
        root = Path(tempfile.mkdtemp())
        self.addCleanup(shutil.rmtree, root, True)
        (root / "ok.css").write_text(":root { --background: #fff; --foreground: #000; }", encoding="utf-8")
        (root / "bad.css").write_text(":root { --background: #fff; --foreground: #999; --ring: nope; }", encoding="utf-8")
        (root / "empty.css").write_text("body { color: red; }", encoding="utf-8")
        out = io.StringIO()
        with contextlib.redirect_stdout(out), contextlib.redirect_stderr(io.StringIO()):
            self.assertEqual(tokens.main(["contrast", str(root / "ok.css")]), 0)
            self.assertEqual(tokens.main(["contrast", str(root / "bad.css")]), 1)
            self.assertEqual(tokens.main(["contrast", str(root / "empty.css")]), 1)
            self.assertEqual(tokens.main(["contrast", str(root / "missing.css")]), 2)
        self.assertIn("PASS light --foreground on --background 21.00", out.getvalue())
        self.assertIn("FAIL light --foreground on --background 2.85", out.getvalue())
        self.assertIn("FAIL light --ring on --background: --ring: cannot read colour 'nope'", out.getvalue())


class DiscoveryTests(Fixtures):
    def test_components_json_names_the_stylesheet(self):
        root = self.project({"components.json": json.dumps({"tailwind": {"css": "styles/app.css"}}),
                             "styles/app.css": "", "src/index.css": ""})
        self.assertEqual(tokens.find_stylesheet(root), root / "styles/app.css")

    def test_fallback_list_in_order(self):
        root = self.project({"src/app/globals.css": "", "app/globals.css": ""})
        self.assertEqual(tokens.find_stylesheet(root), root / "app/globals.css")
        (root / "src/styles").mkdir()
        (root / "src/styles/globals.css").write_text("", encoding="utf-8")
        self.assertEqual(tokens.find_stylesheet(root), root / "src/styles/globals.css")
        (root / "src/index.css").write_text("", encoding="utf-8")
        self.assertEqual(tokens.find_stylesheet(root), root / "src/index.css")

    def test_a_components_json_that_is_broken_or_points_nowhere_falls_back(self):
        for manifest in ("{not json", json.dumps({"tailwind": {"css": "gone.css"}}), json.dumps({"style": "x"})):
            root = self.project({"components.json": manifest, "src/app/globals.css": ""})
            self.assertEqual(tokens.find_stylesheet(root), root / "src/app/globals.css")
        self.assertIsNone(tokens.find_stylesheet(self.project({"main.css": ""})))


class ScanTests(Fixtures):
    def scanned(self):
        return self.project({
            "components.json": json.dumps({"tailwind": {"css": "src/index.css"}}),
            "src/index.css":
                "@theme inline {\n  --font-sans: \"Inter\", sans-serif;\n  --color-primary: var(--primary);\n}\n"
                ":root {\n  --background: #ffffff;\n  --foreground: #111111;\n  --radius: 0.5rem;\n}\n"
                ".dark {\n  --background: #111111;\n}\n"
                ".card { border-radius: 12px; box-shadow: 0 1px 2px rgb(0 0 0 / 0.1); font-family: Georgia, serif; color: #FFF; }\n"
                ".chip { border-radius: var(--radius); box-shadow: none; }\n",
            "src/App.tsx":
                'export const A = () => <div className="bg-blue-500 hover:bg-blue-500 text-red-600 p-[13px] bg-[#fff] '
                'data-[state=open]:flex group-data-[size=sm]/tabs:flex w-[2px]/50 bg-primary" style={{ borderRadius: 12, color: "#fff" }}>&#123; <a href="#faq">x</a></div>\n',
            "src/other.css": ":root { --stray: 1; }\n",
            "node_modules/x/index.css": ".x { color: #123456; }\n",
            "dist/app.css": ".x { color: #654321; }\n",
        })

    def test_custom_properties_per_selector(self):
        inv = tokens.scan(self.scanned())
        self.assertEqual(inv["stylesheet"], "src/index.css")
        self.assertEqual(inv["properties"][":root"], {"--background": "#ffffff", "--foreground": "#111111", "--radius": "0.5rem"})
        self.assertEqual(inv["properties"][".dark"], {"--background": "#111111"})
        self.assertEqual(inv["properties"]["@theme"], {"--font-sans": '"Inter", sans-serif', "--color-primary": "var(--primary)"})

    def test_literals_with_counts_and_files(self):
        lit = tokens.scan(self.scanned())["literals"]
        self.assertEqual(lit["color"], {"#fff": {"count": 3, "files": ["src/App.tsx", "src/index.css"]},
                                        "rgb(0 0 0 / 0.1)": {"count": 1, "files": ["src/index.css"]}})
        self.assertEqual(lit["radius"], {"12": {"count": 1, "files": ["src/App.tsx"]},
                                         "12px": {"count": 1, "files": ["src/index.css"]}})
        self.assertEqual(lit["shadow"], {"0 1px 2px rgb(0 0 0 / 0.1)": {"count": 1, "files": ["src/index.css"]}})
        self.assertEqual(lit["font-family"], {"Georgia, serif": {"count": 1, "files": ["src/index.css"]}})

    def test_tailwind_palette_classes_and_arbitrary_values(self):
        tw = tokens.scan(self.scanned())["tailwind"]
        self.assertEqual(tw["palette"], {"bg-blue-500": {"count": 2, "files": ["src/App.tsx"]},
                                         "text-red-600": {"count": 1, "files": ["src/App.tsx"]}})
        self.assertEqual(tw["arbitrary"], {"bg-[#fff]": {"count": 1, "files": ["src/App.tsx"]},
                                           "p-[13px]": {"count": 1, "files": ["src/App.tsx"]},
                                           "w-[2px]": {"count": 1, "files": ["src/App.tsx"]}})  # variants are not values

    def test_contract_variables_present_and_missing(self):
        contract = tokens.scan(self.scanned())["contract"]
        self.assertEqual(contract["present"], ["--background", "--radius", "--font-sans"])
        self.assertIn("--foreground in .dark", contract["missing"])
        self.assertIn("--ring in :root", contract["missing"])
        self.assertIn("--font-mono in :root or @theme", contract["missing"])
        self.assertNotIn("--foreground in :root", contract["missing"])

    def test_without_a_known_stylesheet_every_css_file_is_read(self):
        inv = tokens.scan(self.project({"styles/a.css": ":root { --x: 1; --y: 1; }", "styles/b.css": ":root { --x: 2; }"}))
        self.assertIsNone(inv["stylesheet"])
        self.assertEqual(inv["properties"][":root"], {"--x": "2", "--y": "1"})

    def test_cli_prints_json(self):
        code, out = self.cli("scan", self.scanned())
        self.assertEqual(code, 0)
        self.assertEqual(sorted(json.loads(out)), ["contract", "literals", "properties", "stylesheet", "tailwind"])
        self.assertEqual(self.cli("scan", "/no/such/dir")[0], 2)


class CheckTests(Fixtures):
    def test_the_contract_is_the_specs_list(self):
        self.assertEqual(sorted(tokens.COLOR_VARS), sorted("--" + name for name in LIGHT))
        self.assertEqual(len(tokens.COLOR_VARS), 31)
        self.assertEqual(sorted(tokens.SINGLE_VARS), sorted("--" + name for name in SINGLE))

    def test_a_complete_system_passes(self):
        root = self.system()
        self.assertEqual(tokens.check(root), [])
        self.assertEqual(self.cli("check", root), (0, "check: ok\n"))

    def one_failure(self, root):
        fails = tokens.check(root)
        self.assertEqual(len(fails), 1, fails)
        self.assertEqual(self.cli("check", root), (1, fails[0] + "\n"))
        return fails[0]

    def test_a_stylesheet_with_a_byte_order_mark_still_has_its_root(self):
        self.assertEqual(tokens.check(self.system("\ufeff" + stylesheet(), design_md())), [])

    def test_a_colour_variable_missing_in_dark(self):
        dark = {k: v for k, v in DARK.items() if k != "chart-3"}
        self.assertEqual(self.one_failure(self.system(stylesheet(dark=dark), design_md(dark=DARK))), "missing --chart-3 in .dark")

    def test_a_single_mode_variable_missing(self):
        single = {k: v for k, v in SINGLE.items() if k != "ease-out"}
        self.assertEqual(self.one_failure(self.system(stylesheet(single=single))), "missing --ease-out in :root or @theme")

    def test_a_failing_text_pair(self):
        light = dict(LIGHT, **{"primary-foreground": "#999999"})  # 2.85:1 on white
        line = self.one_failure(self.system(stylesheet(light=light), design_md(light=light)))
        self.assertEqual(line, "contrast light: --primary-foreground on --primary is 2.85, needs 4.5")

    def test_a_design_md_colour_that_differs_from_the_stylesheet(self):
        css = stylesheet(dark=dict(DARK, **{"chart-1": "#646464"}))
        within = self.system(css, design_md(dark=dict(DARK, **{"chart-1": "#666464"})))  # 2/255 off: allowed
        self.assertEqual(tokens.check(within), [])
        line = self.one_failure(self.system(css, design_md(dark=dict(DARK, **{"chart-1": "#676464"}))))
        self.assertEqual(line, "DESIGN.md colors.chart-1-dark #676464 differs from --chart-1 in the stylesheet #646464")

    def test_error_text_and_the_field_edge_are_checked(self):
        css = stylesheet(light=dict(LIGHT, destructive="#f87171", input="#e5e5e5"))
        fails = tokens.check(self.system(css, design_md(light=dict(LIGHT, destructive="#f87171", input="#e5e5e5"))))
        self.assertEqual([f.split(" is ")[0] for f in fails], [
            "contrast light: --destructive on --background", "contrast light: --input on --background",
            "contrast light: --input on --card", "contrast light: --input on --popover",
            "contrast light: --input on --muted"])

    def test_the_field_edge_must_also_pass_on_a_lighter_dark_surface(self):
        # a dark switch track passed on the page (3.5:1) and measured 3.00:1 on a muted card in the Cockpit audit
        rows = tokens.contrast(tokens.parse_css(
            ".dark { --background: #0a0a0a; --card: #171717; --muted: #3a3a3a; --input: #6b6b6b; }"))
        got = {r["bg"]: r["ok"] for r in rows if r["fg"] == "--input"}
        self.assertEqual(got, {"--background": True, "--card": True, "--muted": False})

    def test_frontmatter_is_generated_from_the_stylesheet_and_passes_check(self):
        css = stylesheet(light=dict(LIGHT, ring="var(--foreground)"))
        block = tokens.frontmatter(tokens.parse_css(css))
        self.assertIn('  background: "oklch(1 0 0)"\n  background-dark: "#0a0a0a"', block)
        resolved = tokens._hex(tokens.parse_color("oklch(0.145 0 0)"))
        self.assertIn(f'  ring: "{resolved}"', block)  # a var() reference is written resolved
        self.assertEqual(len(block.splitlines()), 1 + 2 * len(tokens.COLOR_VARS))
        self.assertEqual(tokens.check(self.system(css, "---\nname: x\n" + block + "\n---\n")), [])

    def test_a_contract_colour_missing_from_design_md(self):
        md = "\n".join(l for l in design_md().splitlines() if not l.startswith("  ring-dark:"))
        self.assertEqual(self.one_failure(self.system(md=md)), "DESIGN.md colors is missing ring-dark")

    def test_design_md_problems_are_lines_not_crashes(self):
        root = self.system(md=design_md().replace('  ring: "oklch(0.6 0 0)"', '  ring: "tomato"\n  brand: "#fff"'))
        self.assertEqual(tokens.check(root), ["DESIGN.md colors.ring: cannot read colour 'tomato'",
                                              "DESIGN.md colors.brand: no --brand in the stylesheet (light)"])
        self.assertEqual(tokens.check(self.system(md="# Design\n\n- Genre: editorial\n")), ["DESIGN.md has no frontmatter colors"])
        root = self.system()
        (root / "DESIGN.md").unlink()
        self.assertEqual(tokens.check(root), [f"DESIGN.md not found: {root / 'DESIGN.md'}"])

    def test_an_unreadable_stylesheet_value_is_one_line(self):
        light = dict(LIGHT, **{"chart-2": "tomato", "ring": "var(--ring)"})
        fails = tokens.check(self.system(stylesheet(light=light), design_md()))
        self.assertEqual(fails, ["light: --ring: var() cycle at --ring", "light: --chart-2: cannot read colour 'tomato'"])

    def test_stylesheet_and_design_in_two_places(self):
        css = self.project({"tokens.css": stylesheet()}) / "tokens.css"
        md = self.project({"notes/DESIGN.md": design_md()}) / "notes/DESIGN.md"
        self.assertEqual(self.cli("check", "--stylesheet", css, "--design", md), (0, "check: ok\n"))
        code, out = self.cli("check", "--stylesheet", css.parent / "gone.css", "--design", md)
        self.assertEqual((code, out.count("\n")), (1, 1))
        self.assertIn("stylesheet not found", out)

    def test_frontmatter_colors_is_a_flat_hand_parsed_map(self):
        text = ('---\nname: x\ncolors:\n  background: "oklch(1 0 0)"\n\n  # note\n  background-dark: \'#08090e\'\n'
                '  ring: oklch(0.6 0 0)\ntypography:\n  body: { fontSize: "1rem" }\n---\n\ncolors:\n  later: "#fff"\n')
        self.assertEqual(tokens.frontmatter_colors(text), {"background": "oklch(1 0 0)", "background-dark": "#08090e",
                                                           "ring": "oklch(0.6 0 0)"})
        self.assertEqual(tokens.frontmatter_colors("# no frontmatter\ncolors:\n  a: \"#fff\"\n"), {})



class HandOverTests(unittest.TestCase):
    """In a components.json project only one DESIGN.md format is written: the callers must hand over."""

    def test_themes_and_design_send_components_json_projects_to_extract(self):
        for skill in ("aios-ui-themes", "aios-ui-design"):
            text = (ROOT / "ai-config/skills" / skill / "SKILL.md").read_text(encoding="utf-8")
            self.assertIn("/aios-ui-system-extract", text, skill)
            self.assertIn("components.json", text, skill)


class VerifyScreenshotNameTests(unittest.TestCase):
    def test_hash_routes_of_one_page_get_their_own_screenshot_name(self):
        path = ROOT / "ai-config/skills/aios-ui-verify/scripts/verify.py"
        spec = importlib.util.spec_from_file_location("aios_ui_verify", path)
        mod = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(mod)
        names = {mod.slug(f"http://127.0.0.1:5199/#/{r}", 1280, "light") for r in ("cockpit", "invoice", "")}
        self.assertEqual(len(names), 3, names)


if __name__ == "__main__":
    unittest.main()
