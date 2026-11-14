#!/usr/bin/env python3
"""idcheck.py <repo> <draft.md>... : every code name in a draft must exist in the repo's tracked files.

Takes each backticked span, keeps the words that look like code (CamelCase, snake_case, UPPER_CASE, a::b),
and runs `git grep` for each over the tracked files only, so worktrees and untracked copies never count.
Prints the names it could not find; check each one by hand (an example name, a removed function, a typo).
"""
import re
import subprocess
import sys


def tokens(text):
    out = set()
    for span in re.findall(r"`([^`\n]{2,80})`", text):
        for w in re.findall(r"[A-Za-z_][A-Za-z0-9_]*(?:::[A-Za-z_][A-Za-z0-9_]*)*", span):
            if len(w) >= 4 and (w.isupper() or re.search(r"[a-z][A-Z]|_|::|^[A-Z][a-z]+[A-Z]", w)):
                out.add(w.split("::")[-1])
    return out


def missing(repo, names):
    # ponytail: one git grep per name, a few minutes on a large repo; batch with -e if that ever matters
    return sorted(w for w in names if not subprocess.run(
        ["git", "-C", repo, "grep", "-l", "-F", "-a", "--max-count=1", w],
        capture_output=True, text=True, errors="replace").stdout.strip())


if __name__ == "__main__":
    if len(sys.argv) < 3:
        sys.exit(__doc__)
    for path in sys.argv[2:]:
        names = tokens(open(path, encoding="utf-8").read())
        print(f"{path}: {len(names)} names checked, not found in tracked files: {missing(sys.argv[1], names)}")
