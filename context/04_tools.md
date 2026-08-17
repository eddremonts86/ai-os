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

### Diagrams

- **`diagram-design`** — 27 editorial diagram types → self-contained HTML + inline SVG.
  Third-party (MIT, `cathrynlavery/diagram-design`), vendored with local brand deltas; see
  `ai-config/skills/diagram-design/VENDORED_FROM.md`.
- Skinned with the AI-OS brand, dark-first. Tokens live in `context/06_brand.md` — the skill's
  brand onboarding is **disabled on purpose** (it would rewrite the shared skill for every
  project). Per-project override: `.ai-os/brand-tokens.md` in that project's root.
- PNG export needs `playwright` + chromium in the AI-OS venv (`~/.ai-os/venv`). HTML and SVG
  work without it. `setup/verify.sh` section 10b reports the browser as an optional check.
- Routing vs other diagram tools: `rules/always_do.md` § "When a task needs a diagram".
  The gstack `diagram` skill (excalidraw triplet) was retired 2026-08-13 — full trigger
  collision with `diagram-design`.

## Environment config (secrets)

- **Master merged `.env`:** `dev-env/env-config/.env` — single source of truth for
  local env values across all projects (DB URLs, ports, LLM endpoints/keys, auth
  secrets, agent tokens, infra creds). Gitignored, holds real secrets.
- **Safe template:** `dev-env/env-config/.env.example` — committed, placeholders only.
  Use it when you need a variable name/shape without a real secret.
- **Reference:** `dev-env/env-config/env-reference.html` (gitignored).
- **Rule:** when a task needs an env value (DB URL, API key, port, LLM base URL,
  service token), read the master `.env` first — do not invent, hardcode, or ask for
  a value that is already there. Use values in place; never echo, print, log, or
  commit the real secrets (see `rules/never_do.md` and `rules/always_do.md`).
- Sections in the file: 1 App · 2 Database · 3 Auth (Better Auth + Clerk) · 4 Admin ·
  5 LLM cloud (MiniMax/OpenAI/Anthropic) · 6 LLM local (Ollama/llama.cpp/LM Studio) ·
  7 RAG/Embeddings · 8 Agents (OpenClaw/Telegram/open-design) · 9 Hermes ·
  10 Infra (Hetzner/Coolify) · 11 GitHub · 12 Monitoring · 13 misc tokens.

## Dotfiles (symlinks)

- `~/.zshrc` → `~/Projects/ai-os/dev-env/dotfiles/zsh/.zshrc`
- `~/.p10k.zsh` → `~/Projects/ai-os/dev-env/dotfiles/zsh/.p10k.zsh`
- `~/.gitignore_global` → `~/Projects/ai-os/dev-env/dotfiles/git/.gitignore_global`

## Setup

- **1-command:** `bash ~/Projects/ai-os/setup/install-mac.sh`
- **Verify:** `bash ~/Projects/ai-os/setup/verify.sh`
- **CI:** GitHub Actions (`.github/workflows/test-{mac,linux,windows}.yml`).

## The preview pane reads `launch.json` from the session root, not the project

`preview_start` looks for `.claude/launch.json` relative to the **session's working directory**. When
a session is opened at the scope root (`~/Projects`) rather than inside a project, a project-local
`.claude/launch.json` is invisible to it — the tool reports "No .claude/launch.json found" and names
the root path it wanted.

Fix: put the config at the session root and have each entry cd into its own project.

```json
{
  "name": "myapp-dev",
  "runtimeExecutable": "bash",
  "runtimeArgs": ["-lc", "cd ~/Projects/scope/myapp && exec ./node_modules/.bin/vite dev --port 3007"],
  "port": 3007
}
```

Two standing constraints on this machine:

- **Port 3000 is taken** by the Hermes WhatsApp bridge (`hermes-agent/scripts/whatsapp-bridge/bridge.js`).
  Port 5173 is also usually in use. Pick 3007+ for a new dev server, and record *why* in the config's
  `//` key so nobody moves it back and kills the bridge.
- **Invoke `./node_modules/.bin/vite` directly**, not `pnpm dev`: going through pnpm makes the dev
  server depend on which pnpm is on PATH, and a pnpm of a different major refuses to run any script
  until it has purged `node_modules` — which it cannot confirm without a TTY.
