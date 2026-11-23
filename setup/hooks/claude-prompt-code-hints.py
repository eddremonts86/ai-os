#!/usr/bin/env python3
"""Claude Code UserPromptSubmit hook: attach the likeliest code locations to each prompt.

Coding agents spend their first turns grepping for the right file, and every turn resends
the whole conversation. This hook asks the repo's grepai index (already kept fresh by the
AI-OS reindex job) for the prompt's best matches and hands the agent up to three
`file:lines` before it starts searching. Idea from Graft / Trail-code; this reuses the
index AI-OS already has instead of adding a second one.

Stdlib only. Never blocks a prompt: any failure (no index, grepai missing, timeout) exits 0
with no output. Off with AIOS_CODE_HINTS=0. Wired by setup/wire-memory-hook.py.
"""

import json
import os
import shutil
import subprocess
import sys

MAX_HINTS = 3
MIN_PROMPT = 20  # shorter prompts ("go", "continúa", "yes") are not code requests
TIMEOUT = 3  # seconds; a prompt must stay snappy
SKIP_NAMES = {"pnpm-lock.yaml", "package-lock.json", "yarn.lock", "bun.lockb", "uv.lock",
              "poetry.lock", "Cargo.lock", "go.sum", "robots.txt", "sitemap.xml"}


def hints(prompt, cwd):
    """[(file, start, end)] for the prompt, scoped to cwd when cwd is below the repo root."""
    top = subprocess.run(["git", "-C", cwd, "rev-parse", "--show-toplevel"],
                         capture_output=True, text=True, timeout=TIMEOUT).stdout.strip()
    if not top or not os.path.isdir(os.path.join(top, ".grepai")) or not shutil.which("grepai"):
        return []
    cmd = ["grepai", "search", prompt[:400], "--limit", "10", "--json", "--compact"]
    rel = os.path.relpath(os.path.realpath(cwd), os.path.realpath(top))
    if rel != "." and not rel.startswith(".."):
        cmd += ["--path", rel.replace(os.sep, "/")]
    out = subprocess.run(cmd, cwd=top, capture_output=True, text=True, timeout=TIMEOUT).stdout
    found, seen = [], set()
    for r in json.loads(out or "[]") or []:
        path = r.get("file_path", "")
        if not path or path in seen or os.path.basename(path) in SKIP_NAMES:
            continue
        seen.add(path)
        found.append((path, r.get("start_line"), r.get("end_line")))
        if len(found) == MAX_HINTS:
            break
    return found


def main():
    if os.environ.get("AIOS_CODE_HINTS") == "0":
        return
    try:
        event = json.load(sys.stdin)
    except ValueError:
        return
    prompt = (event.get("prompt") or "").strip()
    # Slash commands, and harness messages fed in as prompts (task notifications, system notes).
    if len(prompt) < MIN_PROMPT or prompt.startswith(("/", "<", "[")):
        return
    found = hints(prompt, event.get("cwd") or os.getcwd())
    if not found:
        return
    lines = ["Likely code locations for this prompt (grepai semantic match; a starting point, may be wrong):"]
    lines += [f"- {p}:{s}-{e}" if s else f"- {p}" for p, s, e in found]
    print(json.dumps({"hookSpecificOutput": {"hookEventName": "UserPromptSubmit",
                                             "additionalContext": "\n".join(lines)}}))


if __name__ == "__main__":
    try:
        main()
    except Exception:
        pass  # never block or clutter a prompt
    sys.exit(0)
