# 04 — Tools

Inventory of installed tools. Update when something changes.

## System

- **macOS:** 26.5.1 (Build 25F80), Apple Silicon (arm64).
- **Homebrew:** `/opt/homebrew/bin/brew` (v6.0.5).
- **Shell:** zsh 5.9 (system, `/bin/zsh`).
- **Git:** via Xcode CLI Tools (not brew).

## Terminal

- **Warp:** `Oz v0.2026.06.24.09.19.stable_02` (installed via brew cask).
  - Font: CaskaydiaCove Nerd Font (size 14).
  - Theme: dark.
  - Opacity: 0.95.
- **Terminal.app (Mac native):** theme "Pro" (true black), shell `/bin/zsh`.
- **Oh My Zsh + Powerlevel10k** (preset lean).

## CLI tools

| CLI              | Path          | Notes                    |
| ---------------- | ------------- | ------------------------ |
| **Claude Code**  | `~/.claude/`  | Anthropic official       |
| **Codex**        | `~/.codex/`   | OpenAI                   |
| **Gemini CLI**   | `~/.gemini/`  | Google                   |
| **Antigravity**  | `~/.agents/`  | VSCode fork              |
| **Hermes Agent** | `~/.hermes/`  | Nous Research            |
| **MiniMax Code** | `~/.minimax/` | Mac-only overlay support |

## Languages

- **Python:** 3.11.15 (system).
- **Node.js:** v22 (via brew or nvm).
- **TypeScript:** 5.x via npm.

## Key packages

- **git, gh:** via Xcode CLI / brew.
- **uv, yq, warp:** via brew.
- **fzf, ripgrep, fd, hcloud, mkcert:** in Brewfile.

## Global skills

- Flat skills live in `~/Projects/ai-os/ai-config/skills/`.
- Mac setup distributes flat skills via symlinks to 6 CLI targets.
- Windows setup distributes flat skills to the 5 core CLI targets.
- **14 superpowers skills** (REQUIRED for AI-OS).
- **Source of truth:** `~/Projects/ai-os/ai-config/skills/`.

## Dotfiles (symlinks)

- `~/.zshrc` → `~/Projects/ai-os/dev-env/dotfiles/zsh/.zshrc`
- `~/.p10k.zsh` → `~/Projects/ai-os/dev-env/dotfiles/zsh/.p10k.zsh`
- `~/.gitignore_global` → `~/Projects/ai-os/dev-env/dotfiles/git/.gitignore_global`

## Setup

- **1-command:** `bash ~/Projects/ai-os/setup/install-mac.sh`
- **Verify:** `bash ~/Projects/ai-os/setup/verify.sh`
- **CI:** GitHub Actions (`.github/workflows/test-{mac,linux,windows}.yml`).
