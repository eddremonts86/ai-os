# AI Operating System — Master Instructions

> "Spec + Verifier + Environment" — Karpathy method applied to your Mac.
> Any CLI (Claude Code, Hermes, Codex, Gemini, Antigravity) that reads this file or any sibling in `context/`, `rules/`, `workflows/`, `skills/`, `specs/`, or `verifiers/` should follow these instructions.

## 1. Method: Spec → Verifier → Environment

Before doing any non-trivial task:

1. **Read** the relevant `context/` files (00_profile, 02_projects, 03_preferences, 04_tools, 05_sources).
2. **Check** `specs/current_spec.md`. If empty, the workflow `workflows/project_start.md` kicks in.
3. **Execute** in blocks of <=30 min each. Between blocks, run `verifiers/critic_prompt.md` against the output.
4. **Archive** completed specs to `archive/YYYY-MM-DD-<slug>.md` with a 1-line summary.

## 2. Daily workflow

```
1. daily_start.md          # load context + skills
2. project_start.md        # if new task, create Spec
3. daily_use/prompt.md     # reuse for the second-and-on tasks of the day
4. archive + clean
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
3. **`spec-driven-development`** — if the project is new.
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

- Multi-step tasks (research/install/migration): dispatch subagents in parallel via `delegate_task tasks=[...]` (max 3 concurrent) as default.
- "luce como funciona, continua con la otra" = accept partial, keep going (do not ask "should I continue?").
- For bugfixes/features: do not declare done on build/lint/tests alone. Exercise the runtime (browser nav, smoke test) and report concrete evidence.
- Always finish on URL + status for any started service.

## 7. Languages

- **Chat**: Spanish (lowercase, terse, no ceremonies).
- **Code/commits/docs/logs/comments**: English.
- **Error messages**: English.
- **AI-OS files** (`CLAUDE.md`, `context/`, `rules/`, `workflows/`, `skills/`, `specs/`, `verifiers/`, `docs/`, `setup/`, `ai-config/`, `dev-env/`): all in English, always.

## 8. Priority order

1. Spec quality.
2. Verifier passes.
3. Runtime evidence.
4. User experience.
5. Code quality.
6. Performance (last — premature optimization is the root of all evil).

## 9. Memory

Save durable facts to `~/.hermes/memory.json` (per Hermes profile) when:

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
├── context/                     # persistent context (perfil, prefs, projects, tools)
├── rules/                       # hard rules (always/ask/never)
├── specs/                       # active Specs
├── verifiers/                   # quality gates (post-task)
├── skills/                      # local skills (workspace-specific)
├── workflows/                   # recurring processes
├── archive/                     # completed Specs
├── outputs/                     # generated artifacts
├── promps/                      # original Karpathy prompts (English)
├── ai-config/                   # AI config: skills, MCP,commands (5 CLIs)
├── dev-env/                     # dev env: dotfiles, Brewfile, packages
├── setup/                       # install scripts (Mac + Windows + dry-run)
└── docs/                        # documentation (README + guides)
```

## 12. Commands quick reference

```bash
# Start session with AI-OS
hermes chat --skills ai-os-quickstart

# Or in any CLI
cat ~/Projects/ai-os/CLAUDE.md
# → paste at the start of the conversation

# Verify
bash ~/Projects/ai-os/setup/verify.sh

# Create new Spec
$EDITOR ~/Projects/ai-os/specs/current_spec.md

# Archive completed Spec
mv ~/Projects/ai-os/specs/current_spec.md ~/Projects/ai-os/archive/$(date +%Y-%m-%d)-slug.md
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

**99 global skills** in `~/.claude/skills/`, distributed to:

- Claude Code, Codex, Gemini, Antigravity, Hermes (via symlinks).
- Workspace-scoped: `~/Projects/<project>/.agents/skills/`.

Categories:

- **superpowers (14 required)**: using-superpowers, brainstorming, spec-driven-development, writing-plans, executing-plans, verification-before-completion, test-driven-development, systematic-debugging, code-review-and-quality, finishing-a-development-branch, requesting-code-review, receiving-code-review, dispatching-parallel-agents, subagent-driven-development.
- **antfu (19)**: vite, vue, nuxt, nitro, pinia, pnpm, vitest, unocss, etc.
- **anthropics (skills)**: claude-code, claude-api, frontend-design, mcp-builder, claude-best-practices, webapp-testing.
- **taste-skill (v1, v2)**: anti-slop frontend design.
- **secondsky (8)**: open-design, hcloud, coolify, prod-deploy, pnpm-docker, fleet-register, env-sync, containers-architecture.
- **custom (Edd)**: ai-os-karpathy, ai-os-quickstart, wave-template, tanstack-*, vue-*, react-*, 30+ more.

## 15. AI-OS as orchestrator

AI-OS is the single source of truth for the AI setup:

- **Skills** → `ai-config/skills/` (99 source of truth) → symlinks to 5 CLIs.
- **MCP servers** → `ai-config/mcp/*.yaml` → generated to `~/.hermes/config.yaml`.
- **Dotfiles** → `dev-env/dotfiles/` → symlinks to `~/`.
- **Setup scripts** → `setup/install-{mac,windows}.sh/ps1` (1-command per OS).
- **CI** → `.github/workflows/test-{mac,linux,windows}.yml` validates that setup scripts work.

To replicate on another Mac: `git clone + bash setup/install-mac.sh`. To replicate on Windows: `git clone + powershell -File setup/install-windows.ps1`.

## 16. ⚠️ REQUIREMENT: superpowers skills (MANDatory)

AI-OS depends on the **14 superpowers skills** of `obra/superpowers` to function. Without them, workflows in `workflows/` will fail (they explicitly invoke skills like `using-superpowers`, `writing-plans`, `verification-before-completion`).

### Required superpowers skills

| Skill | Loaded when |
|---|---|
| `using-superpowers` | At the start of every task (router) |
| `brainstorming` | Idea is vague |
| `spec-driven-development` | Project is new (similar to AI-OS Spec) |
| `writing-plans` | After Spec, before execution |
| `executing-plans` | During execution (block by block) |
| `verification-before-completion` | Before claiming done |
| `test-driven-development` | Writing tests |
| `systematic-debugging` | Bug or unexpected behavior |
| `code-review-and-quality` | Before PR |
| `finishing-a-development-branch` | At the end of work |
| `requesting-code-review` | Asking for review |
| `receiving-code-review` | Receiving review |
| `dispatching-parallel-agents` | Multi-task work |
| `subagent-driven-development` | Executing implementation plans |

### Verify that all 14 are installed

```bash
for skill in brainstorming dispatching-parallel-agents executing-plans finishing-a-development-branch receiving-code-review requesting-code-review subagent-driven-development systematic-debugging test-driven-development using-git-worktrees using-superpowers verification-before-completion writing-plans writing-skills; do
  [ -d "$HOME/.claude/skills/$skill" ] || echo "MISSING: $skill"
done
```

### Setup on a new Mac (required for AI-OS to work)

```bash
# 1. Install 4 missing superpowers (most are pre-installed)
gh repo clone obra/superpowers /tmp/superpowers -- --depth=1
for skill in /tmp/superpowers/skills/*/; do
  name=$(basename "$skill")
  if [ ! -d "$HOME/.claude/skills/$name" ]; then
    cp -R "$skill" "$HOME/.claude/skills/$name"
    # Re-symlink to other CLIs
    for cli in "$HOME/.codex/skills" "$HOME/.gemini/skills" "$HOME/.agents/skills" "$HOME/.hermes/skills/imported"; do
      [ -d "$cli" ] && ln -sf "$HOME/.claude/skills/$name" "$cli/$name"
    done
  fi
done
rm -rf /tmp/superpowers

# 2. Verify
bash ~/Projects/ai-os/setup/verify.sh
# → Section 4 should show: 14/14 superpowers skills OK
```

Or use the comprehensive script `promps/setup-required-skills.md` which automates the full setup.

## 17. SKILLS.md locations (do not confuse)

There are TWO levels of skills:

1. **Global** (`~/.claude/skills/<name>/`) — 99 skills, propagated via symlinks to 5 CLIs.
2. **Workspace** (`~/Projects/<project>/.agents/skills/<name>/`) — project-specific, NOT propagated.

When a skill is `imported:` in Hermes, it comes from `~/.hermes/skills/imported/` (a symlink to `~/.claude/skills/`).

When writing a new skill, ask: "is this workspace-specific or globally useful?". If global → put it in `ai-config/skills/`. If workspace → put it in `<project>/.agents/skills/`.

## 18. Final rule

If you're not sure what to do:

1. Re-read this file.
2. Re-read `context/03_preferences.md`.
3. Run `workflows/daily_start.md`.
4. If the doubt persists, ask the user (with options).
5. If the user says "go", execute without further questions.
