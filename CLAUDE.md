# AI Operating System — Master Instructions

> "Spec + Verifier + Environment" — Karpathy method applied to your Mac.
> Any CLI (Claude Code, Hermes, Codex, Gemini, Antigravity) that reads this file — directly or
> via the `AGENTS.md` symlink — should follow these instructions and the files they point to in
> `context/`, `rules/`, `workflows/`, `specs/` and `verifiers/`.

Set `AI_OS_ROOT` to this repository root before running path-based commands (typical default:
`$HOME/Projects/ai-os`). Reference material lives in `docs/`: commands and per-CLI invocation in
[`docs/cli-reference.md`](docs/cli-reference.md), the skills inventory and superpowers install
notes in [`docs/skills-catalog.md`](docs/skills-catalog.md), the directory tree in
[`docs/repo-layout.md`](docs/repo-layout.md).

## 1. Method

1. **Read** `context/personal/00_profile.md` and `03_preferences.md` (yours; if `context/personal/` is missing,
   copy `context/personal.example/` there first); other `context/` files only when the task needs them
   (on-demand table in `rules/always_do.md`, layout in `context/README.md`).
2. **Decide whether the task needs a Spec.** A Spec (`workflows/project_start.md` →
   `specs/current_spec.md`) is required only when the work is expected to take more than ~2
   hours, touches more than one repo, or the user asks for one. Otherwise plan inline (use
   `writing-plans` for multi-step work) and go.
3. **Execute and verify** with `verification-before-completion` before claiming done. The
   prompts in `verifiers/` (`critic_prompt.md`, `quality_checklist.md`,
   `source_check_prompt.md`, `fresh_reviewer_prompt.md`) are optional tools — use them when a
   second look is worth it, not as a mandatory pass between blocks. A Spec gets one cold read
   by a fresh subagent (`workflows/project_start.md` step 3b).
4. **Archive** a completed Spec to `archive/YYYY-MM-DD-<slug>.md` with a 1-line summary, then
   reset `specs/current_spec.md` to the no-active-Spec template. `specs/current_spec.md` holds
   at most one active Spec.

## 2. Always follow

- Read this file + relevant `context/` at the start of every session; session-start and
  per-task steps are in `rules/always_do.md`.
- Use `using-superpowers` as the router for all skills. Skill triggers per phase (brainstorming,
  writing-plans, verification-before-completion, code-review-and-quality,
  finishing-a-development-branch), diagram routing and UI-skill routing are owned by
  `rules/always_do.md`; workflows for coding, research and content are in `workflows/`.
- Ponytail (lazy senior dev, `full`) governs every code change on every CLI — climb the ladder
  before writing, never at the cost of validation/security/a11y (see `rules/always_do.md`
  "When writing code").
- When a task needs an env value/secret (DB URL, API key, port, LLM endpoint, token), read
  `dev-env/env-config/.env` first (canonical merged local source) before inventing,
  hardcoding, or asking; never echo or commit the real values. See `context/global/04_tools.md` and
  `rules/always_do.md`.
- Parallel sub-agents are the default for 2+ independent workstreams (max 3 concurrent, this
  CLI's native mechanism); always verify their output yourself. Details: `rules/always_do.md`
  "ALWAYS: use sub-agents in parallel when possible".
- Work inside the folder's scope (personal, employer, own company): its design system, git identity and
  confidentiality. `ai-os scope which`; details in `rules/always_do.md` "Work inside the folder's scope".
- Language and tone: the chat language and tone are the user's (`context/personal/03_preferences.md`);
  code, commits, docs, logs, comments, error messages and every AI-OS file stay in English. Terse, no
  ceremony, formatting only when it adds clarity.
- When the user accepts a partial result and says to keep going (their trigger phrases are in
  `context/personal/03_preferences.md`), carry on; do not ask "should I continue?".
- For bugfixes/features: do not declare done on build/lint/tests alone. Exercise the runtime
  (browser nav, smoke test) and report concrete evidence. Always finish on URL + status for any
  started service.
- For new or changed code, add and run meaningful tests at the applicable layers by default,
  including regression checks for updates. Follow `rules/always_do.md` "When writing code";
  report untested behavior and blockers instead of claiming error-free code.
- Report final state with concrete evidence (what worked, what failed, next step).

## 3. Priority order

1. Spec quality (or plan quality, when no Spec is required).
2. Verifier passes.
3. Runtime evidence.
4. User experience.
5. Code quality.
6. Performance (last — premature optimization is the root of all evil).

## 4. Memory

Canonical identity and preferences live in `context/personal/` (yours, git-ignored, never published);
what holds for every user lives in `context/global/`. See `context/README.md`.
Per-CLI global instruction files are symlinks to a rendered bridge (see
`docs/cli-reference.md` "Per-machine bridge").

Save durable per-CLI facts to that CLI's own memory store — Claude Code: the project memory dir
(`MEMORY.md` index + one file per fact); Hermes: `~/.hermes/memories/` (`MEMORY.md` +
`USER.md`); Codex: its built-in store. Sync notable cross-CLI facts back into `context/personal/`. The
graphiti/grepai memory stack is covered in `rules/always_do.md` "Use the memory stack".

Save when the user states a preference or correction, an environment fact is discovered (OS
quirk, path, tool version), or a convention or workflow stabilizes. Skip trivial or easily
re-discoverable facts, raw data dumps, task progress (`specs/current_spec.md`) and
completed-work logs (`archive/`).

## 5. Prohibitions (absolute)

See `rules/never_do.md`. In short:

- Do not `rm -rf` without confirming the path.
- Do not commit secrets, API keys, tokens.
- Do not commit `.env`, `node_modules/`, `dist/`, `build/`.
- Do not change config of other Hermes profiles without explicit user direction.
- Do not install unverified skills without reviewing the source.

## 6. Skills: where they live

- Global skills: `ai-config/skills/<name>/` is the source of truth, symlinked to every CLI.
  Never author a global skill directly in `~/.claude/skills/`.
- Project-specific skills: `<project>/.agents/skills/<name>/`, not propagated. Several former
  globals (iaworkspace, prod-fleet/deploy, containers, open-design, wave-template, drupal8,
  hermes-mcp, plans) now live there — see `docs/skills-catalog.md`.
- The 14 obra/superpowers skills plus `code-review-and-quality` are required; `setup/verify.sh`
  checks them. Install and update notes: `docs/skills-catalog.md`.

## 7. Do not "tidy" these

The rule: everything above `apps/` is the operating system; everything from `apps/` down is
what it produced. The plans product moved to its own repo, **plansmith** (2026-09-25);
`ai-os plans <cmd>` requires `PLANSMITH_ROOT`. Three things are deliberate:

- **`AGENTS.md` is a symlink to `CLAUDE.md`.** It is how Codex and Antigravity find these
  instructions. Deleting it breaks them silently — they start with no instructions at all.
- **`Dockerfile` stays at the repo root.** Coolify addresses it by absolute path
  (`dockerfile_location=/Dockerfile`, `base_directory=/`); moving it means editing live
  production configuration.
- **`outputs/` holds the framework's own research and audits**, ignored with a tracked
  `.gitkeep`.

New code that needs the repo root walks up to the `CLAUDE.md` marker instead of counting `..`
hops (see `docs/repo-layout.md`).

## 8. Final rule

If you're not sure what to do:

1. Re-read this file.
2. Re-read `context/personal/03_preferences.md`.
3. Run `workflows/daily_start.md`.
4. If the doubt persists, ask the user (with options).
5. If the user says "go", execute approved reversible work without further questions; keep
   action-specific approval for protected actions.
