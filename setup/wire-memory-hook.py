#!/usr/bin/env python3
"""Wire the AI-OS memory hooks into Claude Code.

  SessionStart     setup/hooks/claude-session-memory.py   graphiti facts for the repo
  UserPromptSubmit setup/hooks/claude-prompt-code-hints.py  likeliest code locations (grepai)

  python3 setup/wire-memory-hook.py           # install/repair (idempotent)
  python3 setup/wire-memory-hook.py --check   # report only, never writes

Merges into ~/.claude/settings.json without touching other keys or hooks; a
timestamped backup is written next to it before any change. Exit 0 = wired
(or would be), 1 = not wired, 2 = settings.json is not valid JSON.
"""

import json
import shutil
import sys
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
HOOKS = [("SessionStart", ROOT / "setup" / "hooks" / "claude-session-memory.py", 15),
         ("UserPromptSubmit", ROOT / "setup" / "hooks" / "claude-prompt-code-hints.py", 10)]
SETTINGS = Path.home() / ".claude" / "settings.json"


def command(script):
    return f'python3 "{script}"'


def wired(settings, event, script):
    ours = [h for g in settings.get("hooks", {}).get(event, []) for h in g.get("hooks", [])
            if script.name in h.get("command", "")]
    return len(ours) == 1 and ours[0].get("command") == command(script)


def main():
    check = "--check" in sys.argv
    try:
        settings = json.loads(SETTINGS.read_text(encoding="utf-8")) if SETTINGS.exists() else {}
    except ValueError:
        print(f"{SETTINGS} is not valid JSON — not touching it")
        return 2

    missing = [(e, s, t) for e, s, t in HOOKS if not wired(settings, e, s)]
    if not missing:
        print("memory hooks: wired (session facts + prompt code hints)")
        return 0
    if check:
        names = ", ".join(e for e, _, _ in missing)
        print(f"memory hooks: NOT wired ({names}) (run: python3 setup/wire-memory-hook.py)")
        return 1

    for event, script, timeout in missing:
        groups = settings.setdefault("hooks", {}).setdefault(event, [])
        # Drop stale copies (e.g. an old repo path), then add ours once.
        for g in groups:
            g["hooks"] = [h for h in g.get("hooks", []) if script.name not in h.get("command", "")]
        groups[:] = [g for g in groups if g.get("hooks")]
        groups.append({"hooks": [{"type": "command", "command": command(script), "timeout": timeout}]})

    if SETTINGS.exists():
        shutil.copy2(SETTINGS, SETTINGS.with_name(f"settings.json.bak-{time.strftime('%Y%m%d-%H%M%S')}"))
    SETTINGS.parent.mkdir(parents=True, exist_ok=True)
    SETTINGS.write_text(json.dumps(settings, indent=2) + "\n")
    print(f"memory hooks: wired into {SETTINGS}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
