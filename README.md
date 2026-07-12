# AI-OS — AI Operating System

> **Personal AI work system based on Andrej Karpathy's method** (Spec + Verifier + Environment), extended with a reproducible dev environment setup that works across Macs and Windows.
>
> **One command setup. Flat skills + plugin bundles. Core CLIs. 1 repo.**

[![Test macOS](https://github.com/eddremonts86/ai-os/actions/workflows/test-mac.yml/badge.svg)](https://github.com/eddremonts86/ai-os/actions/workflows/test-mac.yml)
[![Test Linux](https://github.com/eddremonts86/ai-os/actions/workflows/test-linux.yml/badge.svg)](https://github.com/eddremonts86/ai-os/actions/workflows/test-linux.yml)
[![Test Windows](https://github.com/eddremonts86/ai-os/actions/workflows/test-windows.yml/badge.svg)](https://github.com/eddremonts86/ai-os/actions/workflows/test-windows.yml)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Skills: dynamic](https://img.shields.io/badge/skills-dynamic-green.svg)](ai-config/skills/)
[![+ ECC: 271](https://img.shields.io/badge/%2B_ECC-271-blue.svg)](vendor/ecc/)
[![+ claude.tools/gstack: 12](https://img.shields.io/badge/%2B_claude.tools%2Fgstack-12-purple.svg)](docs/claude-tools-integration.md)

---

## What is AI-OS?

AI-OS is the **single source of truth** for everything AI in your dev workflow:

- **Flat global skills** propagated to the supported AI CLIs (Claude Code, Codex, Gemini, Antigravity, Hermes, plus MiniMax on Mac).
- **+271 optional ECC skills** (vendored at `vendor/ecc/`, opt-in via `bash setup/install-ecc.sh`).
- **+12 optional claude.tools / gstack skills** (4 from claude.tools, 8 cherry-picked from gstack, plus the OpenAI Codex plugin at `vendor/codex-plugin-cc/`).
- **14 required superpowers skills** (the framework that powers all workflows).
- **5 recurring workflows** (daily_start, project_start, coding, research, content_creation).
- **3 rules** (always_do, ask_before_doing, never_do) — enforced constraints.
- **3 verifiers** (quality_checklist, critic_prompt, source_check_prompt) — applied after every task.
- **10 declarative MCP servers** (time, filesystem, pdf, sequential-thinking, memory, chrome, agent-browser, codebase-memory-mcp, grepai, graphiti — graphiti's Docker deployment passed a structural smoke test 2026-07-12, but real knowledge-graph operations need a real `OPENAI_API_KEY`; see `ai-config/mcp/graphiti.yaml`).
- **Replicable dev env** (zsh + Oh My Zsh + p10k, Warp, Brewfile, git/ssh config templates).
- **1-command setup** on Mac, Linux, and Windows.
- **CI** (macOS, Linux, Windows runners) that validates the install scripts on every PR.

It's the answer to the question: *"I just got a new Mac. How do I get my AI setup back in 5 minutes?"*

---

## Why?

Most devs who use AI assistants daily end up with the same problems:

- Skills scattered across multiple CLI configs (`~/.claude/`, `~/.codex/`, etc.).
- MCP servers hardcoded in `~/.hermes/config.yaml` — no version control, no diff.
- dotfiles (`~/.zshrc`, `~/.gitconfig`) duplicated or out of sync between Macs.
- Workflows (Spec → Plan → Execute → Verify) only in your head.
- 14 superpowers skills are required for the workflows to work, but they're missing in fresh setups.
- Onboarding a new dev (junior, partner) takes hours of "first, install this, then configure that..."

AI-OS solves all of this with **a single git repo** that contains:

1. The **method** (Spec → Verifier → Environment) as workflows and templates.
2. The **skills** as a single source of truth, symlinked to the supported CLIs.
3. The **MCP config** as declarative YAML, generated at install time.
4. The **dev env** (shell, terminal, packages) as install scripts.
5. The **CI** that validates everything works on Mac, Linux, and Windows.

---

## Quick start

### Prerequisites

- **Mac (Apple Silicon or Intel)** or **Windows 10/11** with PowerShell, or **Linux**.
- `git`, `curl`, internet connection.
- 30-60 minutes for the first install (most of it is downloading packages).

### One-command setup

```bash
# 1. Clone
git clone https://github.com/eddremonts86/ai-os ~/Projects/ai-os
cd ~/Projects/ai-os

# 2. Install everything (Mac)
bash setup/install-mac.sh

# 3. Verify
bash setup/verify.sh
```

For Windows (PowerShell as Admin):

```powershell
git clone https://github.com/eddremonts86/ai-os $HOME\Projects\ai-os
cd $HOME\Projects\ai-os
powershell -ExecutionPolicy Bypass -File .\setup\install-windows.ps1
powershell -ExecutionPolicy Bypass -File .\setup\verify-windows.ps1
```

The install script is **idempotent**: run it multiple times without breaking anything. It also has **dry-run mode** for CI:

```bash
DRY_RUN=1 bash setup/install-mac.sh   # simulates everything, doesn't touch your system
```

### What the install does

| Step | What happens |
|---|---|
| 1 | Installs Homebrew packages from `dev-env/packages/Brewfile` (60+ packages). |
| 2 | Installs npm globals from `dev-env/packages/npm-globals.txt`. |
| 3 | Installs Python user packages from `dev-env/packages/pip-packages.txt`. |
| 4 | Installs Oh My Zsh + Powerlevel10k + custom plugins. |
| 5 | Creates dotfile symlinks (`~/.zshrc`, `~/.gitconfig`, `~/.ssh/config`, etc.) from `dev-env/dotfiles/`. |
| 6 | Symlinks flat skills from `ai-config/skills/` to supported CLI skill directories. |
| 7 | Installs the 14 required superpowers skills (if missing). |
| 8 | Generates `~/.hermes/config.yaml` from `ai-config/mcp/*.yaml` (7 servers). |
| 9 | Configures Warp (Mac) + Terminal.app. |
| 10 | Runs verification (12 sections). |

---

## Architecture

AI-OS is structured in **3 layers**, each with a clear responsibility:

```
┌──────────────────────────────────────────────────────────────────┐
│  Layer 0: AI-OS (this repo)                                      │
│  • Method: Spec → Verifier → Environment (Karpathy)             │
│  • 18 master instructions in CLAUDE.md                            │
│  • 5 workflows, 3 rules, 3 verifiers                            │
│  • Flat global skills + optional plugin bundles                  │
│  • 10 declarative MCP servers in YAML (all enabled)              │
│  • Replicable dev-env (zsh, Warp, Brewfile, packages)           │
└──────────────────────────────────────────────────────────────────┘
                              ▲ symlinks
┌──────────────────────────────────────────────────────────────────┐
│  Layer 1: AI CLIs                                                │
│  Claude Code, Codex, Gemini, Antigravity, Hermes                  │
│  Each one reads skills from its own ~/.{claude,codex,gemini,...}/│
└──────────────────────────────────────────────────────────────────┘
                              ▲ symlinks
┌──────────────────────────────────────────────────────────────────┐
│  Layer 2: OS & Shell                                            │
│  Mac: zsh + Oh My Zsh + p10k + Warp                             │
│  Windows: PowerShell + Windows Terminal                        │
│  Linux: bash + zsh                                              │
└──────────────────────────────────────────────────────────────────┘
                              ▲
┌──────────────────────────────────────────────────────────────────┐
│  Layer 3: System                                                │
│  Homebrew (Mac) / Chocolatey (Windows) / apt (Linux)            │
│  Node, Python, Git, Docker, fonts, etc.                        │
└──────────────────────────────────────────────────────────────────┘
```

### Repository layout

```
ai-os/
├── CLAUDE.md                    # Master instructions (18 sections)
├── README.md                    # This file
├── LICENSE                      # MIT
│
├── context/                     # Persistent context (6 files, mine)
│   ├── 00_profile.md            # Who I am, style, autonomy rules
│   ├── 01_business_or_work.md    # Schilling + personal projects
│   ├── 02_projects.md            # Active/archived projects
│   ├── 03_preferences.md         # Language, format, autonomy triggers
│   ├── 04_tools.md               # Mac, terminals, CLIs, packages
│   └── 05_sources.md             # Official docs URLs
│
├── rules/                       # Hard rules (3 files)
│   ├── always_do.md             # 23 mandatory actions + parallel dispatch rule
│   ├── ask_before_doing.md       # 30+ actions that need confirmation
│   └── never_do.md               # 60+ absolute prohibitions
│
├── workflows/                   # Recurring processes (5 files)
│   ├── daily_start.md            # Load AI-OS at session start
│   ├── project_start.md          # Create Spec + dispatch plan
│   ├── coding.md                 # TDD + verification + PR
│   ├── research.md               # Research + summarize findings
│   └── content_creation.md       # Docs, ADRs, READMEs
│
├── specs/                        # One active Spec + template
│   ├── spec_template.md          # Template for new Specs
│   └── current_spec.md           # Active Spec (reset between tasks)
│
├── verifiers/                    # Quality gates (3 files)
│   ├── quality_checklist.md      # 30+ items to check
│   ├── critic_prompt.md          # Self-critique prompt
│   └── source_check_prompt.md    # Verify URLs and claims
│
├── skills/                       # Local skills (workspace-specific, 2 files)
│   ├── README.md
│   └── skill_template.md
│
├── docs/                         # Documentation (4 files)
│   ├── getting-started.md         # Onboarding for new users
│   ├── cross-platform.md          # Mac vs Windows differences
│   ├── sharing.md                 # How to contribute
│   └── architecture.md            # Internal organization
│
├── prompts/                       # Original Karpathy prompts (8 files)
│   ├── README.md
│   ├── setup/                     # Run once (3 files)
│   ├── daily-use/                 # Run daily (1 file)
│   ├── verifiers-specs/            # Per task (2 files)
│   └── skill-creation/            # When discovering patterns (1 file)
│
├── archive/                      # Versioned completed Specs
├── outputs/                      # Generated artifacts (gitignored content)
│
├── ai-config/                    # AI config (replicable, 1297 files)
│   ├── skills/                    #   flat skills + nested plugin bundles
│   │   ├── ai-os-karpathy/        #   AI-OS router skill (own)
│   │   ├── ai-os-quickstart/      #   Bootstrap skill (own)
│   │   ├── brainstorming/         #   14 superpowers skills
│   │   ├── dispatching-parallel-agents/
│   │   ├── executing-plans/
│   │   ├── finishing-a-development-branch/
│   │   ├── receiving-code-review/
│   │   ├── requesting-code-review/
│   │   ├── subagent-driven-development/
│   │   ├── systematic-debugging/
│   │   ├── test-driven-development/
│   │   ├── using-git-worktrees/
│   │   ├── using-superpowers/     #   The router skill
│   │   ├── verification-before-completion/
│   │   ├── writing-plans/
│   │   ├── writing-skills/
│   │   ├── code-review-and-quality/
│   │   └── ... 84+ third-party skills (antfu, tanstack, react, shadcn, etc.)
│   └── mcp/                       #   10 declarative MCP servers (YAML, all enabled)
│       ├── README.md
│       ├── time.yaml
│       ├── filesystem.yaml
│       ├── pdf.yaml
│       ├── sequential-thinking.yaml
│       ├── memory.yaml
│       ├── chrome.yaml
│       └── agent-browser.yaml
│
├── dev-env/                      # Dev env (replicable, 13 files)
│   ├── dotfiles/                 #   Source of truth for personal configs
│   │   ├── zsh/                   #   .zshrc + .p10k.zsh
│   │   ├── git/                  #   .gitconfig template + personal/work
│   │   ├── ssh/                   #   config (no keys)
│   │   ├── warp/                  #   README with settings
│   │   └── terminal/              #   README with settings
│   ├── packages/                 #   Brewfile + npm-globals + pip-packages
│   └── fonts/                    #   Nerd Fonts guide
│
├── setup/                        # Install scripts (7 files, idempotent)
│   ├── install-mac.sh             #   1-command Mac setup (with DRY_RUN)
│   ├── install-mac.dry-run.sh     #   CI-mode simulation
│   ├── install-windows.ps1        #   1-command Windows setup
│   ├── install-windows.dry-run.ps1
│   ├── verify.sh                  #   8 health checks + npm/pip checks
│   ├── verify-windows.ps1         #   Windows health checks
│   └── generate-mcp-config.py     #   Auto-install PyYAML + generate config
│
└── .github/workflows/             # CI (3 workflows)
    ├── README.md
    ├── test-mac.yml               #   macos-latest
    ├── test-linux.yml             #   ubuntu-latest
    └── test-windows.yml           #   windows-latest
```

### ECC Integration (optional layer)

AI-OS can optionally vendor **[Everything Claude Code (ECC)](https://github.com/affaan-m/ECC)** — the largest publicly available Claude Code skill corpus (271 skills, 67 agents, 28 hooks) — as a **read-only subtree** at `vendor/ecc/`. It propagates to the core CLIs via symlinks, same as the AI-OS native skills, but with its own installer:

```bash
# One-time: vendor ECC
git clone --depth=1 https://github.com/affaan-m/everything-claude-code.git vendor/ecc

# Install (idempotent)
bash setup/install-ecc.sh

# Verify only (CI mode)
bash setup/install-ecc.sh --check
```

Why two skill sources of truth?

| Source | Owner | What |
|---|---|---|
| `ai-config/skills/` | AI-OS (you) | Hand-curated, evolve with your workflows |
| `vendor/ecc/skills/` (271) | ECC upstream | Community-maintained, update with `git pull` |

The two never conflict in practice because ECC and AI-OS use different naming conventions (ECC: `tdd-workflow`, AI-OS: `test-driven-development`). In Claude Code specifically, ECC also loads as a **plugin** (`~/.claude/plugins/ecc → vendor/ecc/`), exposing hooks and slash commands that the AI-OS installer doesn't manage.

Full architecture, hook policy, and update procedure: [`docs/ecc-integration.md`](docs/ecc-integration.md). CI validates the ECC integration in [`test-mac.yml`](.github/workflows/test-mac.yml), [`test-linux.yml`](.github/workflows/test-linux.yml), and [`test-windows.yml`](.github/workflows/test-windows.yml) — the `--check` step is non-fatal and skips if `vendor/ecc/` is absent.

### claude.tools / gstack Integration (optional layer)

AI-OS also vendors a **small, focused set of skills** from [claude.tools](https://claude.tools) and cherry-picks a handful of skills from [gstack](https://github.com/earendil-works/gstack) — the same pattern as ECC but at a much smaller scale. These are checked directly into `ai-config/skills/`, so they propagate to `~/.claude/skills/` via `install-mac.sh` step 5 like any other AI-OS-native skill. The companion installer wires them into the other 4 CLIs and creates the plugin link for codex-plugin-cc:

```bash
# Install (idempotent). The 12 individual skills are already in ai-config/skills/,
# so this script's main job is to wire them to the 4 non-Claude CLIs and to
# symlink vendor/codex-plugin-cc/ into ~/.claude/plugins/.
bash setup/install-claude-tools.sh

# Verify only (CI mode)
bash setup/install-claude-tools.sh --check
```

What gets vendored:

| Source | Where it lives | Count |
|---|---|---|
| claude.tools (`humanizer`, `caveman`, `notebooklm-skill`, `frontend-design-alt`) | `ai-config/skills/` | 4 skills |
| gstack (`careful`, `context-save`, `context-restore`, `diagram`, `freeze`, `guard`, `spec`, `unfreeze`) | `ai-config/skills/` | 8 skills |
| OpenAI Codex plugin for Claude Code | `vendor/codex-plugin-cc/` (plugin) + 3 internal skills propagated to the core CLIs | 1 plugin + 3 skills |

Why a separate installer (instead of folding into `install-mac.sh`)?

- **Idempotency**: `install-claude-tools.sh --check` is the CI entrypoint — it validates frontmatter on every PR without touching the filesystem. Keeps `install-mac.sh` focused on Mac bootstrap.
- **Selective install**: Users who don't want the plugin (it's optional, requires ChatGPT sub or OpenAI API key) can skip it.
- **Mirrors ECC**: Same shape as `install-ecc.sh`, so the CI pattern is consistent.

Full architecture, skill catalog, and update procedure: [`docs/claude-tools-integration.md`](docs/claude-tools-integration.md). CI validates it in the three platform workflows — the `--check` step is non-fatal and uses `|| echo ::warning::` so PRs that don't touch the integration stay green.

---

## The method: Spec → Verifier → Environment

This is Karpathy's framework for AI-assisted work. Every non-trivial task follows this loop:

```
┌─────────────┐     ┌──────────────┐     ┌──────────────┐     ┌─────────────┐
│  1. Spec    │ ──> │  2. Plan    │ ──> │  3. Execute │ ──> │ 4. Verify  │
│  objective  │     │  blocks     │     │  blocks     │     │  (gates)   │
│  criteria  │     │  (≤30 min)  │     │  (parallel) │     │            │
└─────────────┘     └──────────────┘     └──────────────┘     └─────────────┘
```

1. **Spec**: Create a Spec in `specs/current_spec.md` using `specs/spec_template.md`. Define objective, acceptance criteria, non-goals, plan (blocks of ≤30 min), risks.
2. **Plan**: → Load skill `writing-plans` to break the Spec into detailed blocks.
3. **Execute**: Block by block. → Load skill `verification-before-completion` after each block.
4. **Verify**: Apply the 3 verifiers (`quality_checklist`, `critic_prompt`, `source_check_prompt`). 6 gates per task.

At the end: after explicit authorization for any protected git action, archive a
completed Spec to `archive/`, reset `current_spec.md`, then commit or push as
appropriate.

Full details: [`CLAUDE.md`](CLAUDE.md).

---

## Key rules

### Always do (24 actions)

1. Read `CLAUDE.md` + `context/` at session start.
2. Load skill `using-superpowers` as the router.
3. Follow the Spec → Plan → Execute → Verify loop.
4. **Use sub-agents in parallel when possible** (if a task has 2+ independent workstreams, dispatching is mandatory).
5. Run verifiers before declaring done.
6. Use conventional commits.
7. Archive completed Specs.

Full list: [`rules/always_do.md`](rules/always_do.md).

### Never do (60+ prohibitions)

- Never `rm -rf` outside safe paths.
- Never commit secrets, API keys, SSH private keys.
- Never modify another user's home or system files.
- Never disable git hooks (`--no-verify`) without permission.
- Never invent URLs, versions, or sources.
- Never claim done without verification.

Full list: [`rules/never_do.md`](rules/never_do.md).

### Ask before doing (30+ actions)

- `rm -rf` outside safe paths.
- `sudo` commands (except for personal brew ownership).
- Git force pushes (even on your own branch).
- Installing unverified packages.
- Publishing (npm publish, etc.).
- Sending messages on behalf of the user.

Full list: [`rules/ask_before_doing.md`](rules/ask_before_doing.md).

---

## The 14 required superpowers skills

These come from [obra/superpowers](https://github.com/obra/superpowers). AI-OS workflows invoke them explicitly. Without them, workflows fail. This is the exact set checked by `setup/verify.sh`.

| Skill | When loaded |
|---|---|
| `using-superpowers` | Router for all skills (load at session start) |
| `brainstorming` | When the idea is vague |
| `writing-plans` | After Spec, before execution |
| `writing-skills` | Creating or improving skills |
| `executing-plans` | During execution (block by block) |
| `verification-before-completion` | Before claiming done |
| `test-driven-development` | Writing tests |
| `systematic-debugging` | Bug or unexpected behavior |
| `finishing-a-development-branch` | At the end of work |
| `requesting-code-review` | Asking for review |
| `receiving-code-review` | Receiving review |
| `dispatching-parallel-agents` | Multi-task work |
| `subagent-driven-development` | Executing implementation plans |
| `using-git-worktrees` | Large feature work or parallel branches |

Not part of this set but also required by AI-OS workflows: `code-review-and-quality` (before PR). Not part of this set and explicitly optional/third-party: the gstack-vendored `spec` skill (see `vendor/gstack/`) — AI-OS's own Spec flow is `workflows/project_start.md`.

If any is missing, run [`prompts/setup/03-required-skills.md`](prompts/setup/03-required-skills.md).

---

## MCP servers

7 declarative servers in `ai-config/mcp/*.yaml`. Generated to `~/.hermes/config.yaml` at install time:

| Server | Purpose |
|---|---|
| `time` | Time/date/timezone utilities |
| `filesystem` | Read/write files outside cwd |
| `pdf` | PDF reading, extraction, OCR |
| `sequential-thinking` | Multi-step planning |
| `memory` | Persistent knowledge graph |
| `chrome` | Browser automation, screenshots |
| `agent-browser` | Vercel agent-browser (token-efficient @ref) |

To add a new server: create `ai-config/mcp/<name>.yaml`, run `python3 setup/generate-mcp-config.py`, commit.

---

## How to use AI-OS

### Daily session

```
1. Start CLI (Hermes / Claude Code / etc.)
2. → Load skill `ai-os-karpathy` (or `ai-os-quickstart` for first-time setup)
3. → Load skill `using-superpowers` (router)
4. Follow `workflows/daily_start.md` (load context + rules + Spec)
5. Check `specs/current_spec.md`. The no-active-Spec template means a new task; otherwise execute the one active Spec.
6. At the end → run verifiers → archive a completed Spec → reset `current_spec.md` → commit only when authorized.
```

### New task (>30 min)

```
1. Follow `workflows/project_start.md`
2. → Load skill `brainstorming` (if idea is vague)
3. Create Spec in `specs/current_spec.md`
4. Get user approval
5. → Load skill `writing-plans`
6. Dispatch sub-agents in parallel for independent blocks
7. → Load skill `verification-before-completion` after each block
8. → Load skill `code-review-and-quality` before final commit
9. → Load skill `finishing-a-development-branch` at the end
10. Archive the completed Spec to `archive/` and reset `current_spec.md`
```

### Code work (feature, bug, refactor)

```
1. Follow `workflows/coding.md`
2. → Load skill `systematic-debugging` if it's a bug
3. → Load skill `test-driven-development` for tests
4. → Load skill `using-git-worktrees` for large features
5. Run TDD: red → green → refactor
6. → Load skill `code-review-and-quality` before PR
```

### Research

```
1. Follow `workflows/research.md`
2. Search official docs
3. Summarize with sources
4. → Load skill `verifiers/source_check_prompt` to verify URLs
5. → Load skill `verifiers/critic_prompt` to review
```

### Writing docs

```
1. Follow `workflows/content_creation.md`
2. Define audience and goal
3. Write first draft
4. → Load skill `verification-before-completion`
5. → Load skill `verifiers/critic_prompt`
```

---

## Cross-platform

AI-OS works on **Mac** (premium experience), **Windows** (PowerShell), and **Linux** (bash).

Differences:

| Feature | Mac | Windows | Linux |
|---|---|---|---|
| **AI-OS core** | ✅ | ✅ | ✅ |
| **Flat skills** | ✅ | ✅ | ✅ |
| **10 MCP servers (all enabled)** | ✅ | ✅ | ✅ |
| **Oh My Zsh + p10k** | ✅ | ❌ (use Oh-My-Posh or Starship) | ✅ |
| **Warp** | ✅ |✅ (Windows version) |❌ (use Wezterm) |
| **Homebrew** | ✅ |❌ (Chocolatey) |❌ (apt) |
| **Symlinks** | ✅ |⚠️ (need admin or Dev Mode) | ✅ |
| **CI** | ✅ |✅ | ✅ |

See [`docs/cross-platform.md`](docs/cross-platform.md) for full details.

---

## CI

3 GitHub Actions workflows, one per platform:

- `test-mac.yml`: runs on `macos-latest`, validates Mac install in dry-run mode.
- `test-linux.yml`: runs on `ubuntu-latest`, validates Mac install (bash) in dry-run.
- `test-windows.yml`: runs on `windows-latest`, validates Windows install in dry-run.

Triggers: pull_request + push to main.

Workflow:
1. Checkout repo.
2. Install `yq` (mikefarah/yq v4).
3. Run `DRY_RUN=1 bash setup/install-mac.sh` (or windows equivalent).
4. Validate: structure, Brewfile, MCP YAMLs, symlinks, frontmatter, superpowers.
5. Report pass/fail.

See [`.github/workflows/README.md`](.github/workflows/README.md) for details.

---

## Sharing & Contributing

The repo is currently **private** on GitHub. To share with other devs:

1. **Open it as public** (or invite collaborators).
2. They fork, clone, and run `bash setup/install-mac.sh`.
3. They customize `dev-env/dotfiles/git/` (per-user config) and `context/`.

To contribute back:

- New flat skills: add to `ai-config/skills/<name>/SKILL.md`. They get distributed to supported CLIs automatically.
- New MCP server: add `ai-config/mcp/<name>.yaml`. It gets generated to `~/.hermes/config.yaml` automatically.
- New workflow: add `workflows/<name>.md`. It gets loaded by `daily_start.md` automatically.
- Improvements: PRs welcome. CI will validate.

See [`docs/sharing.md`](docs/sharing.md) for full contribution guide.

---

## Success metrics

AI-OS is successful if:

- ✅ Setup on a new Mac completes in <30 min.
- ✅ Setup on Windows completes in <60 min.
- ✅ All flat skills invokable from supported CLIs.
- ✅ All 14/14 superpowers skills present.
- ✅ All 10 enabled MCP servers auto-connect in Hermes.
- ✅ Zero secrets in the repo (`git log -p | grep -iE "secret|api[_-]?key|password"` returns nothing).
- ✅ CI: 3/3 success on PRs to main.

---

## State (current)

- **Files:** 1363
- **Skills:** dynamic; count with `find ai-config/skills -maxdepth 2 -name SKILL.md -path "*/ai-config/skills/*/SKILL.md" | wc -l`.
- **MCP servers:** 7 (declarative YAML).
- **Workflows:** 5.
- **Rules:** 3.
- **Verifiers:** 3.
- **CI workflows:** 3 (macOS, Linux, Windows).
- **Setup scripts:** 7 (3 install + 3 verify + 1 generator).
- **Commits:** 11.
- **License:** MIT.

---

## Roadmap

- [x] v0.1.0: AI-OS bootstrap (Karpathy method) with superpowers integration.
- [x] v0.2.0: `ai-os-quickstart` skill (bootstrap 1-line).
- [x] v0.3.0: Full setup system (Mac + Windows) with Brewfile + MCP config generation.
- [x] v0.4.0: Windows PowerShell install.
- [x] v0.5.0: GitHub Actions CI for setup scripts.
- [x] Documentation policy: repository-authored files are English; third-party vendored content retains its upstream language.
- [ ] v1.0.0: Stable API for skills + workflows.
- [ ] v1.1.0: WSL2 support as primary Windows workflow.
- [ ] v2.0.0: Multi-tenant / team support (config layers).

---

## Links

- **Master instructions:** [CLAUDE.md](CLAUDE.md)
- **Setup details:** [docs/getting-started.md](docs/getting-started.md)
- **Cross-platform:** [docs/cross-platform.md](docs/cross-platform.md)
- **Sharing & Contributing:** [docs/sharing.md](docs/sharing.md)
- **Architecture:** [docs/architecture.md](docs/architecture.md)
- **Model routing & platform support:** [docs/model-routing.md](docs/model-routing.md)
- **Required superpowers:** [prompts/setup/03-required-skills.md](prompts/setup/03-required-skills.md)
- **obra/superpowers:** https://github.com/obra/superpowers
- **Karpathy's method:** Search for "Karpathy AI Operating System" on YouTube.

---

## License

[MIT](LICENSE) — Eduardo Schilling, 2026.
