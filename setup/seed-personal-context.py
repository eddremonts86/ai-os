#!/usr/bin/env python3
"""Copy context/personal.example/ to context/personal/, once.

  seed-personal-context.py [ROOT]      ROOT defaults to the repo this script lives in

context/personal/ is git-ignored (it describes one person and one machine), so a fresh clone has none.
Only files that are missing are copied: what you already wrote there is never overwritten.
Prints the names it copied, or "nothing to copy". Standard library only.
"""

import shutil
import sys
from pathlib import Path


def seed(root):
    src, dst = Path(root) / "context" / "personal.example", Path(root) / "context" / "personal"
    if not src.is_dir():
        return []
    dst.mkdir(parents=True, exist_ok=True)
    copied = []
    for f in sorted(src.rglob("*")):
        rel = f.relative_to(src)
        if f.is_file() and not (dst / rel).exists():
            (dst / rel).parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(f, dst / rel)
            copied.append(rel.as_posix())
    return copied


if __name__ == "__main__":
    done = seed(sys.argv[1] if len(sys.argv) > 1 else Path(__file__).resolve().parent.parent)
    print(", ".join(done) if done else "nothing to copy")
