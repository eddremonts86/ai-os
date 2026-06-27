# 04 — Tools

Inventario de herramientas instaladas. Actualizar cuando cambie algo.

## Sistema

- **macOS:** 26.5.1 (Build 25F80), Apple Silicon (arm64).
- **Homebrew:** `/opt/homebrew/bin/brew` (v6.0.5).
- **Zsh:** `/bin/zsh` (5.9), shell default.
- **Powerlevel10k:** theme activo, preset `lean` (config en `~/.p10k.zsh`).
- **Oh My Zsh:** instalado en `~/.oh-my-zsh/`, plugins: git, zsh-autosuggestions, zsh-syntax-highlighting, docker, brew, npm, macos, vscode, etc.
- **CaskaydiaCove Nerd Font** instalada.

## Terminales (configurados 2026-06-27)

| Terminal | Config | Notas |
|---|---|---|
| **Warp** | `Oz v0.2026.06.24.09.19.stable_02`, theme dark, font CaskaydiaCove Nerd Font 14, opacity 0.95, cursor beam | Aplicación primaria |
| **Terminal nativo** (`com.apple.Terminal`) | theme "Pro" (true black), shell `/bin/zsh` | Cambiar font manualmente en Settings |
| **Hermes TUI/Desktop** | theme `midnight`, reasoning + cost + timestamps + footer enabled | TUI + Desktop app de Hermes |

## Editores / IDEs

- **VSCode** (`com.microsoft.VSCode`): IDE principal. `code` en PATH.
- **Windsurf / Antigravity**: VSCode fork con AI nativo (en uso).
- **Xcode**: solo para macOS/iOS nativo.

## CLIs / AI Agents (todos con skills via symlinks)

| CLI | Path | Notes |
|---|---|---|
| **Claude Code** | `~/.claude/skills/` (source) | 97 skills |
| **Codex** | `~/.codex/skills/` (symlink) | 97 skills |
| **Gemini CLI** | `~/.gemini/skills/` (symlink) | 97 skills |
| **Antigravity / Copilot** | `~/.agents/skills/` (symlink) | 97 skills |
| **Hermes Agent** | `~/.hermes/skills/imported/` (symlink, se invocan como `imported:<name>`) | 97 imported + 72 builtin |

## Package managers

- **pnpm 9.x**: prefer para Node projects (workspace + Turborepo).
- **npm**: legacy projects, fallback.
- **Homebrew**: tools globales del sistema.
- **uv**: Python projects (Hermes Agent).
- **Composer**: PHP/Laravel/OctoberCMS (legacy).
- **pip / pip3**: solo si no hay opción uv.

## Skills globales instaladas (97)

Ver detalle en `~/.claude/skills/READMEDD.md`. Categorías clave:

- **Proceso (superpowers):** brainstorming, TDD, debugging, planning, code review.
- **Frontend:** react-patterns, vue-patterns, tanstack-patterns, shadcn-patterns, typescript-advanced.
- **Backend:** drupal8-pattern.
- **Proyectos reales:** wave-template-conventions, hermes-mcp-pattern, iaworkspace-patterns.
- **Deploy:** hetzner-cloud-cli, coolify-deploy, coolify-env-sync-and-postdeploy, tanstack-start-coolify-deploy, prod-deploy-verification, prod-fleet-register, pnpm-docker-deploy, containers-architecture, shipping-and-launch.
- **Calidad:** ci-cd-and-automation, owasp-security, debugging-and-error-recovery, code-review-and-quality, release-it-framework.
- **Config:** env-config-and-secrets, env-config-iaworkspace.
- **Design:** frontend-design, impeccable, taste-skill, open-design-integration.

## MCP servers activos (7)

En `~/.hermes/config.yaml`:
- `time` (uvx mcp-server-time)
- `filesystem` (npx @modelcontextprotocol/server-filesystem)
- `pdf` (uvx mcp-pdf, 54 tools)
- `sequential-thinking` (npx)
- `memory` (npx)
- `chrome` (npx chrome-devtools-mcp)
- `agent-browser` (npx agent-browser-mcp-server)

## Herramientas dev

- **git** (con keychain quirk: ver `00_profile.md`)
- **docker** + docker compose (v2)
- **node 22** (via nvm/hermes node)
- **python 3.11** (via Hermes venv)
- **postgres 16** (workspace-postgres en Docker)
- **redis**, **chromadb** (en Docker)
- **curl**, **jq**, **ripgrep**, **fd**
- **mkcert** (certs locales)
- **hcloud** (Hetzner CLI, instalado via brew)

## Fuentes

- **Claude API:** OAuth via Hermes (`MiniMax-M3` es el model default).
- **GitHub:** `gh` CLI instalado, SSH + PAT.
- **npm:** registry default.
- **PyPI:** default.
- **Hetzner Cloud API:** token en `.env`.
- **Coolify API:** en `.env`.