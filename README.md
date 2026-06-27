# AI-OS

> AI Operating System local — Karpathy method (Spec + Verifier + Environment) + reproducible dev env setup for Mac and Windows.

**What is it?** Your versioned AI work system: persistent context, global skills, MCP servers, dotfiles, setup scripts. A new Mac = `git clone + bash setup/install-mac.sh` = 5 min and you have everything working.

**Who is it for?** Devs who use multiple CLIs (Claude Code, Codex, Gemini CLI, Antigravity, Hermes Agent) and want a consistent setup between Macs.

## CI Status

[![Test macOS](https://github.com/eddremonts86/ai-os/actions/workflows/test-mac.yml/badge.svg)](https://github.com/eddremonts86/ai-os/actions/workflows/test-mac.yml)
[![Test Linux](https://github.com/eddremonts86/ai-os/actions/workflows/test-linux.yml/badge.svg)](https://github.com/eddremonts86/ai-os/actions/workflows/test-linux.yml)
[![Test Windows](https://github.com/eddremonts86/ai-os/actions/workflows/test-windows.yml/badge.svg)](https://github.com/eddremonts86/ai-os/actions/workflows/test-windows.yml)

## Quickstart

### On a new Mac

```bash
# 1. Clone the repo (change URL if you move it)
git clone https://github.com/eddremonts86/ai-os ~/Projects/ai-os
cd ~/Projects/ai-os

# 2. Install everything
bash setup/install-mac.sh

# 3. Verify
bash setup/verify.sh
```

### On native Windows

```powershell
# 1. open PowerShell as Admin
# 2. Clone
git clone https://github.com/eddremonts86/ai-os $HOME\Projects\ai-os
cd $HOME\Projects\ai-os

# 3. Install
powershell -ExecutionPolicy Bypass -File .\setup\install-windows.ps1

# 4. Verify
powershell -ExecutionPolicy Bypass -File .\setup\verify-windows.ps1
```

## Structure

```
ai-os/
├── CLAUDE.md                    # Master instructions (AI-OS)
├── context/                     # Persistent context (profile, prefs, etc.)
├── rules/                       # Hard rules (always/ask/never)
├── specs/                       # Task Specs
├── verifiers/                   # Quality gates
├── skills/                      # Local skills
├── workflows/                   # Recurring processes
├── archive/                     # Completed Specs
├── outputs/                     # Generated artifacts
├── promps/                      # Original Karpathy prompts
│
├── ai-config/                   # AI config (replicable)
│   ├── skills/                  #   99 skills source of truth
│   ├── mcp/                     #   7 MCP servers (declarative)
│   ├── clis/                    #   CLI-specific config
│   └── commands/                #   Snippets
│
├── dev-env/                     # Dev env (replicable)
│   ├── dotfiles/                #   Source of truth for personal configs
│   ├── packages/                #   Brewfile, npm-globals, pip-packages
│   └── fonts/                   #   Nerd Fonts
│
├── setup/                       # Install scripts
│   ├── install-mac.sh           #   1-command: full Mac setup
│   ├── install-windows.ps1      #   1-command: full Windows setup
│   ├── verify.sh                #   Verify Mac setup
│   ├── verify-windows.ps1       #   Verify Windows setup
│   └── generate-mcp-config.py   #   Generates ~/.hermes/config.yaml
│
└── docs/                        # Documentation
    ├── README.md                 #   (this file)
    ├── getting-started.md        #   Onboarding for new users
    ├── cross-platform.md         #   Mac vs Windows differences
    ├── sharing.md                #   How to contribute
    └── architecture.md           #   How it's organized
```

## Common commands

```bash
# Start session with AI-OS
hermes chat --skills ai-os-quickstart

# Or from any CLI:
# Claude Code: /skill ai-os-quickstart
# Codex / Gemini / Antigravity: auto-loaded from ~/.codex/skills/, ~/.gemini/skills/

# Verify AI-OS state
bash setup/verify.sh

# List installed skills
hermes skills list | grep "imported"

# Create a new Spec
$EDITOR ~/projects/ai-os/specs/current_spec.md

# Archive a completed Spec
mv ~/projects/ai-os/specs/current_spec.md ~/projects/ai-os/archive/$(date +%Y-%m-%d)-slug.md
```

## Links

- **Setup details:** [docs/getting-started.md](docs/getting-started.md)
- **Cross-platform:** [docs/cross-platform.md](docs/cross-platform.md)
- **Sharing/Contributing:** [docs/sharing.md](docs/sharing.md)
- **Architecture:** [docs/architecture.md](docs/architecture.md)
- **AI-OS method:** [CLAUDE.md](CLAUDE.md)
- **Required superpowers:** [CLAUDE.md section 16](CLAUDE.md#16-️-requirement-superpowers-skills-mandatory)

## State

- 99 global skills (14 superpowers required + 84 community/custom + ai-os-karpathy + ai-os-quickstart)
- 7 declarative MCP servers
- Setup verified on Mac
- Setup documented for Windows
- CI in GitHub Actions (Mac + Linux + Windows)

## License

MIT (see [LICENSE](LICENSE)).
