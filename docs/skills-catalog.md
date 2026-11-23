# Skills catalog

Reference material moved out of `CLAUDE.md` (formerly its §14 "Skills already installed",
§16 "REQUIREMENT: superpowers skills" and §17 "SKILLS.md locations"). Which skill to load
when is a behavioural rule and lives in `rules/always_do.md` and the `using-superpowers`
router; this file is the inventory and install notes.

## Where skills live

There are TWO levels of skills:

1. **Global** (`ai-config/skills/<name>/`) — the source of truth, flat, propagated via
   symlinks to Claude Code, Codex, Gemini, Antigravity and MiniMax on Mac. Never author a new
   global skill directly in `~/.claude/skills/` — that directory is a symlink target.
2. **Workspace** (`"$(dirname "$AI_OS_ROOT")"/<project>/.agents/skills/<name>/`) — project-specific, NOT
   propagated.

Hermes does not get a symlinked skill copy at all: it natively scans `~/.agents/skills/` via
`skills.external_dirs` in `~/.hermes/config.yaml` (registered by
`setup/generate-mcp-config.py`), confirmed against
[Hermes's External Skill Directories docs](https://hermes-agent.nousresearch.com/docs/user-guide/features/skills).

When writing a new skill, ask: "is this workspace-specific or globally useful?". If global →
put it in `ai-config/skills/`. If workspace → put it in `<project>/.agents/skills/`.

### Project skills moved out of the global set (2026-11-05)

These now live in their project repos' `.agents/skills/` and are no longer distributed
globally: iaWorkSpace, plansmith and other project-specific skills.

## Categories

- **superpowers (14 required, see below)**: using-superpowers, brainstorming, writing-plans,
  writing-skills, executing-plans, verification-before-completion, test-driven-development,
  systematic-debugging, finishing-a-development-branch, requesting-code-review,
  receiving-code-review, dispatching-parallel-agents, subagent-driven-development,
  using-git-worktrees. Plus `code-review-and-quality` (required, but separate from the 14).
- **AI-OS workflow skills (native)**: aios-karpathy, aios-quickstart, aios-loop,
  aios-memory, aios-pr-learnings (learn a repo's review rules from its PRs, Bitbucket DC),
  aios-research, aios-code, aios-content, aios-project-start.
  The last four are explicit-invocation entry points for the corresponding
  workflows in `workflows/`.
- **Vendored from gstack (optional, third-party)**: spec, context-save, context-restore — see
  `vendor/gstack/`. The native Spec/Plan workflow remains `workflows/project_start.md`.
- **Vendored from ECC (curated subset)**: only the skills, commands and Claude-Code-only agents
  AI-OS actually uses are kept; the pinned upstream commit and the per-item rationale are in
  `vendor/ecc/VENDORED_FROM.md`.
- **antfu**: vite, vue, nuxt, nitro, pinia, pnpm, vitest, unocss, etc. (`antfu-*`).
- **anthropics**: claude-api, frontend-design, mcp-builder, webapp-testing.
- **taste-skill**: anti-slop frontend design.
- **deploy / infra**: hetzner-cloud-cli, coolify-deploy, pnpm-docker-deploy,
  env-config-and-secrets.
- **patterns-and-refactoring (third-party MIT)**: 22 code smells, 66 refactoring techniques,
  characterization-tests-first workflow, GoF/PoEAA/DDD/distributed catalogues and per-stack
  idioms. Vendored with a narrowed trigger (refactor, legacy, structural review) so it does not
  collide with ponytail on new code — see
  `ai-config/skills/patterns-and-refactoring/VENDORED_FROM.md`.
- **diagram-design (third-party MIT)**: 27 editorial diagram types → self-contained HTML +
  inline SVG, skinned with the AI-OS brand. Vendored, dark-first, brand already onboarded — see
  `ai-config/skills/diagram-design/VENDORED_FROM.md`. Routing rule (by destination artifact) is
  in `rules/always_do.md` "When a task needs a diagram"; the gstack `diagram` skill (excalidraw
  triplet) was retired 2026-08-13 because it collided on every trigger with `diagram-design`.
- **pick-ui-library (third-party MIT, Emil Kowalski)**: a one-library-per-task lookup, invoked
  explicitly only, with an "Our stack" section that defers to shadcn and the TanStack skills.
- **hallmark (third-party MIT, Together AI)**: a standalone page in one of 50 dealt themes under a hard
  anti-slop floor, plus `redesign` and `audit` verbs. Explicit invocation only (the user names Hallmark), with
  AI-OS limits on top (no installer or hook, no Together image calls unless asked, no starting outside projects).
  Its `sloplint` also runs inside `/aios-ui-verify` as an advisory check (`scripts/antislop.py`, `--render` for
  the browser tier), and five commands expose the rest: `/aios-ui-page` (build), `/aios-ui-redesign`,
  `/aios-ui-audit`, `/aios-ui-themes` (list, deal, apply, lock into DESIGN.md) and `/aios-ui-photos`. See
  `ai-config/skills/hallmark/VENDORED_FROM.md`.
- **aios-ui-system-create / -extract / -check**: a project's own design system on shadcn conventions. `create`
  builds one from a brief, `extract` maps what an existing app already uses onto shadcn token names, `check`
  verifies tokens for both modes, contrast and `DESIGN.md` against the stylesheet (`scripts/tokens.py`). They
  share one canonical `DESIGN.md` format (`aios-ui-system-check/references/design-md.md`).
- **stageshow (third-party MIT, Benji Taylor)**: faux product UI for marketing pages, a still or a short cursor
  demo of one app screen, built from its React kit and ~40 gold examples and filmed frame by frame before hand-over
  (`npm run dev` in the skill folder serves the playground). See `ai-config/skills/stageshow/VENDORED_FROM.md`.
- **custom (Edd)**: tanstack-*, vue-*, react-*, and more.

### UI skills evaluated and not adopted (2026-11-06)

Looked at as a set; only `pick-ui-library` (new) and `frontend-design` (resynced) changed anything.
Each decision and what would change it:

| Skill | Decision | Why |
|---|---|---|
| `web-design-guidelines` (vercel-labs) | Not installed | AI-OS already has its own version that fetches the same MIT-licensed rules. Upstream `vercel-labs/agent-skills` still has no license, so copying it stays unauthorized (`ai-config/skills/web-design-guidelines/NOT_VENDORED.md`). Revisit if it gains one |
| `frontend-design` plugin (`claude-plugins-official`) | Not installed; the vendored skill was resynced instead | The plugin ships the same skill under the same name, so both would load and compete (`ai-config/skills/frontend-design/VENDORED_FROM.md`) |
| transitions.dev (3 skills) | Not vendored; use per project if wanted | Three always-loaded descriptions of 983–1730 characters (hard cap here is 500), a custom license that forbids redistributing the library, and Pro/Business tiers (a company needs a paid seat for Pro). It overlaps `emil-design-eng` and `micro-interactions`. For a UI project that wants it: `npx skills add Jakubantalik/transitions.dev` into that project's `.agents/skills/`, which is not propagated |
| Mobbin (plugin: MCP + 4 skills) | Not integrated | The skills only work through Mobbin's hosted MCP (`api.mobbin.com`, OAuth, paid service), and a redesign sends screenshots or code to a third party, which does not fit employer or client work. `redesign-screen`'s description is 651 characters, over the cap. Overlaps `redesign-skill`, `fix-ui-ux` and `saas-review`. Try it in a throwaway project with a personal account if curious |

## Superpowers skills (REQUIRED)

AI-OS depends on the **14 superpowers skills** of `obra/superpowers` to function. Without them,
workflows in `workflows/` will fail (they explicitly invoke skills like `using-superpowers`,
`writing-plans`, `verification-before-completion`). This is the exact set checked by
`setup/verify.sh` and `setup/install-mac.dry-run.sh` — treat those scripts as the source of
truth for this list.

| Skill                            | Loaded when                             |
| -------------------------------- | --------------------------------------- |
| `using-superpowers`              | At the start of every task (router)     |
| `brainstorming`                  | Idea is vague                           |
| `using-git-worktrees`            | Large feature work or parallel branches |
| `writing-plans`                  | Multi-step work, before execution       |
| `writing-skills`                 | Creating or improving skills            |
| `executing-plans`                | Executing a written plan                |
| `verification-before-completion` | Before claiming done                    |
| `test-driven-development`        | Writing tests                           |
| `systematic-debugging`           | Bug or unexpected behavior              |
| `finishing-a-development-branch` | At the end of work                      |
| `requesting-code-review`         | Asking for review                       |
| `receiving-code-review`          | Receiving review                        |
| `dispatching-parallel-agents`    | Multi-task work                         |
| `subagent-driven-development`    | Executing implementation plans          |

`code-review-and-quality` is a separate, equally-required skill (loaded "before the final
commit / PR") but is not part of the obra/superpowers 14 and is not checked by `verify.sh` —
don't conflate it with this list.

AI-OS also ships 3 gstack-vendored skills (`spec`, `context-save`, `context-restore`) under
`vendor/gstack/`. They are **not** part of the 14 required superpowers and follow gstack's own
workflow (5-phase AskUserQuestion spec + GitHub issue filing). For AI-OS's own Spec → Plan →
Execute → Verify, use `workflows/project_start.md` instead.

### Verify that all 14 are installed

```bash
for skill in brainstorming dispatching-parallel-agents executing-plans finishing-a-development-branch receiving-code-review requesting-code-review subagent-driven-development systematic-debugging test-driven-development using-git-worktrees using-superpowers verification-before-completion writing-plans writing-skills; do
  [ -d "$HOME/.claude/skills/$skill" ] || echo "MISSING: $skill"
done
```

### Setup on a new Mac

The 14 superpowers are vendored in `ai-config/skills/` (committed to this repo) and
distributed by `setup/install-mac.sh` along with every other skill — no separate download
needed:

```bash
# 1. Install (links all skills, including the 14 superpowers, into every CLI)
bash "$AI_OS_ROOT/setup/install-mac.sh"

# 2. Verify
bash "$AI_OS_ROOT/setup/verify.sh"
# → Section 4 should show: 14/14 superpowers skills OK
```

To update the vendored superpowers from upstream, diff against
https://github.com/obra/superpowers and copy changes into `ai-config/skills/`.

Or use the comprehensive script `prompts/setup/03-required-skills.md` which automates the full
setup.
