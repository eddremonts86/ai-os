#!/usr/bin/env python3
"""ai-os project init — give a project the AI-OS basics without copying the framework into it.

  ai-os project init [PATH]            # PATH defaults to the current directory (must be a git repo)
  ai-os project init PATH --dry-run    # show what would change

Creates only what is missing and never overwrites anything:
  CLAUDE.md        short, from ai-config/templates/project-claude.md.tmpl (+ AGENTS.md → CLAUDE.md)
  .agents/skills/  where this project's own skills live (kept out of the global AI-OS set)
  .gitignore       appends the secret-leak patterns that are not already there
"""

import argparse
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TEMPLATE = ROOT / "ai-config" / "templates" / "project-claude.md.tmpl"
# `.env.*` is avoided on purpose: it would also hide .env.example.
IGNORE = [".env", ".env.local", ".env.*.local", ".env*.aside", ".playwright-mcp/"]


def init(path, dry=False):
    path = Path(path).resolve()
    if not (path / ".git").exists():
        raise SystemExit(f"{path} is not a git repository root")
    name = re.sub(r"[^A-Za-z0-9._-]", "-", path.name)
    done = []

    claude = path / "CLAUDE.md"
    if not claude.exists():
        text = TEMPLATE.read_text(encoding="utf-8").replace("{{PROJECT}}", name).replace("{{AI_OS_ROOT}}", str(ROOT))
        if not dry:
            claude.write_text(text, encoding="utf-8")
        done.append("CLAUDE.md (new)")
    agents = path / "AGENTS.md"
    if not agents.exists() and not agents.is_symlink() and (claude.exists() or dry):
        if not dry:
            try:
                agents.symlink_to("CLAUDE.md")
            except OSError:  # Windows without symlink rights
                agents.write_text("Read `CLAUDE.md` in this directory: it holds the instructions for this project.\n", encoding="utf-8")
        done.append("AGENTS.md -> CLAUDE.md (for Codex/Gemini/Antigravity)")

    skills = path / ".agents" / "skills"
    if not skills.exists():
        if not dry:
            skills.mkdir(parents=True)
            (skills / ".gitkeep").write_text("", encoding="utf-8")
        done.append(".agents/skills/")

    gi = path / ".gitignore"
    have = set(gi.read_text(encoding="utf-8").splitlines()) if gi.exists() else set()
    missing = [p for p in IGNORE if p not in have]
    if missing:
        if not dry:
            block = "\n# Secret-leak guards (ai-os project init)\n" + "\n".join(missing) + "\n"
            gi.write_text((gi.read_text(encoding="utf-8").rstrip("\n") + "\n" if gi.exists() else "") + block, encoding="utf-8")
        done.append(f".gitignore (+{', '.join(missing)})")

    prefix = "would create/change" if dry else "created/changed"
    print(f"{name}: {prefix}: " + "; ".join(done) if done else f"{name}: already set up, nothing to do")
    if done and not dry:
        print("Review with `git status`, edit the notes in CLAUDE.md, then commit.")
    return 0


def main():
    ap = argparse.ArgumentParser(description="Give a project the AI-OS basics.")
    ap.add_argument("command", choices=["init"])
    ap.add_argument("path", nargs="?", default=".")
    ap.add_argument("--dry-run", action="store_true")
    a = ap.parse_args()
    return init(a.path, a.dry_run)


if __name__ == "__main__":
    for _stream in (sys.stdout, sys.stderr):  # Windows consoles default to cp1252 and choke on the status symbols
        if hasattr(_stream, "reconfigure"):
            _stream.reconfigure(encoding="utf-8", errors="replace")
    sys.exit(main())
