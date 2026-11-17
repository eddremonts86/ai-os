#!/usr/bin/env python3
"""Static anti-slop check: Hallmark's sloplint (ai-config/skills/hallmark, vendored) over a project's source, minus
what only makes sense inside a Hallmark build.

  antislop.py <file-or-dir> [...] [--genre editorial|modern-minimal|atmospheric|playful] [--scope page|component|app]
              [--render [--url http://localhost:5173/route ...] [--shots DIR]] [--json]

Dropped: gate 20 (the Hallmark stamp on line 1 of the CSS), gate 48 on a custom-property definition (`--x: #hex`
in `:root` / `.dark` IS the project's token block, e.g. shadcn's), and gate 26a's "no :focus-visible anywhere" when
the source styles focus through Tailwind's `focus-visible:` variant, which sloplint does not count. Everything else
is reported, and it is advisory: confirm or dismiss each finding; it never changes verify.py's verdict. The one
exception is gate "ds" (rules/always_do.md rule 27): where the project has a design system, a colour literal, an
inline style or a Tailwind arbitrary colour/length is a Floor FAIL unless `ds-allow: <reason>` sits on that line or
the one above. Static by
default (writes nothing). --render adds the browser tier (layout, contrast, fold, overflow at real widths) through
hallmark.sh, which installs puppeteer-core from a committed lockfile into ~/.ai-os/hallmark; its screenshots go to --shots
(default ./ui-verify/antislop), never into the project. Exit 0 no Floor FAIL, 1 Floor FAIL,
2 could not run (no node, no sloplint, bad output).
"""

import argparse
import json
import os
import re
import shutil
import subprocess
import sys
from collections import Counter
from pathlib import Path

SLOPLINT = Path(__file__).resolve().parents[2] / "hallmark" / "scripts" / "sloplint.mjs"
LAUNCHER = Path(__file__).resolve().parent / "hallmark.sh"
TOKEN_DEF = re.compile(r"\(--[\w-]+ on [^)]*\)\s*$")  # "... outside tokens (--primary on .dark)"


SOURCE = {".html", ".css", ".jsx", ".tsx", ".vue", ".svelte", ".astro"}
SKIP = {"node_modules", "dist", "build", "coverage"}


def source_files(paths):
    """Source files under the given paths (sloplint's own walk: skips deps and dot dirs)."""
    for root in map(Path, paths):
        yield from ([root] if root.is_file() else (f for f in root.rglob("*") if f.suffix in SOURCE
                                                   and not any(part in SKIP or part.startswith(".") for part in f.relative_to(root).parts)))


def read(f):
    try:
        return f.read_text(encoding="utf-8", errors="ignore")
    except OSError:
        return ""


def tailwind_focus(paths):
    """True when any scanned source uses the focus-visible: variant."""
    return any("focus-visible:" in read(f) for f in source_files(paths))


TOKEN_LINE = re.compile(r"^\s*(?:(?::root|\.dark|@theme[^{]*)\s*\{\s*)?--[\w-]+\s*:")  # `--primary: #b3ee55;` is the token block itself
COLOR = re.compile(r"#[0-9a-fA-F]{3,8}\b|\b(?:rgba?|hsla?|oklch|oklab|lab|lch)\(")
ARBITRARY = re.compile(r"\[[^\]\s]*(?:#[0-9a-fA-F]{3,8}|\d(?:px|rem|em)\b|\b(?:rgba?|hsla?|oklch)\()[^\]\s]*\]")
INLINE = re.compile(r"""\bstyle\s*=\s*(?:\{\{(?P<jsx>.*?)(?:\}\}|$)|"(?P<html>[^"]*)")""")
CUSTOM_PROPS = re.compile(r"""\s*(?:['"]?--[\w-]+['"]?\s*:[^,]*,?\s*)+""")  # style that only sets --vars is not a hardcode
SYSTEM_FILES = ("DESIGN.md", "components.json", "tailwind.config.js", "tailwind.config.ts", "tailwind.config.mjs",
                "tailwind.config.cjs", ".ai-os/brand-tokens.md")


def has_design_system(paths):
    """A project has one when a design file sits at or above the scanned path (up to the repo root), or its CSS
    holds a token block (3+ custom properties, a Tailwind `@theme`)."""
    for p in map(lambda x: Path(x).resolve(), paths):
        for d in [p if p.is_dir() else p.parent, *(p if p.is_dir() else p.parent).parents]:
            if any((d / n).is_file() for n in SYSTEM_FILES):
                return True
            if (d / ".git").exists():
                break
    return any(f.suffix == ".css" and ("@theme" in (t := read(f)) or len(re.findall(r"--[\w-]+\s*:", t)) >= 3)
               for f in source_files(paths))


def design_system_findings(paths):
    """Gate "ds": hardcoded values where a design system exists. Escape hatch: `ds-allow: <reason>` on the line or
    the one above, which the report must list. ponytail: line regexes, so a value split across lines or built in
    a template string is missed; upgrade to a real parser if that matters."""
    out = []
    for f in source_files(paths):
        lines = read(f).splitlines()
        for i, line in enumerate(lines):
            if "ds-allow:" in line or (i and "ds-allow:" in lines[i - 1]) or TOKEN_LINE.match(line):
                continue
            hits = []
            for m in INLINE.finditer(line):
                body = (m.group("jsx") or m.group("html") or "").strip()
                if not body or not CUSTOM_PROPS.fullmatch(body):
                    hits.append(("inline style", "use a class from the system's tokens or components"))
                    break
            if COLOR.search(line):
                hits.append(("colour literal", "use the colour token (var(--...) or its Tailwind name)"))
            if ARBITRARY.search(line):
                hits.append(("Tailwind arbitrary value", "use the scale or add a token to the system"))
            for what, fix in hits:
                out.append({"gate": "ds", "grade": "FAIL", "file": str(f), "line": i + 1,
                            "evidence": f"{what}: {line.strip()[:90]}", "fix": fix + "; or ds-allow: <reason>"})
    return out


def hallmark_dirs(paths):
    """Every .hallmark/ the render tier could write for these paths: beside a file, or anywhere under a directory."""
    found = set()
    for p in map(lambda x: Path(x).resolve(), paths):
        base = p if p.is_dir() else p.parent
        found.add(base / ".hallmark")
        if p.is_dir():
            for d, subs, _ in os.walk(base):
                if ".hallmark" in subs:
                    found.add(Path(d) / ".hallmark")
                subs[:] = [s for s in subs if s not in SKIP and not s.startswith(".")]
    return {d for d in found if d.is_dir()}


def keep(f, tw_focus=False):
    gate, evidence = f.get("gate"), f.get("evidence", "")
    if gate == "20":
        return False
    if gate == "48" and TOKEN_DEF.search(evidence):
        return False
    if gate == "26a" and tw_focus and "no :focus-visible" in evidence:
        return False
    return True


def run(paths, genre=None, scope=None, render=False, urls=(), shots=None):
    node = shutil.which("node")
    if not node or not SLOPLINT.is_file():
        raise RuntimeError("needs node and " + str(SLOPLINT))
    args = [*[str(Path(p).resolve()) for p in paths], "--json"]
    if genre:
        args += ["--genre", genre]
    if scope:
        args += ["--scope", scope]
    cwd = None
    if render:
        if not shutil.which("bash"):
            raise RuntimeError("--render needs bash for hallmark.sh")
        args.append("--render")
        for u in urls:
            args += ["--url", u]
        cwd = Path(shots or "ui-verify/antislop").resolve()
        cwd.mkdir(parents=True, exist_ok=True)  # sloplint writes .hallmark/shots under its cwd
        cmd = ["bash", str(LAUNCHER), "sloplint", *args]
    else:
        cmd = [node, str(SLOPLINT), *args]
    # The render tier saves a file's screenshots in a .hallmark/ beside it (subfolders included when a directory is
    # scanned): note which exist, move the new ones out.
    existed = hallmark_dirs(paths) if render else set()
    try:
        p = subprocess.run(cmd, capture_output=True, text=True, timeout=600, cwd=cwd)
    finally:
        if render:
            for i, d in enumerate(sorted(hallmark_dirs(paths) - existed)):
                shutil.move(str(d), str(cwd / f"shots-{i}-{d.parent.name}"))
    try:
        data = json.loads(p.stdout)
    except json.JSONDecodeError as e:
        raise RuntimeError(f"sloplint output was not JSON: {(p.stderr or p.stdout)[:300]}") from e
    tw = tailwind_focus(paths)
    out = [f for f in data.get("findings", []) if keep(f, tw)]
    if has_design_system(paths):
        out += design_system_findings(paths)
    for f in out:
        f["file"] = shorten(f.get("file", ""))
    return out


def shorten(path):
    """Relative to the cwd when it can be; Windows has no relative path across drives (C: vs D:)."""
    if not os.path.isabs(path):
        return path
    try:
        return os.path.relpath(path)
    except ValueError:
        return path


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument("paths", nargs="+")
    ap.add_argument("--genre")
    ap.add_argument("--scope")
    ap.add_argument("--render", action="store_true")
    ap.add_argument("--url", action="append", default=[])
    ap.add_argument("--shots")
    ap.add_argument("--json", action="store_true")
    a = ap.parse_args(argv)
    try:
        found = run(a.paths, a.genre, a.scope, a.render, a.url, a.shots)
    except (RuntimeError, subprocess.TimeoutExpired) as e:
        print(f"antislop: not run: {e}", file=sys.stderr)
        return 2
    fails = [f for f in found if f["grade"] == "FAIL"]
    if a.json:
        print(json.dumps(found, indent=1))
    else:
        for f in fails:
            print(f"FAIL {f['gate']} {f['file']}:{f['line']} {f['evidence']} | fix: {f.get('fix', '')}")
        rest = Counter(f"{f['grade']} {f['gate']}" for f in found if f["grade"] != "FAIL")
        if rest:
            print("advisory: " + ", ".join(f"{k} x{n}" for k, n in rest.most_common()) + " (--json for each)")
        print(f"antislop: {len(fails)} Floor FAIL, {len(found) - len(fails)} advisory")
    return 1 if fails else 0


if __name__ == "__main__":
    sys.exit(main())
