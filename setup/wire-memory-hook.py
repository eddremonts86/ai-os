#!/usr/bin/env python3
"""Wire setup/hooks/claude-session-memory.py into Claude Code as a SessionStart hook.

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
SCRIPT = ROOT / "setup" / "hooks" / "claude-session-memory.py"
SETTINGS = Path.home() / ".claude" / "settings.json"
COMMAND = f'python3 "{SCRIPT}"'


def main():
    check = "--check" in sys.argv
    try:
        settings = json.loads(SETTINGS.read_text()) if SETTINGS.exists() else {}
    except ValueError:
        print(f"{SETTINGS} is not valid JSON — not touching it")
        return 2

    groups = settings.setdefault("hooks", {}).setdefault("SessionStart", [])
    ours = [h for g in groups for h in g.get("hooks", []) if SCRIPT.name in h.get("command", "")]
    if any(h.get("command") == COMMAND for h in ours) and len(ours) == 1:
        print("session-memory hook: wired")
        return 0
    if check:
        print("session-memory hook: NOT wired (run: python3 setup/wire-memory-hook.py)")
        return 1

    # Drop stale copies (e.g. an old repo path), then add ours once.
    for g in groups:
        g["hooks"] = [h for h in g.get("hooks", []) if SCRIPT.name not in h.get("command", "")]
    groups[:] = [g for g in groups if g.get("hooks")]
    groups.append({"hooks": [{"type": "command", "command": COMMAND, "timeout": 15}]})

    if SETTINGS.exists():
        shutil.copy2(SETTINGS, SETTINGS.with_name(f"settings.json.bak-{time.strftime('%Y%m%d-%H%M%S')}"))
    SETTINGS.parent.mkdir(parents=True, exist_ok=True)
    SETTINGS.write_text(json.dumps(settings, indent=2) + "\n")
    print(f"session-memory hook: wired into {SETTINGS}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
