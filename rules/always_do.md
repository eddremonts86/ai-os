# Always Do

Actions that you MUST always do when working with me.

## At session start

1. Set `AI_OS_ROOT` to the repository root (default: `$HOME/Projects/ai-os`) and read `$AI_OS_ROOT/CLAUDE.md`.
2. Read `$AI_OS_ROOT/context/00_profile.md`, `02_projects.md`, `03_preferences.md`, `04_tools.md`.
3. Read `$AI_OS_ROOT/rules/never_do.md` and `ask_before_doing.md`.
4. Read `$AI_OS_ROOT/specs/current_spec.md`. It must contain only the active Spec; an empty template means there is no active Spec.
5. Load skill `using-superpowers` (router).
6. Follow `workflows/daily_start.md` (AI-OS).

## ALWAYS: use sub-agents in parallel when possible

When a task has 2+ independent workstreams, **dispatch them as sub-agents in parallel** instead of doing them sequentially. This is the default for multi-step work, not an exception.

### When to dispatch in parallel

- **Research + setup** in parallel (gather context while preparing env).
- **Multiple file edits** that don't depend on each other.
- **Multiple verifications** (lint + type check + tests in parallel).
- **Multi-repo work** (changes in 2+ repos at once).
- **Multi-CLI verification** (run same check on Claude Code + Hermes + Codex + Gemini).

### How to dispatch

Use this CLI's native subagent mechanism. **Max 3 concurrent** per user (default config).

- **Claude Code**: the `Task`/`Agent` tool — send multiple agents in a single message so they run concurrently.
- **Hermes**: `delegate_task(tasks=[{"goal": "Research X", "toolsets": ["web"]}, ...])`.
- **Codex / Gemini / Antigravity / MiniMax**: use their native subagent or agent-team capability when it is available in the installed client. Otherwise use background shells for independent commands or run sequentially.

Each subagent gets:

- Isolated context and terminal.
- Its own conversation.
- Returns only the final summary (intermediate noise stays out of your context).

### When NOT to dispatch

- The task has <2 minutes of work (overhead dominates).
- The workstreams are tightly coupled (state must be shared between steps).
- The task is interactive (waiting for user input).
- You don't know what the subagents would do (subagents are not a substitute for thinking).

### Verify the dispatch actually worked

Subagent summaries are **self-reports, not verified facts**. Before claiming success:

- For external side-effects (HTTP, file creation, git push): require the subagent to return a verifiable handle (URL, ID, path, status) and verify it yourself.
- For research: cross-reference with at least one independent source.
- For implementation: run the tests yourself, do not trust the subagent's "tests passed" claim.

### Save the pattern

When you find a useful parallel-dispatch pattern (e.g., "research + verify + implement"), save it as a skill in `~/.claude/skills/<name>/SKILL.md` with frontmatter and example. Future agents (and you) can reuse it.

## At every task

7. Verify there is a Spec or the task is trivial.
8. → Load skill `brainstorming` if the user's idea is vague.
9. → Load skill `writing-plans` if the task is >30 min.
10. → Load skill `verification-before-completion` before declaring done.
11. → Load skill `code-review-and-quality` before the final commit.
12. → Load skill `finishing-a-development-branch` at the end.

## When a task needs an env value or secret

Before inventing, hardcoding, or asking the user for any environment value, read the
merged master file **`dev-env/env-config/.env`** (relative to `$AI_OS_ROOT`). It is the
canonical local source for:

- DB URLs / Postgres parts (`DATABASE_URL`, `POSTGRES_*`, prod/fleet variants).
- Auth secrets (`BETTER_AUTH_SECRET`, `CLERK_*`, `AUTH_MODE`).
- LLM endpoints + keys (`MINIMAX_*`, `OPENAI_*`, `ANTHROPIC_*`, local `AI_*`, Ollama).
- Ports / URLs (`PORT`, `APP_URL`, service ports).
- Agent + infra tokens (`OPENCLAW_GATEWAY_TOKEN`, `TELEGRAM_BOT_TOKEN`, Coolify/Hetzner).

Rules:

- Prefer the master `.env`; only ask the user if the value is genuinely absent.
- Use `dev-env/env-config/.env.example` (committed, placeholders) when you only need the
  variable name/shape, not a real secret.
- Use values in place. NEVER echo, print, paste into chat, log, or commit the real
  values (see `rules/never_do.md`).

## When writing code

**Ponytail is always on (`full`).** Before writing any code, climb the ladder and stop at the first rung that holds: does this need to exist at all (YAGNI) → is it already in this codebase → stdlib → native platform feature → already-installed dependency → one line → minimum that works. Shortest working diff wins, but only after you understand the flow the change touches; a bug fix means the root cause in the shared function, not a guard per caller. Never simplify away input validation at trust boundaries, error handling that prevents data loss, security, accessibility, or anything explicitly requested. Non-trivial logic leaves one runnable check behind. Per-session override: `/ponytail lite|full|ultra|off`. Machine default: `~/.config/ponytail/config.json` (Windows: `%APPDATA%\ponytail\config.json`).

13. Run type check (TypeScript: `tsc --noEmit`, Python: `mypy`).
14. Run tests (Vitest, pytest, bats, Pester).
15. Run lint (ESLint, ruff, shellcheck, PSScriptAnalyzer).
16. Run format (Prettier, black, shfmt).
17. If a hook or build script exists, run it.

## When you find an error, anywhere

If a check (type-check, lint, test, build, runtime) surfaces an error, **fix it as part of the current task** — do not just report it and move on, and do not gate the fix on whether it is related to what you were asked to do, who introduced it, or how old it is.

- "Pre-existing" is not a reason to skip it. A baseline error count is not an acceptable steady state to preserve.
- Reporting an error without fixing it is only acceptable when the fix requires information only the user has (an external credential, a genuine product decision, a destructive/irreversible step) — and even then, propose the concrete fix, don't just list the symptom.
- The code must always be left in better shape than it was found, not just not-worse.
- This applies to every language/stack, not just the current task's file.

## When creating artifacts

18. Save active task planning only in `specs/current_spec.md`; save completed Specs in the versioned `archive/` directory.
19. Use conventional commits: `feat:`, `fix:`, `docs:`, `chore:`, `refactor:`, `test:`.
20. Cite sources for claims.
21. Add examples for non-trivial code.
22. Update the related context file (if applicable).

## When a task needs a diagram

23. Route by **destination artifact**, not by the word "diagram":

    | Destination | Use |
    |---|---|
    | Branded deliverable — docs, ADRs, README, decks, social cards | `diagram-design` skill (HTML + inline SVG, AI-OS skin, dark by default) |
    | The diagram lives in FigJam / Figma | figma MCP `generate_diagram` |
    | The destination is a claude.ai Artifact | `artifact-diagramming` |
    | Throwaway shape inside a chat reply | fenced mermaid, no skill |

24. Never hand-roll SVG for a branded diagram. `diagram-design` owns the skin, the complexity
    budget, and the accessible-SVG contract; a hand-rolled figure silently drops all three.
25. Brand tokens come from `context/06_brand.md`. Do not read hex values out of `site/index.html`
    or invent them, and do not rewrite a skill's style guide for a single project — use
    `.ai-os/brand-tokens.md` in that project's root.
26. Before shipping a diagram, run the skill's taste gate (`SKILL.md` §9) and
    `python3 ~/.claude/skills/diagram-design/scripts/self_check.py <file>`. Report the result.

## At session end

27. When an active Spec is completed, archive it as `archive/YYYY-MM-DD-<slug>.md`.
28. Reset `specs/current_spec.md` to the no-active-Spec template only after the archive succeeds.
29. Report final state with concrete evidence.
