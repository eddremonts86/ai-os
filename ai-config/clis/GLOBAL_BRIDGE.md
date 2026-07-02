# AI-OS — Global Bridge

> This file is the single bridge that loads the AI Operating System into **every
> project, in every CLI**. It is symlinked to each CLI's global instruction file:
> `~/.claude/CLAUDE.md`, `~/.codex/AGENTS.md`, `~/.gemini/GEMINI.md`,
> `~/.agents/AGENTS.md`. Hermes is not symlinked: it gets a managed "AI-OS BRIDGE"
> block appended to `~/.hermes/SOUL.md` by `setup/install-mac.sh` (idempotent).
> MiniMax gets `ai-config/clis/minimax-overlay.md` copied into each agent's `agent.md`.
>
> Single source of truth: `/Users/edd/Projects/ai-os`. Edit the files there; every
> CLI sees the change. Do not duplicate content here — only point and inline the
> few always-on rules.

## Load at session start (all of context/)

@/Users/edd/Projects/ai-os/context/00_profile.md
@/Users/edd/Projects/ai-os/context/01_business_or_work.md
@/Users/edd/Projects/ai-os/context/02_projects.md
@/Users/edd/Projects/ai-os/context/03_preferences.md
@/Users/edd/Projects/ai-os/context/04_tools.md
@/Users/edd/Projects/ai-os/context/05_sources.md

If your CLI does not auto-expand `@`-imports (Codex, Antigravity, MiniMax, Hermes),
read every file listed above now, plus the full operating manual:

- `/Users/edd/Projects/ai-os/CLAUDE.md` — the operating method (Spec → Verifier → Environment)

## Read on demand

- `/Users/edd/Projects/ai-os/CLAUDE.md` — full operating method, project structure, commands
- `/Users/edd/Projects/ai-os/rules/` — always_do / ask_before_doing / never_do

## Non-negotiable rules (inline, so they apply even before any file is read)

1. **Languages.** Chat in Spanish (lowercase, terse, no ceremony). ALL files —
   code, commits, docs, comments, logs, error messages, YAML frontmatter — in
   English. No exceptions, including third-party imported skills.
2. **Method.** For non-trivial work, use the `using-superpowers` skill as the
   router first. Follow Spec → Verifier → Environment. Verify before claiming done
   with runtime evidence, not build/lint/tests alone.
3. **Autonomy.** "go"/"ok"/"no pares hasta el final" = execute without pausing
   (reversible work only). Multi-step independent work → up to 3 parallel subagents.
   Every started service → end with URL + 1-line status.
4. **Safety.** Confirm before irreversible, destructive, or outward-facing actions
   (`rm -rf`, force-push, sending messages, spending money, prod changes) unless
   already authorized. Never commit secrets, `.env`, `node_modules/`, `dist/`.
5. **Memory.** Canonical identity lives in `/Users/edd/Projects/ai-os/context/`.
   Per-CLI durable facts go to that CLI's own store:
   - Claude Code → the project memory dir (`MEMORY.md` index + one file per fact)
   - Hermes → `~/.hermes/memories/` (`MEMORY.md` + `USER.md`)
   - Codex → built-in memory store
   Keep `context/` as the source of truth; sync notable facts back to it.

## Skills

~159 shared skills live in `/Users/edd/Projects/ai-os/ai-config/skills` and are
symlinked into this CLI's skills dir. Prefer them over ad-hoc solutions.
