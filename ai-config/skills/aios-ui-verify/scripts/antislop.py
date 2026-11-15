#!/usr/bin/env python3
"""Static anti-slop check: Hallmark's sloplint (ai-config/skills/hallmark, vendored) over a project's source, minus
what only makes sense inside a Hallmark build.

  antislop.py <file-or-dir> [...] [--genre editorial|modern-minimal|atmospheric|playful] [--scope page|component|app]
              [--render [--url http://localhost:5173/route ...] [--shots DIR]] [--json]

Dropped: gate 20 (the Hallmark stamp on line 1 of the CSS), gate 48 on a custom-property definition (`--x: #hex`
in `:root` / `.dark` IS the project's token block, e.g. shadcn's), and gate 26a's "no :focus-visible anywhere" when
the source styles focus through Tailwind's `focus-visible:` variant, which sloplint does not count. Everything else
is reported, and it is advisory: confirm or dismiss each finding; it never changes verify.py's verdict. Static by
default (writes nothing). --render adds the browser tier (layout, contrast, fold, overflow at real widths) through
hallmark.sh, which installs a pinned puppeteer-core into ~/.ai-os/hallmark once; its screenshots go to --shots
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


def tailwind_focus(paths):
    """True when any scanned source uses the focus-visible: variant (sloplint's own walk: skips deps and dot dirs)."""
    for root in map(Path, paths):
        files = [root] if root.is_file() else (f for f in root.rglob("*") if f.suffix in SOURCE
                                                and not any(part in SKIP or part.startswith(".") for part in f.relative_to(root).parts))
        for f in files:
            try:
                if "focus-visible:" in f.read_text(encoding="utf-8", errors="ignore"):
                    return True
            except OSError:
                continue
    return False


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
    # The render tier saves a file's screenshots in a .hallmark/ beside it: note which exist, move the new ones out.
    beside = {(Path(p).resolve() if Path(p).is_dir() else Path(p).resolve().parent) / ".hallmark" for p in paths}
    existed = {d for d in beside if d.exists()}
    try:
        p = subprocess.run(cmd, capture_output=True, text=True, timeout=600, cwd=cwd)
    finally:
        for i, d in enumerate(sorted(beside - existed)):
            if d.exists() and cwd:
                shutil.move(str(d), str(cwd / f"shots-{i}-{d.parent.name}"))
    try:
        data = json.loads(p.stdout)
    except json.JSONDecodeError as e:
        raise RuntimeError(f"sloplint output was not JSON: {(p.stderr or p.stdout)[:300]}") from e
    tw = tailwind_focus(paths)
    out = [f for f in data.get("findings", []) if keep(f, tw)]
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
