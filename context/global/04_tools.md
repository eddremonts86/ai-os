# 04 — Tools

The AI-OS toolchain: the CLIs it wires, the skills, diagrams, env config, setup and the traps that
were learned the hard way. Facts about one specific computer live in `context/personal/machine/facts.md`.

## CLI tools

| CLI              | Path          | Notes                    |
| ---------------- | ------------- | ------------------------ |
| **Claude Code**  | `~/.claude/`  | Anthropic official       |
| **Codex**        | `~/.codex/`   | OpenAI                   |
| **Gemini CLI**   | `~/.gemini/`  | Google                   |
| **Antigravity**  | `~/.agents/`  | VSCode fork              |
| **Hermes Agent** | `~/.hermes/`  | Nous Research            |
| **MiniMax Code** | `~/.minimax/` | Mac-only overlay support |

## Global skills

- Flat skills live in `$AI_OS_ROOT/ai-config/skills/`.
- Mac setup distributes flat skills via symlinks to 6 CLI targets.
- Windows setup distributes flat skills to the 5 core CLI targets.
- **14 superpowers skills** (REQUIRED for AI-OS).
- **Source of truth:** `$AI_OS_ROOT/ai-config/skills/`.

### Diagrams

- **`diagram-design`** — 27 editorial diagram types → self-contained HTML + inline SVG.
  Third-party (MIT, `cathrynlavery/diagram-design`), vendored with local brand deltas; see
  `ai-config/skills/diagram-design/VENDORED_FROM.md`.
- Skinned with the AI-OS brand, dark-first. Tokens live in `context/global/06_brand.md` — the skill's
  brand onboarding is **disabled on purpose** (it would rewrite the shared skill for every
  project). Per-project override: `.ai-os/brand-tokens.md` in that project's root.
- PNG export needs `playwright` + chromium in the AI-OS venv (`~/.ai-os/venv`). HTML and SVG
  work without it. `setup/verify.sh` section 10b reports the browser as an optional check.
- **`archify`** — interactive, validated architecture / workflow / sequence / dataflow /
  lifecycle diagrams as standalone HTML, from a description or from repo evidence. Third-party
  (MIT, `tt-a1i/archify`), pinned v3.0.1, not re-skinned; see
  `ai-config/skills/archify/VENDORED_FROM.md`. Needs Node >= 18 and a local Chrome for its
  browser gate. Run with `ARCHIFY_UPDATE_CHECK_DISABLED=1`. Output goes to `.archify/` in the
  working directory.
- Routing vs other diagram tools: `rules/always_do.md` § "When a task needs a diagram".
  The gstack `diagram` skill (excalidraw triplet) was retired 2026-08-13 — full trigger
  collision with `diagram-design`.

## Local OCR (LiteParse + OCRia-nano-1)

- `lit` (PyPI `liteparse`, Apache-2.0) turns scans and screenshots into text locally so a model gets text instead
  of image tokens. macOS: `dev-env/packages/pip-packages.txt` → `~/.ai-os/venv`; Windows: `uv tool` (step 7h).
  Both installers then pull `ocria-nano@1.0.0` (~75 MB, `~/.cache/liteparse/models/`) once.
- Model licence: OCRia-nano-1 Model License (RAIL-M based), free commercial use only under $2M revenue and $2M
  total funding, not in a LlamaParse competitor. Personal and dev tooling use is fine.
- When to use it and the fallback order: `rules/always_do.md` "Images and scanned PDFs".

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

- `~/.zshrc` → `$AI_OS_ROOT/dev-env/dotfiles/zsh/.zshrc`
- `~/.p10k.zsh` → `$AI_OS_ROOT/dev-env/dotfiles/zsh/.p10k.zsh`
- `~/.gitignore_global` → `$AI_OS_ROOT/dev-env/dotfiles/git/.gitignore_global`

## Setup

- **1-command:** `bash $AI_OS_ROOT/setup/install-mac.sh`
- **Verify:** `bash $AI_OS_ROOT/setup/verify.sh`
- **CI:** GitHub Actions (`.github/workflows/test-{mac,linux,windows}.yml`).

## Scheduled jobs are not verified by reading their files

`launchctl print "gui/$(id -u)/<label>"` is the only proof a launchd job exists — a plist
sitting in `~/Library/LaunchAgents/` with a healthy-looking last log proves nothing. And a
Hermes cron job keeps its **own copy** of its prompt, so editing the version-controlled file
changes nothing until `hermes cron edit <id> --prompt "$(cat <file>)"` re-applies it.

Hermes also refuses to run any **unpinned** job after the global inference config changes
(`[drift_skip]`, "Skipped to prevent unintended spend", alert sent once). Pin with
`hermes cron edit <id> --provider <p> --model <m>`; the pin is visible in
`~/.hermes/cron/jobs.json` (`{"jobs": [...]}`) but not in `hermes cron list`.

## The preview pane reads `launch.json` from the session root, not the project

`preview_start` looks for `.claude/launch.json` relative to the **session's working directory**. When
a session is opened at the projects root (the directory containing `ai-os/`) rather than inside a project, a project-local
`.claude/launch.json` is invisible to it — the tool reports "No .claude/launch.json found" and names
the root path it wanted.

Fix: put the config at the session root and have each entry cd into its own project.

```json
{
  "name": "myapp-dev",
  "runtimeExecutable": "bash",
  "runtimeArgs": ["-lc", "cd /path/to/projects/scope/myapp && exec ./node_modules/.bin/vite dev --port 3007"],
  "port": 3007
}
```

Invoke `./node_modules/.bin/vite` directly, not `pnpm dev`: going through pnpm makes the dev server
depend on which pnpm is on PATH, and a pnpm of a different major refuses to run any script until it
has purged `node_modules`, which it cannot confirm without a TTY.
