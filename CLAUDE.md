# AI Operating System — Master Instructions

> "Spec + Verifier + Environment" — Karpathy method applied to your Mac.
> Any CLI (Claude Code, Hermes, Codex, Gemini, Antigravity) that reads this file or any sibling in `context/`, `rules/`, `workflows/`, `skills/`, `specs/`, or `verifiers/` should follow these instructions.

## 1. Method: Spec → Verifier → Environment

Set `AI_OS_ROOT` to this repository root before running path-based commands. The
examples below use `$AI_OS_ROOT`; a typical local default is
`$HOME/Projects/ai-os`.

Before doing any non-trivial task:

1. **Read** the relevant `context/` files (00_profile, 02_projects, 03_preferences, 04_tools, 05_sources).
2. **Check** `specs/current_spec.md`. It is reserved for one active task; if it contains the no-active-Spec template, use `workflows/project_start.md` when a Spec is needed.
3. **Execute** in blocks of <=30 min each. Between blocks, run `verifiers/critic_prompt.md` against the output.
4. **Archive** completed Specs to `archive/YYYY-MM-DD-<slug>.md` with a 1-line summary, then reset `specs/current_spec.md` to the no-active-Spec template.

## 2. Daily workflow

```
1. daily_start.md          # load context + skills
2. project_start.md        # if new task, create Spec
3. execute and verify the active task
4. archive completed Specs + reset current_spec.md
```

## 3. Always follow

- Read this file + relevant `context/` at the start of every session.
- Use `using-superpowers` as the router for all skills (see `rules/always_do.md`).
- Verify before claiming complete (see `verifiers/`).
- Be terse, no ceremony, no over-formatting.
- Report final state with concrete evidence (what worked, what failed, next step).

## 4. Skill loading order (superpowers + AI-OS)

1. **`using-superpowers`** (router) — at the start of every task.
2. **`brainstorming`** — if the idea is vague.
3. **`workflows/project_start.md`** (AI-OS native) — for new tasks or underspecified objectives. Produces a Spec in `specs/current_spec.md`. The gstack-vendored `spec` skill is an alternative 5-phase issue-filing flow, not part of AI-OS's Karpathy loop.
4. **`writing-plans`** — after Spec, to break into blocks.
5. **`executing-plans`** — execute block by block.
6. **`verification-before-completion`** — between blocks.
7. **`code-review-and-quality`** — before PR.
8. **`finishing-a-development-branch`** — at the end.

Plus AI-OS internal:

9. **`workflows/daily_start.md`** — at the start of session.
10. **`workflows/project_start.md`** — for new tasks.
11. **`workflows/coding.md`** — for code work (feature, bug, refactor).
12. **`workflows/research.md`** — for research.
13. **`workflows/content_creation.md`** — for docs/ADRs.

## 5. Output style

- **Conversational**: terse, lowercase, direct. No "as you can see" or "I hope this helps".
- **code/commits/docs**: English.
- **error messages / logs**: English.
- **comments in code**: English.
- **formatting**: only use it when it adds clarity. Tables only when comparing 3+ items.

## 6. Autonomy + max runtime evidence

- Multi-step tasks (research/install/migration): dispatch subagents in parallel (max 3 concurrent) as default, using this CLI's own mechanism (see "How to dispatch" below).
- "luce como funciona, continua con la otra" = accept partial, keep going (do not ask "should I continue?").
- For bugfixes/features: do not declare done on build/lint/tests alone. Exercise the runtime (browser nav, smoke test) and report concrete evidence.
- Always finish on URL + status for any started service.

### Parallel sub-agents: the default

**If a task has 2+ independent workstreams, dispatch them in parallel.** This is the default, not an exception. Sequential execution is only for tightly coupled steps.

Concrete patterns where parallelism wins:

- **Research + setup**: gather docs / context while preparing the environment.
- **Multiple file edits**: 3+ files that don't depend on each other → 3 sub-agents in parallel.
- **Multiple verifications**: lint + type check + tests in parallel (one subagent each).
- **Multi-repo work**: changes in 2+ repos at once.
- **Multi-CLI verification**: run the same check across Claude Code + Hermes + Codex + Gemini in parallel.

How to dispatch (each CLI has its own mechanism — use the native one):

| CLI                                    | Mechanism                                                                                                                                    |
| -------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| Claude Code                            | `Task`/`Agent` tool — launch multiple agents in one message                                                                                  |
| Hermes                                 | `delegate_task(tasks=[{"goal": "...", "toolsets": [...]}, ...])`                                                                             |
| Codex / Gemini / Antigravity / MiniMax | Use native subagents or agent teams when available in the installed client; otherwise run independent background shells or work sequentially |

Max 3 concurrent (in Hermes configured via `delegation.max_concurrent_children`; in Claude Code just cap yourself at 3).

When NOT to dispatch: tasks <2 min, tightly coupled steps, interactive tasks, or when you don't know what the subagent would do.

**Always verify subagent output yourself.** Subagents are self-reporting; require verifiable handles (URLs, paths, IDs) and check them before claiming success.

Full details: `rules/always_do.md` section "ALWAYS: use sub-agents in parallel when possible".

## 7. Languages

- **Chat**: Spanish (lowercase, terse, no ceremonies).
- **Code/commits/docs/logs/comments**: English.
- **Error messages**: English.
- **AI-OS files** (`CLAUDE.md`, `context/`, `rules/`, `workflows/`, `skills/`, `specs/`, `verifiers/`, `docs/`, `setup/`, `ai-config/`, `dev-env/`, `archive/`, `outputs/`, `prompts/`): all in English, always.

## 8. Priority order

1. Spec quality.
2. Verifier passes.
3. Runtime evidence.
4. User experience.
5. Code quality.
6. Performance (last — premature optimization is the root of all evil).

## 9. Memory

Canonical identity/preferences live in `context/` (this repo) — that is the source
of truth. `setup/install-mac.sh` and `setup/install-windows.ps1` render
`ai-config/templates/global-bridge.md.tmpl` into a per-machine adapter
(`~/.ai-os/adapters/global-bridge.md`, with the discovered AI-OS root
substituted — no committed user path) and symlink each CLI's global
instruction file to it.

Save durable per-CLI facts to that CLI's own memory store when (see below for when):

- **Claude Code** → the project memory dir (`MEMORY.md` index + one file per fact).
- **Hermes** → `~/.hermes/memories/` (`MEMORY.md` + `USER.md`).
- **Codex** → built-in memory store (sqlite, managed by the CLI).

Sync notable, cross-CLI facts back into `context/` so every tool benefits. Save when:

- User states a preference or correction.
- Environment fact discovered (OS quirk, path, tool version).
- Convention or workflow stabilized.

Skip:

- Trivial/obvious info.
- Easily re-discoverable facts.
- Raw data dumps.
- Task progress (use `specs/current_spec.md`).
- Completed-work logs (use `archive/`).

## 10. Prohibitions (absolute)

See `rules/never_do.md`. In short:

- Do not `rm -rf` without confirming the path.
- Do not commit secrets, API keys, tokens.
- Do not commit `.env`, `node_modules/`, `dist/`, `build/`.
- Do not change config of other Hermes profiles without explicit user direction.
- Do not install unverified skills without reviewing the source.

## 11. Project structure

```
ai-os/
├── CLAUDE.md                    # this file (master instructions)
├── context/                     # persistent context (profile, prefs, projects, tools)
├── rules/                       # hard rules (always/ask/never)
├── specs/                       # active Specs
├── verifiers/                   # quality gates (post-task)
├── skills/                      # local skills (workspace-specific)
├── workflows/                   # recurring processes
├── archive/                     # completed Specs
├── outputs/                     # generated artifacts
├── prompts/                      # original Karpathy prompts (English)
├── ai-config/                   # AI config: skills, MCP, commands
├── dev-env/                     # dev env: dotfiles, Brewfile, packages
├── setup/                       # install scripts (Mac + Windows + dry-run)
├── vendor/                      # third-party vendored skills (gstack, ecc, codex-plugin-cc)
├── .github/                     # CI workflows (test-mac/linux/windows)
└── docs/                        # documentation (README + guides)
```

## 12. Commands quick reference

```bash
# Set once per shell; override it when the repository lives elsewhere.
export AI_OS_ROOT="${AI_OS_ROOT:-$HOME/Projects/ai-os}"

# Start session with AI-OS
hermes chat --skills ai-os-quickstart

# Or in any CLI
cat "$AI_OS_ROOT/CLAUDE.md"
# → paste at the start of the conversation

# Verify
bash "$AI_OS_ROOT/setup/verify.sh"

# Create new Spec
$EDITOR "$AI_OS_ROOT/specs/current_spec.md"

# Archive completed Spec
mv "$AI_OS_ROOT/specs/current_spec.md" "$AI_OS_ROOT/archive/$(date +%Y-%m-%d)-slug.md"
```

## 13. How to invoke from each CLI

### Claude Code

```bash
# Auto-loads from ~/.claude/skills/
# Manual: paste CLAUDE.md content at the start of the conversation
```

### Hermes

```bash
hermes chat --skills ai-os-karpathy
hermes chat --skills ai-os-quickstart
# or
hermes chat   # skills already loaded from imported:
```

### Codex / Gemini / Antigravity

```bash
# Auto-loads from ~/.codex/skills/, ~/.gemini/skills/, ~/.agents/skills/
```

## 14. Skills already installed (quick reference)

**Flat global skills** in `ai-config/skills/`, distributed to:

- Claude Code, Codex, Gemini, Antigravity, Hermes, and MiniMax on Mac (via symlinks).
- Workspace-scoped: `~/Projects/<project>/.agents/skills/`.

Categories:

- **superpowers (14 required, see section 16)**: using-superpowers, brainstorming, writing-plans, writing-skills, executing-plans, verification-before-completion, test-driven-development, systematic-debugging, finishing-a-development-branch, requesting-code-review, receiving-code-review, dispatching-parallel-agents, subagent-driven-development, using-git-worktrees. Plus `code-review-and-quality` (required, but separate from the 14).
- **AI-OS workflow skills (native)**: ai-os-karpathy, ai-os-quickstart.
- **Vendored from gstack (optional, third-party)**: spec, context-save, context-restore — see `vendor/gstack/`. The native Spec/Plan workflow remains `workflows/project_start.md`.
- **antfu (19)**: vite, vue, nuxt, nitro, pinia, pnpm, vitest, unocss, etc.
- **anthropics (skills)**: claude-code, claude-api, frontend-design, mcp-builder, claude-best-practices, webapp-testing.
- **taste-skill (v1, v2)**: anti-slop frontend design.
- **secondsky (8)**: open-design, hcloud, coolify, prod-deploy, pnpm-docker, fleet-register, env-sync, containers-architecture.
- **custom (Edd)**: ai-os-karpathy, ai-os-quickstart, wave-template, tanstack-*, vue-*, react-*, 30+ more.

## 15. AI-OS as orchestrator

AI-OS is the single source of truth for the AI setup:

- **Skills** → `ai-config/skills/` (source of truth) → symlinks to supported CLIs.
- **MCP servers** → `ai-config/mcp/*.yaml` → generated to `~/.hermes/config.yaml`.
- **Dotfiles** → `dev-env/dotfiles/` → symlinks to `~/`.
- **Setup scripts** → `setup/install-{mac,windows}.sh/ps1` (1-command per OS).
- **CI** → `.github/workflows/test-{mac,linux,windows}.yml` validates that setup scripts work.

To replicate on another Mac: `git clone + bash setup/install-mac.sh`. To replicate on Windows: `git clone + powershell -File setup/install-windows.ps1`.

## 16. ⚠️ REQUIREMENT: superpowers skills (MANDATORY)

AI-OS depends on the **14 superpowers skills** of `obra/superpowers` to function. Without them, workflows in `workflows/` will fail (they explicitly invoke skills like `using-superpowers`, `writing-plans`, `verification-before-completion`). This is the exact set checked by `setup/verify.sh` and `setup/install-mac.dry-run.sh` — treat those scripts as the source of truth for this list.

### Required superpowers skills

| Skill                            | Loaded when                             |
| -------------------------------- | --------------------------------------- |
| `using-superpowers`              | At the start of every task (router)     |
| `brainstorming`                  | Idea is vague                           |
| `using-git-worktrees`            | Large feature work or parallel branches |
| `writing-plans`                  | After Spec, before execution            |
| `writing-skills`                 | Creating or improving skills            |
| `executing-plans`                | During execution (block by block)       |
| `verification-before-completion` | Before claiming done                    |
| `test-driven-development`        | Writing tests                           |
| `systematic-debugging`           | Bug or unexpected behavior              |
| `finishing-a-development-branch` | At the end of work                      |
| `requesting-code-review`         | Asking for review                       |
| `receiving-code-review`          | Receiving review                        |
| `dispatching-parallel-agents`    | Multi-task work                         |
| `subagent-driven-development`    | Executing implementation plans          |

`code-review-and-quality` is a separate, equally-required skill (loaded "before PR", see section 4) but is not part of the obra/superpowers 14 and is not checked by `verify.sh` — don't conflate it with this list.

AI-OS also ships 3 gstack-vendored skills (`spec`, `context-save`, `context-restore`) under `vendor/gstack/`. They are **not** part of the 14 required superpowers and follow gstack's own workflow (5-phase AskUserQuestion spec + GitHub issue filing). For AI-OS's Karpathy-style Spec → Plan → Execute → Verify, use `workflows/project_start.md` instead.

### Verify that all 14 are installed

```bash
for skill in brainstorming dispatching-parallel-agents executing-plans finishing-a-development-branch receiving-code-review requesting-code-review subagent-driven-development systematic-debugging test-driven-development using-git-worktrees using-superpowers verification-before-completion writing-plans writing-skills; do
  [ -d "$HOME/.claude/skills/$skill" ] || echo "MISSING: $skill"
done
```

### Setup on a new Mac (required for AI-OS to work)

The 14 superpowers are vendored in `ai-config/skills/` (committed to this repo) and
distributed by `setup/install-mac.sh` along with every other skill — no separate
download needed:

```bash
# 1. Install (links all skills, including the 14 superpowers, into every CLI)
bash "$AI_OS_ROOT/setup/install-mac.sh"

# 2. Verify
bash "$AI_OS_ROOT/setup/verify.sh"
# → Section 4 should show: 14/14 superpowers skills OK
```

To update the vendored superpowers from upstream, diff against
https://github.com/obra/superpowers and copy changes into `ai-config/skills/`.

Or use the comprehensive script `prompts/setup/03-required-skills.md` which automates the full setup.

## 17. SKILLS.md locations (do not confuse)

There are TWO levels of skills:

1. **Global** (`ai-config/skills/<name>/`) — flat skills propagated via symlinks to supported CLIs.
2. **Workspace** (`~/Projects/<project>/.agents/skills/<name>/`) — project-specific, NOT propagated.

Hermes does not get a symlinked skill copy at all: it natively scans
`~/.agents/skills/` via `skills.external_dirs` in `~/.hermes/config.yaml`
(registered by `setup/generate-mcp-config.py`), confirmed against
[Hermes's External Skill Directories docs](https://hermes-agent.nousresearch.com/docs/user-guide/features/skills).

When writing a new skill, ask: "is this workspace-specific or globally useful?". If global → put it in `ai-config/skills/`. If workspace → put it in `<project>/.agents/skills/`.

## 18. Final rule

If you're not sure what to do:

1. Re-read this file.
2. Re-read `context/03_preferences.md`.
3. Run `workflows/daily_start.md`.
4. If the doubt persists, ask the user (with options).
5. If the user says "go", execute approved reversible work without further questions; keep action-specific approval for protected actions.
