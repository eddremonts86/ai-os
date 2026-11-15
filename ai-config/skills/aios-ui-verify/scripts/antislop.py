#!/usr/bin/env python3
"""Static anti-slop check: Hallmark's sloplint (ai-config/skills/hallmark, vendored) over a project's source, minus
what only makes sense inside a Hallmark build.

  antislop.py <file-or-dir> [...] [--genre editorial|modern-minimal|atmospheric|playful] [--scope page|component|app]
              [--json]

Dropped: gate 20 (the Hallmark stamp on line 1 of the CSS), gate 48 on a custom-property definition (`--x: #hex`
in `:root` / `.dark` IS the project's token block, e.g. shadcn's), and gate 26a's "no :focus-visible anywhere" when
the source styles focus through Tailwind's `focus-visible:` variant, which sloplint does not count. Everything else
is reported, and it is advisory: confirm or dismiss each finding; it never changes verify.py's verdict. Static only (no
--render: that needs puppeteer); sloplint writes nothing without --before. Exit 0 no Floor FAIL, 1 Floor FAIL,
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


def run(paths, genre=None, scope=None):
    node = shutil.which("node")
    if not node or not SLOPLINT.is_file():
        raise RuntimeError("needs node and " + str(SLOPLINT))
    cmd = [node, str(SLOPLINT), *[str(Path(p).resolve()) for p in paths], "--json"]
    if genre:
        cmd += ["--genre", genre]
    if scope:
        cmd += ["--scope", scope]
    p = subprocess.run(cmd, capture_output=True, text=True, timeout=300)
    try:
        data = json.loads(p.stdout)
    except json.JSONDecodeError as e:
        raise RuntimeError(f"sloplint output was not JSON: {(p.stderr or p.stdout)[:300]}") from e
    tw = tailwind_focus(paths)
    out = [f for f in data.get("findings", []) if keep(f, tw)]
    for f in out:
        f["file"] = os.path.relpath(f["file"]) if os.path.isabs(f.get("file", "")) else f.get("file", "")
    return out


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument("paths", nargs="+")
    ap.add_argument("--genre")
    ap.add_argument("--scope")
    ap.add_argument("--json", action="store_true")
    a = ap.parse_args(argv)
    try:
        found = run(a.paths, a.genre, a.scope)
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
