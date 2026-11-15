# Always Do

Actions that you MUST always do when working with me.

## At session start

Keep the session-start read small; everything else is read on demand.

1. Set `AI_OS_ROOT` to the repository root (default: `$HOME/Projects/ai-os`) and read `$AI_OS_ROOT/CLAUDE.md` — skip if your CLI already loaded it (Claude Code inside the repo does).
2. Read `$AI_OS_ROOT/context/personal/me/profile.md` and `me/preferences.md`. If `context/personal/` does not exist, run `setup/seed-personal-context.py` and ask the user to fill it in.
3. Read `$AI_OS_ROOT/rules/never_do.md` and `ask_before_doing.md`.
4. Read `$AI_OS_ROOT/specs/current_spec.md`. It must contain only the active Spec; an empty template means there is no active Spec.
5. Load skill `using-superpowers` (router).

Read only when the task needs it:

| File | Read when |
|---|---|
| `context/personal/work/projects.md` | the task names or touches one of the user's projects |
| `context/global/04_tools.md` | installing, configuring, or debugging the local toolchain |
| `context/personal/work/<scope>/README.md` (`ai-os scope which` names the scope) | any work inside a scope: its role, conventions, design system and projects |
| `context/global/05_sources.md` | looking up official docs or reference repos |
| `context/global/06_brand.md` | branded deliverables (diagrams, site, decks) |
| `workflows/*.md` | the matching kind of task (coding, research, content, new Spec) |

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

When you find a useful parallel-dispatch pattern (e.g., "research + verify + implement"), save it as a skill in `$AI_OS_ROOT/ai-config/skills/<name>/SKILL.md` (the source of truth, symlinked to every CLI — never author it directly in `~/.claude/skills/`) with frontmatter and example. If it is project-specific, put it in `<project>/.agents/skills/<name>/` instead. Future agents (and you) can reuse it.

## At every task

6. Decide whether the task needs a Spec. A Spec (`workflows/project_start.md` → `specs/current_spec.md`) is required only when the work is expected to take more than ~2 hours, touches more than one repo, or the user asks for one. Otherwise plan inline and verify with `verification-before-completion`.
7. → Load skill `brainstorming` if the user's idea is vague.
8. → Load skill `writing-plans` for multi-step work (always when there is a Spec).
9. → Load skill `verification-before-completion` before declaring done. The prompts in `verifiers/` (e.g. `critic_prompt.md`) are optional tools, not a mandatory pass.
10. → Load skill `code-review-and-quality` before the final commit.
11. → Load skill `finishing-a-development-branch` at the end.

## Use the memory stack

The memory MCP servers are always running; use them instead of re-discovering.
`group_id` = the repo directory name (e.g. `ai-os`, `plansmith`); facts that span
projects or are about the user go in `main`.

- **Before** work on a project or a past decision: graphiti `search_memory_facts`
  (and `search_nodes`) with the project and topic. In Claude Code a SessionStart hook
  (`setup/hooks/claude-session-memory.py`) already preloads the repo's facts; search for more.
- **After** a decision, a root cause, a convention or an environment fact is settled:
  graphiti `add_memory` — one short, self-contained, dated episode in English. Never
  secrets, raw logs, or task progress (that goes in `specs/`).
- **Code questions** in an indexed repo: grepai `grepai_search` for "where/how is X
  done", codebase-memory `search_graph` / `trace_path` for callers and structure —
  before a broad Grep.
- A memory tool that does not answer never blocks the task: note it and continue.
  Health: `ai-os health` (functional checks; also runs twice a day and notifies on failure).

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

## Work inside the folder's scope

Every project belongs to one scope: personal, an employer, or the user's own company (one brand per product).
`ai-os scope which` names it from `context/personal/work/scopes.yaml`; in Claude Code the session start hook says it.

- **Design:** UI for a scope uses that scope's design system or the product's own `DESIGN.md`, never another
  scope's tokens and never the AI-OS brand by default.
- **Identity:** commits carry the scope's git identity (`ai-os scope git-config --apply` wires it by folder).
- **Confidentiality:** material from one scope never goes into another scope's repo. The pre-push guard checks
  the terms listed per scope by severity: `block` stops the push (internal names, ids, private data), `warn`
  reports it (a public company name).
- **Notes:** read `context/personal/work/<scope>/README.md` before non-trivial work in that scope.

## When writing code

**Ponytail is always on (`full`).** Before writing any code, climb the ladder and stop at the first rung that holds: does this need to exist at all (YAGNI) → is it already in this codebase → stdlib → native platform feature → already-installed dependency → one line → minimum that works. Shortest working diff wins, but only after you understand the flow the change touches; a bug fix means the root cause in the shared function, not a guard per caller. Never simplify away input validation at trust boundaries, error handling that prevents data loss, security, accessibility, or anything explicitly requested. Non-trivial logic leaves one runnable check behind. Per-session override: `/ponytail lite|full|ultra|off`. Machine default: `~/.config/ponytail/config.json` (Windows: `%APPDATA%\ponytail\config.json`).

**Tests are the default for new and changed behavior.** For features and non-trivial
functions or classes, add or strengthen behavioral tests where possible. Choose the
applicable layers: unit tests for logic and boundaries, integration tests for component
interactions, E2E tests for critical user flows, and migration tests for schema or data
migrations. A layer that does not apply is not required; do not add tests just to count
accessors or implementation details.

For updates, fixes and refactors, preserve existing coverage, add regression or
characterization tests for changed behavior, and run the relevant existing tests for the
affected code and dependent paths. Use mutation testing on relevant logic when an
appropriate tool is available and the run is safe and practical; investigate meaningful
survivors rather than chasing a score. Follow existing project policies and approval
boundaries for dependencies, external systems and costly runs.

Report the tests and runtime checks run, failures, and any untested behavior or blocked
checks with their reasons. Tests reduce risk; no coverage or mutation score guarantees
error-free software. See `workflows/coding.md` for the coding workflow.

12. Run type check (TypeScript: `tsc --noEmit`, Python: `mypy`).
13. Run tests (Vitest, pytest, bats, Pester).
14. Run lint (ESLint, ruff, shellcheck, PSScriptAnalyzer).
15. Run format (Prettier, black, shfmt).
16. If a hook or build script exists, run it.

**Git flow in ai-os: feature → `dev` → `main`.** Work on `dev` (or a feature branch merged
into `dev`); `main` changes only through a `dev` → `main` PR (`gh pr create --base main
--head dev`). `guard-main.yml` rejects PRs to `main` from anything but `dev`, and the
pre-push hook (`setup/hooks/pre-push`) blocks direct pushes to `main` — hotfix only with
`AIOS_ALLOW_MAIN_PUSH=1`. Pushing still needs the user's OK (`ask_before_doing.md`).

**Clean before `dev` or `main`.** Nothing lands on `dev` or `main` with a known error of any kind: type, lint,
test, build, format or security. Before asking to push to `dev` (a feature branch merged into it included), run
steps 12-16 and `aios-security-review`: read `ai-config/skills/aios-security-review/SKILL.md` and follow it, base
`origin/dev`. Before the `dev` → `main` PR, run it again against `origin/main`, then `aios-security-audit` on the
repo. Fix every blocker and every error the checks show, including ones that were already there, or stop and say
what is left and why; never push around a red check. The pre-push hook enforces the deterministic part (a new
critical or high finding blocks, and a scanner that did not run is not clean); the review and the audit are yours.

## When you find an error, anywhere

If a check (type-check, lint, test, build, runtime) surfaces an error:

- **Before a push to `dev` or `main`:** the whole branch must be clean (see "Clean before `dev` or `main`" above).
- **In what you touch** (files, functions, or flows the current task changes): fix it as part of the current task. "Pre-existing" is not a reason to skip it, and the code you touch must be left in better shape than you found it.
- **Elsewhere** (unrelated files, other stacks, other repos): do not expand the task to fix it. Report it at the end with the location, the error, and a concrete proposed fix.
- If a fix needs information only the user has (an external credential, a genuine product decision, a destructive/irreversible step), propose the concrete fix instead of just listing the symptom.

## When creating artifacts

17. Save active task planning only in `specs/current_spec.md`; save completed Specs in the versioned `archive/` directory.
18. Use conventional commits: `feat:`, `fix:`, `docs:`, `chore:`, `refactor:`, `test:`.
19. Cite sources for claims.
20. Add examples for non-trivial code.
21. Update the related context file (if applicable).

## When a task needs a diagram

22. Route by **destination artifact**, not by the word "diagram":

    | Destination | Use |
    |---|---|
    | Branded deliverable — docs, ADRs, README, decks, social cards | `diagram-design` skill (HTML + inline SVG, AI-OS skin, dark by default) |
    | Understand or plan real code — repo architecture, request sequence, data flow, state machine, Spec/Plan figure | `archify` skill (interactive HTML from typed JSON, source-backed with `--repo-root`) |
    | The diagram lives in FigJam / Figma | figma MCP `generate_diagram` |
    | The destination is a claude.ai Artifact | `artifact-diagramming` |
    | Throwaway shape inside a chat reply | fenced mermaid, no skill |

23. Never hand-roll SVG for a branded diagram. `diagram-design` owns the skin, the complexity
    budget, and the accessible-SVG contract; a hand-rolled figure silently drops all three.
24. Brand tokens come from the folder's scope first (`ai-os scope which`: an employer's design system, a product's
    `DESIGN.md`), and only for AI-OS itself or a project without one from `context/global/06_brand.md`. Do not read hex values out of `apps/site/src/index.css`
    or invent them, and do not rewrite a skill's style guide for a single project — use
    `.ai-os/brand-tokens.md` in that project's root.
25. Before shipping a `diagram-design` diagram, run the skill's taste gate (`SKILL.md` §9) and
    `python3 ~/.claude/skills/diagram-design/scripts/self_check.py <file>`. Report the result.
    `archify` output is working material, not a branded deliverable: it keeps its own skin, must
    pass its own `finalize` gate (a non-zero exit is a failure), and is not embedded in docs
    that need the AI-OS brand.

## When a task is UI or visual design

26. UI work goes through the `aios-ui-*` commands, which chain the skills below and end with a runtime gate:

    | You want to | Command |
    |---|---|
    | Build a new page, screen or component | `/aios-ui-design` |
    | Have a fresh agent judge an existing screen or flow (read-only) | `/aios-ui-review` |
    | Fix an existing UI, proven before and after | `/aios-ui-improve` |
    | Check pages mechanically (screenshots, console, overflow, a11y) | `/aios-ui-verify` |
    | Match reference screens or images, scored until a bar is met | `/aios-ui-design` (Match references) |
    | Build a 3D scene or WebGL/shader piece for the web | `/aios-ui-3d` |
    | Make a video in code (launch, motion, hero loop) | `/aios-ui-video` |

    UI work is not done until `/aios-ui-verify` passes, or its gaps are stated, and the screenshots were looked at.
    Work that iterates for hours toward a bar uses `aios-loop` long-run mode. Whole app, every route: `saas-review`. Outside those commands, route by what the request asks for to ONE skill:

    | Request | Use |
    |---|---|
    | Build a new UI, page, or landing | `frontend-design` |
    | Make it look premium, distinctive, not templated (anti-slop) | `taste-skill` |
    | The user names Hallmark: a page in a dealt theme, `/hallmark redesign` or `/hallmark audit` | `hallmark` (explicit only) |
    | Audit an existing app's UI/UX across every route, prioritised findings | `saas-review` |
    | Polish details: component feel, animation decisions | `emil-design-eng` |
    | Hover/press/focus states, transitions, loading and scroll motion | `micro-interactions` |
    | Check UI code against interface guidelines (focus, forms, a11y, perf) | `web-design-guidelines` |
    | Which library for a frontend task (toasts, charts, drag and drop, animated numbers…) | `pick-ui-library` (explicit invocation only) |
    | The destination is a claude.ai Artifact | harness `artifact-design` skill |

27. Brand tokens come from the folder's scope first, then `context/global/06_brand.md` (same rule as diagrams).

## At session end

28. When an active Spec is completed, archive it as `archive/YYYY-MM-DD-<slug>.md`.
29. Reset `specs/current_spec.md` to the no-active-Spec template only after the archive succeeds.
30. Report final state with concrete evidence.
