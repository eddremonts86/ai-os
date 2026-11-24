#!/usr/bin/env python3
"""Create context/personal/ for a new install, once.

  seed-personal-context.py [ROOT]      ROOT defaults to the repo this script lives in

context/personal/ is git-ignored (it describes one person and one machine), so a fresh clone has none. This
writes the files every agent reads, as short stubs to fill in; context/README.md describes each one and the
optional files (git identities, ssh hosts, publishing, the local replica's app list).
Only missing files are written: what you already wrote is never overwritten.
Prints the paths it created, or "nothing to create". Standard library only.
"""

import sys
from pathlib import Path

TEMPLATES = {
    "me/profile.md": """# Profile

Who you are. Agents read this first.

- **Name:** <your name>
- **Role:** <what you do>
- **Languages:** <chat language>; code, docs and commits in English.
""",
    "me/preferences.md": """# Preferences

How agents should work with you: language and tone, output format, autonomy, trigger phrases.

- **Chat:** <language and register>
- **Autonomy:** <how far an agent may go without asking>
""",
    "me/bridge.md": """<!-- Appended to the global instructions of every CLI: your chat language, tone and trigger phrases. -->
""",
    "work/README.md": """# Work

One folder per scope (`<scope>/README.md`: your role there, its conventions, its design system, its projects).
`scopes.yaml` says which folder belongs to which scope.
""",
    "work/scopes.yaml": """# Which part of your work a folder belongs to. Format: context/README.md, "work/scopes.yaml".
default: personal
guard:
  always_block: []
scopes:
  personal:
    label: Personal
    paths: []
""",
    "work/projects.md": """# Projects

| Project | Purpose | Stack | Last commit | Remote |
| --- | --- | --- | --- | --- |
""",
    "machine/facts.md": """# Machine

Facts about this computer: OS and versions, shell, ports already taken, traps that cost you an afternoon.
""",
    "machine/shell.zsh": "# Personal zsh aliases and functions, sourced by the shared ~/.zshrc.\n",
    "machine/shell.ps1": "# Personal PowerShell functions, dot-sourced by the shared profile.\n",
    "machine/install.yaml": """# Your install profile: what AI-OS adds on top of the shared base on THIS machine.
# Read by setup/install-mac.sh and setup/install-windows.ps1; an AIOS_* env var wins over a value here.

shell_theme: false       # Oh My Zsh + Powerlevel10k and AI-OS's themed ~/.zshrc (yours kept as *.pre-aios.bak)
fonts: false             # CaskaydiaCove Nerd Font
terminal_theme: false    # Terminal.app (Pro) and Warp restyle

clis: []                 # optional CLIs from npm: codex, gemini

# Written by the selector (`ai-os install` / create-ai-os); --full ignores skip: and exclude:
skip: []                 # default-on parts to leave out: claude, opencode, memory, mcp, ponytail, hooks
exclude: []              # packages from the shared Brewfile / pip / npm / Chocolatey lists to leave out
extras: false            # also install the optional apps: dev-env/packages/Brewfile.extras (Mac), the Chocolatey extras (Windows)
ui_indexer: false        # ui-indexador (shadcn registry index), Mac
floorplan: false         # Floorplan codebase-map plugin for Claude Code / Codex, pinned to a reviewed commit

mcp:                     # shared servers live in ai-config/mcp/*.yaml
  enable: []             # names to turn on (e.g. rea)
  disable: []            # names to turn off
  servers: []            # your own, same shape as ai-config/mcp/*.yaml

brew: []                 # extra Homebrew formulae
casks: []                # extra Homebrew casks
npm: []                  # extra global Node packages (pnpm)
""",
    "inbox/pending.md": "# Pending\n\nWhat is waiting on you. Delete an item when it is done.\n",
}


def seed(root):
    dst = Path(root) / "context" / "personal"
    created = []
    for rel, text in TEMPLATES.items():
        path = dst / rel
        if not path.exists():
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(text, encoding="utf-8")
            created.append(rel)
    return created


if __name__ == "__main__":
    if sys.argv[1:2] and sys.argv[1].startswith("-"):
        sys.exit(__doc__)
    done = seed(sys.argv[1] if len(sys.argv) > 1 else Path(__file__).resolve().parent.parent)
    print(", ".join(done) if done else "nothing to create")
