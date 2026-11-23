#!/usr/bin/env python3
"""Design-system tokens: inventory a project's de facto values, measure contrast, check the shadcn contract.

  tokens.py scan <dir>                                       JSON inventory (custom properties, literals, Tailwind)
  tokens.py contrast <stylesheet>                            WCAG 2.x ratio of every text pair, light and dark
  tokens.py check [<dir>] [--stylesheet <css>] [--design <md>]   contract + contrast + DESIGN.md colours

The stylesheet is the `tailwind.css` path in components.json, else the first of FALLBACK that exists. When a
selector appears more than once the last declaration of a variable wins. Reads oklch, hex, rgb and hsl; any other
colour value (a keyword, color-mix(), a var() defined outside the file) is reported as a failure line, never
guessed. Standard library only, read-only. Exit 0 pass, 1 failures (one line each), 2 could not run.
"""

import argparse
import colorsys
import json
import math
import os
import re
import sys
from pathlib import Path

_SURFACES = ("card", "popover", "primary", "secondary", "muted", "accent")
COLOR_VARS = ["--background", "--foreground", *(f"--{s}{end}" for s in _SURFACES for end in ("", "-foreground")),
              "--destructive", "--border", "--input", "--ring", *(f"--chart-{n}" for n in range(1, 6)),
              "--sidebar", "--sidebar-foreground", "--sidebar-primary", "--sidebar-primary-foreground",
              "--sidebar-accent", "--sidebar-accent-foreground", "--sidebar-border", "--sidebar-ring"]
SINGLE_VARS = ["--radius", "--font-sans", "--font-mono", "--shadow-sm", "--shadow-md", "--shadow-lg", "--ease-out",
               "--duration-fast", "--duration-base"]
FALLBACK = ("src/index.css", "src/styles/globals.css", "app/globals.css", "src/app/globals.css")
TEXT, NON_TEXT = 4.5, 3.0


# --- colour ---------------------------------------------------------------------------------------------------

def oklch_to_srgb(L, C, H):
    """OKLCH to 8-bit sRGB through OKLab (Ottosson's matrices). ponytail: out-of-gamut colours are clipped per
    channel, where a browser reduces chroma; switch to CSS gamut mapping if such tokens must match exactly."""
    a, b = C * math.cos(math.radians(H)), C * math.sin(math.radians(H))
    l = (L + 0.3963377774 * a + 0.2158037573 * b) ** 3
    m = (L - 0.1055613458 * a - 0.0638541728 * b) ** 3
    s = (L - 0.0894841775 * a - 1.2914855480 * b) ** 3
    linear = (4.0767416621 * l - 3.3077115913 * m + 0.2309699292 * s,
              -1.2684380046 * l + 2.6097574011 * m - 0.3413193965 * s,
              -0.0041960863 * l - 0.7034186147 * m + 1.7076147010 * s)
    return tuple(_byte(12.92 * x if x <= 0.0031308 else 1.055 * x ** (1 / 2.4) - 0.055) for x in linear)


def _byte(unit):
    return round(255 * min(1.0, max(0.0, unit)))


def _num(tok, whole=1.0):
    """A CSS number; a percentage is that share of `whole`; `none` is 0."""
    if tok == "none":
        return 0.0
    return float(tok[:-1]) / 100 * whole if tok.endswith("%") else float(tok)


def _hue(tok):
    return float(tok[:-3] if tok.endswith("deg") else tok)  # rad/grad/turn raise: reported, not guessed


def parse_color(value):
    """(r, g, b, alpha) with 8-bit channels and alpha 0-1, from hex, rgb(), hsl() or oklch(). ValueError otherwise."""
    v = value.strip().lower()
    try:
        if v.startswith("#"):
            h = "".join(c * 2 for c in v[1:]) if len(v) in (4, 5) else v[1:]
            if len(h) not in (6, 8):
                raise ValueError
            n = [int(h[i:i + 2], 16) for i in range(0, len(h), 2)]
            return (n[0], n[1], n[2], n[3] / 255 if len(n) == 4 else 1.0)
        kind, body = re.fullmatch(r"(oklch|rgba?|hsla?)\(([^()]*)\)", v).groups()  # no match: AttributeError
        parts = body.replace(",", " ").replace("/", " ").split()
        if len(parts) not in (3, 4):
            raise ValueError
        x, y, z = parts[:3]
        if kind == "oklch":
            rgb = oklch_to_srgb(_num(x), _num(y, 0.4), _hue(z))
        elif kind.startswith("rgb"):
            rgb = tuple(_byte(_num(p, 255) / 255) for p in (x, y, z))
        else:  # hsl: saturation and lightness are percentages with or without the sign
            sat, light = (min(1.0, max(0.0, float(p.rstrip("%")) / 100)) for p in (y, z))
            rgb = tuple(_byte(c) for c in colorsys.hls_to_rgb(_hue(x) / 360 % 1, light, sat))
        return (*rgb, min(1.0, max(0.0, _num(parts[3]))) if len(parts) == 4 else 1.0)
    except (ValueError, AttributeError):
        raise ValueError(f"cannot read colour {value!r}") from None


def luminance(rgb):
    """WCAG 2.x relative luminance of an 8-bit sRGB colour."""
    r, g, b = (c / 12.92 if c <= 0.03928 else ((c + 0.055) / 1.055) ** 2.4 for c in (x / 255 for x in rgb[:3]))
    return 0.2126 * r + 0.7152 * g + 0.0722 * b


def ratio(fg, bg):
    """WCAG 2.x contrast ratio, 1 to 21."""
    hi, lo = sorted((luminance(fg), luminance(bg)), reverse=True)
    return (hi + 0.05) / (lo + 0.05)


def _over(fg, bg):
    """A translucent foreground as the opaque colour it makes on bg. ponytail: the background's own alpha is
    ignored (treated as opaque); composite it on the page colour first if translucent surfaces carry text."""
    return tuple(round(f * fg[3] + b * (1 - fg[3])) for f, b in zip(fg[:3], bg[:3]))


def _hex(c):
    return "#%02x%02x%02x" % tuple(c[:3]) + ("%02x" % round(c[3] * 255) if c[3] < 1 else "")


# --- stylesheet -----------------------------------------------------------------------------------------------

def find_stylesheet(root):
    """The project's global stylesheet, or None."""
    root = Path(root)
    try:
        named = [json.loads((root / "components.json").read_text(encoding="utf-8"))["tailwind"]["css"]]
    except (OSError, ValueError, KeyError, TypeError):
        named = []
    return next((root / p for p in (*named, *FALLBACK) if isinstance(p, str) and p and (root / p).is_file()), None)


def parse_css(text):
    """{selector: {--name: value}} for every custom property, later declarations replacing earlier ones.
    `@theme inline` and `@theme` are both "@theme"; `@layer` is transparent; any other at-rule prefixes the
    selectors inside it, so a `:root` in a media query never overwrites the plain `:root`.
    ponytail: a brace scanner, not a CSS parser. A `{`, `}` or `;` inside a string or url() splits wrongly, a
    nested rule loses its parent selector, and @import is not followed; use a real parser if that bites."""
    text = re.sub(r"/\*.*?\*/", "", text, flags=re.S)
    blocks, stack, start = {}, [], 0  # stack: (selectors of this block, at-rule prefix for blocks inside it)
    for m in re.finditer(r"[{};]", text):
        chunk, start = text[start:m.start()], m.end()
        if m.group() == "{":
            prelude, prefix = " ".join(chunk.split()), stack[-1][1] if stack else ""
            if prelude.startswith("@theme"):
                stack.append((["@theme"], prefix))
            elif prelude.startswith("@layer"):
                stack.append(([], prefix))
            elif prelude.startswith("@"):
                stack.append(([], f"{prefix}{prelude} "))
            else:
                stack.append(([prefix + s.strip() for s in prelude.split(",")], prefix))
            continue
        decl = re.fullmatch(r"\s*(--[\w-]+)\s*:\s*(.+?)\s*", chunk, re.S)
        if decl and stack:
            for selector in stack[-1][0]:
                blocks.setdefault(selector, {})[decl.group(1)] = " ".join(decl.group(2).split())
        if m.group() == "}" and stack:
            stack.pop()
    return blocks


def modes(blocks):
    """{mode: its variables}. Dark is `.dark` over `:root`, as the cascade gives it; absent without a `.dark`."""
    root = blocks.get(":root", {})
    return {"light": root, **({"dark": {**root, **blocks[".dark"]}} if ".dark" in blocks else {})}


def resolve(value, scope, seen=()):
    """Follow var(--x[, fallback]) through scope until a plain value. ValueError on a cycle or an unknown name."""
    m = re.fullmatch(r"var\(\s*(--[\w-]+)\s*(?:,\s*(.+))?\)", value.strip(), re.S)
    if not m:
        return value
    name, fallback = m.groups()
    if name in seen:
        raise ValueError(f"var() cycle at {name}")
    if name in scope:
        return resolve(scope[name], scope, (*seen, name))
    if fallback:
        return resolve(fallback, scope, seen)
    raise ValueError(f"{name} is not defined in the stylesheet")


def color(name, scope):
    """The parsed colour of a variable in one mode. ValueError names the variable."""
    try:
        return parse_color(resolve(scope[name], scope, (name,)))
    except ValueError as e:
        raise ValueError(f"{name}: {e}") from None


def contrast(blocks):
    """One row per pair and mode: {mode, fg, bg, need, ratio, ok}, or {…, ok: False, error} when a value cannot
    be read. Pairs with an undefined variable are left out; `check` reports those as missing."""
    rows = []
    for mode, scope in modes(blocks).items():
        pairs = [("--foreground", "--background", TEXT), ("--muted-foreground", "--background", TEXT),
                 ("--muted-foreground", "--card", TEXT), ("--ring", "--background", NON_TEXT)]
        pairs += [(n, n[:-len("-foreground")], TEXT) for n in scope if n.endswith("-foreground") and n != "--foreground"]
        for fg, bg, need in pairs:
            if fg not in scope or bg not in scope:
                continue
            row = {"mode": mode, "fg": fg, "bg": bg, "need": need}
            try:
                back = color(bg, scope)
                row["ratio"] = ratio(_over(color(fg, scope), back), back)
                row["ok"] = row["ratio"] >= need
            except ValueError as e:
                row.update(ok=False, error=str(e))
            rows.append(row)
    return rows


def gaps(blocks):
    """Contract variables the stylesheet lacks, as "--name in <where>"."""
    root, dark, theme = (blocks.get(k, {}) for k in (":root", ".dark", "@theme"))
    out = [f"{v} in {sel}" for sel, have in ((":root", root), (".dark", dark)) for v in COLOR_VARS if v not in have]
    return out + [f"{v} in :root or @theme" for v in SINGLE_VARS if v not in root and v not in theme]


# --- DESIGN.md ------------------------------------------------------------------------------------------------

def frontmatter_colors(text):
    """The flat `colors:` map of a DESIGN.md frontmatter, read by hand (no YAML in the standard library).
    ponytail: only `key: "value"` lines indented under a top-level `colors:`; nested maps are not understood."""
    front = re.match(r"﻿?---\r?\n(.*?)\r?\n---", text, re.S)
    out, inside = {}, False
    for line in (front.group(1) if front else "").splitlines():
        if not line.strip():
            continue
        if not line[0].isspace():
            inside = line.rstrip() == "colors:"
        elif inside:
            kv = re.fullmatch(r"""\s+["']?([\w-]+)["']?\s*:\s*(["']?)(.*?)\2\s*""", line)
            if kv:
                out[kv.group(1)] = kv.group(3)
    return out


def check(root=".", stylesheet=None, design=None):
    """Every way the system breaks its contract, one line each; empty when it holds."""
    root = Path(root)
    sheet = Path(stylesheet) if stylesheet else find_stylesheet(root)
    if not sheet or not sheet.is_file():
        return [f"stylesheet not found: {stylesheet or root}"]
    blocks = parse_css(sheet.read_text(encoding="utf-8", errors="replace"))
    scopes = modes(blocks)
    fails = [f"missing {gap}" for gap in gaps(blocks)]
    for mode, scope in scopes.items():
        for name in COLOR_VARS:
            if name in scope:
                try:
                    color(name, scope)
                except ValueError as e:
                    fails.append(f"{mode}: {e}")
    for r in contrast(blocks):
        if "error" in r:
            fails.append(f"{r['mode']}: {r['error']}")
        elif not r["ok"]:
            fails.append(f"contrast {r['mode']}: {r['fg']} on {r['bg']} is {r['ratio']:.2f}, needs {r['need']}")
    md = Path(design) if design else root / "DESIGN.md"
    if not md.is_file():
        return list(dict.fromkeys([*fails, f"DESIGN.md not found: {md}"]))
    declared = frontmatter_colors(md.read_text(encoding="utf-8", errors="replace"))
    if not declared:
        fails.append("DESIGN.md has no frontmatter colors")
    else:  # the file mirrors the whole contract, light and dark, or a reader of it sees half a system
        fails += [f"DESIGN.md colors is missing {n[2:]}{end}" for end in ("", "-dark") for n in COLOR_VARS
                  if n[2:] + end not in declared]
    for key, value in declared.items():
        mode, name = ("dark", "--" + key[:-5]) if key.endswith("-dark") else ("light", "--" + key)
        try:
            want = parse_color(value)
        except ValueError as e:
            fails.append(f"DESIGN.md colors.{key}: {e}")
            continue
        if name not in scopes.get(mode, {}):
            fails.append(f"DESIGN.md colors.{key}: no {name} in the stylesheet ({mode})")
            continue
        try:
            have = color(name, scopes[mode])
        except ValueError as e:
            fails.append(f"{mode}: {e}")
            continue
        if max(abs(a - b) for a, b in zip((*want[:3], want[3] * 255), (*have[:3], have[3] * 255))) > 2:
            fails.append(f"DESIGN.md colors.{key} {_hex(want)} differs from {name} in the stylesheet {_hex(have)}")
    return list(dict.fromkeys(fails))  # a value two checks trip over is still one line


# --- scan -----------------------------------------------------------------------------------------------------

SOURCE = {".html", ".css", ".scss", ".js", ".jsx", ".ts", ".tsx", ".vue", ".svelte", ".astro"}
SKIP = {"node_modules", "dist", "build", "coverage"}
TOKEN_LINE = re.compile(r"^\s*(?:(?::root|\.dark|@theme[^{]*)\s*\{\s*)?--[\w-]+\s*:")  # the token block itself
_HUES = ("slate|gray|zinc|neutral|stone|red|orange|amber|yellow|lime|green|emerald|teal|cyan|sky|blue|indigo|violet|"
         "purple|fuchsia|pink|rose")


def _prop(css, js):
    """`border-radius: 12px` in CSS, `borderRadius: "12px"` or `borderRadius: 12` in a JS style object."""
    return re.compile(rf"""\b{css}\s*:\s*([^;}}\n]+)|\b{js}\s*:\s*(?:["'`]([^"'`\n]+)|(\d[\w.%]*))""")


# ponytail: line regexes. A value split across lines is missed and an id such as `#fed` counts as a colour;
# upgrade to a parser if exact counts matter.
PATTERNS = {
    "color": re.compile(r"(?<![&\w])#(?:[0-9a-fA-F]{8}|[0-9a-fA-F]{6}|[0-9a-fA-F]{3,4})\b|\b(?:rgba?|hsla?|oklch)\([^()]*\)"),
    "radius": _prop("border-radius", "borderRadius"),
    "shadow": _prop("box-shadow", "boxShadow"),
    "font-family": _prop("font-family", "fontFamily"),
    "palette": re.compile(r"(?<![\w-])(?:bg|text|border(?:-[xytrblse])?|ring|ring-offset|outline|decoration|divide|"
                          rf"shadow|fill|stroke|from|via|to|accent|caret|placeholder)-(?:{_HUES})-(?:50|[1-9]00|950)\b"),
    # `data-[state=open]:` and `group-data-[size=sm]/tabs:` are variants, not values
    "arbitrary": re.compile(r"(?<![\w-])-?[a-z][\w-]*-\[[^\]\s]+\](?!:|/[a-z][\w-]*:)"),
}


def _source_files(root):
    for folder, subs, names in os.walk(root):
        subs[:] = sorted(s for s in subs if s not in SKIP and not s.startswith("."))
        yield from (Path(folder) / n for n in sorted(names) if Path(n).suffix in SOURCE)


def _rel(path, root):
    try:
        return path.relative_to(root).as_posix()
    except ValueError:
        return path.as_posix()


def scan(root):
    """Inventory of the de facto system under root. Custom properties come from the discovered stylesheet, or from
    every CSS file (path order, later wins) when none is found; literals come from every source file, token
    definitions excluded."""
    root = Path(root)
    sheet, files = find_stylesheet(root), list(_source_files(root))
    blocks = {}
    for f in [sheet] if sheet else [f for f in files if f.suffix == ".css"]:
        for selector, props in parse_css(f.read_text(encoding="utf-8", errors="replace")).items():
            blocks.setdefault(selector, {}).update(props)
    found = {kind: {} for kind in PATTERNS}
    for f in files:
        for line in f.read_text(encoding="utf-8", errors="replace").splitlines():
            if TOKEN_LINE.match(line):
                continue
            for kind, pattern in PATTERNS.items():
                for m in pattern.finditer(line):
                    value = (m.group(m.lastindex) if m.lastindex else m.group()).strip()
                    if "var(" in value or value in ("none", "inherit"):
                        continue
                    entry = found[kind].setdefault(value.lower() if kind == "color" else value, {"count": 0, "files": set()})
                    entry["count"] += 1
                    entry["files"].add(_rel(f, root))
    tally = {kind: {v: {"count": e["count"], "files": sorted(e["files"])}
                    for v, e in sorted(values.items(), key=lambda kv: (-kv[1]["count"], kv[0]))}
             for kind, values in found.items()}
    missing = gaps(blocks)
    return {
        "stylesheet": _rel(sheet, root) if sheet else None,
        "properties": blocks,
        "literals": {kind: tally[kind] for kind in ("color", "radius", "shadow", "font-family")},
        "tailwind": {kind: tally[kind] for kind in ("palette", "arbitrary")},
        "contract": {"present": [v for v in COLOR_VARS + SINGLE_VARS if not any(g.startswith(v + " ") for g in missing)],
                     "missing": missing},
    }


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    sub = ap.add_subparsers(dest="cmd", required=True)
    sub.add_parser("scan", help="JSON inventory of a project").add_argument("dir")
    sub.add_parser("contrast", help="WCAG ratio of every pair").add_argument("stylesheet")
    chk = sub.add_parser("check", help="contract, contrast and DESIGN.md colours")
    chk.add_argument("dir", nargs="?", default=".")
    chk.add_argument("--stylesheet")
    chk.add_argument("--design")
    a = ap.parse_args(argv)
    if a.cmd == "scan":
        if not Path(a.dir).is_dir():
            print(f"tokens: not a directory: {a.dir}", file=sys.stderr)
            return 2
        print(json.dumps(scan(a.dir), indent=1))
        return 0
    if a.cmd == "contrast":
        try:
            rows = contrast(parse_css(Path(a.stylesheet).read_text(encoding="utf-8", errors="replace")))
        except OSError as e:
            print(f"tokens: {e}", file=sys.stderr)
            return 2
        for r in rows:
            print(f"{'PASS' if r['ok'] else 'FAIL'} {r['mode']} {r['fg']} on {r['bg']}"
                  + (f": {r['error']}" if "error" in r else f" {r['ratio']:.2f} (needs {r['need']})"))
        if not rows:
            print(f"tokens: no colour pairs in {a.stylesheet}", file=sys.stderr)
        return 0 if rows and all(r["ok"] for r in rows) else 1
    fails = check(a.dir, a.stylesheet, a.design)
    print("\n".join(fails) if fails else "check: ok")
    return 1 if fails else 0


if __name__ == "__main__":
    sys.exit(main())
