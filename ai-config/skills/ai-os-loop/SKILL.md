---
name: ai-os-loop
description: implement and run reusable Claude loops — 4-file system (TASK/INSTRUCTIONS/PROGRESS/outputs) with 6 blast-radius safety levels. invoke when user asks "create a loop", "automate this daily", "schedule this review", "make a recurring workflow", "loop the daily review", "set up a cron loop", or mentions "my-loop" / "PROGRESS.md" / "LOOP_INSTRUCTIONS.md". load on AI-OS projects for the loop convention; pairs with ai-os-memory skill when the loop needs persistent state.
---

# AI-OS Loop Skill

Implements the loop pattern from Rahul (@sairahul1)'s "How to Create Loops
with Claude Code" adapted to AI-OS conventions.

## When to Use

Trigger this skill when:

- the user wants to automate something they do repeatedly (daily, weekly, on trigger)
- the user already has a script/prompt that works once and wants it to keep working
- the user mentions "loop", "recurring", "schedule", "automate", "PROGRESS.md", or "LOOP_INSTRUCTIONS.md"
- the AI is about to run a multi-step operation that should not be re-prompted next time

Do NOT trigger for:

- one-shot tasks (use your normal Spec → Verifier → Environment flow)
- debugging that needs immediate human iteration
- work that has no predictable trigger (ambiguous "every now and then")

## The 4-File System

Every loop has these files in the loop's own directory:

```
my-loop/
├── TASK.md              # the goal — what this loop is trying to accomplish
├── LOOP_INSTRUCTIONS.md  # operating procedure — how Claude should run
├── PROGRESS.md          # memory — what happened across runs
└── outputs/             # where claude writes results
```

Templates at `workflows/loop_template.md`. Always copy the templates —
loop files are owned by the loop itself, never generic.

## Workflow (do this when triggered)

1. **Read** `rules/loop_safety.md` to refresh the 6 blast-radius levels in mind.
2. **Ask** the user which level the loop should start at. Never assume — when
   in doubt, start at level 2 (draft outputs) and promote later.
3. **Copy** the templates from `workflows/loop_template.md` into the new loop's
   directory.
4. **Help** the user fill `TASK.md` and `LOOP_INSTRUCTIONS.md` — these are
   the loop's contract. `PROGRESS.md` starts empty.
5. **Run** the loop manually 3-5 times before scheduling. Each run should
   continue from where the last one stopped, NOT restart.
6. **Decide** if scheduling makes sense. Use `ai-os loop add` to register
   for the Hermes scheduler, OR your CLI's native scheduler.
7. **Promote** blast-radius levels only after 3-5 successful runs at
   the prior level, recorded in `PROGRESS.md`.

## CLI Companion

`ai-os loop` is the management entry-point. Sub-commands:

- `ai-os loop ls` — list registered loops in `memory/loop_state/`
- `ai-os loop add <dir>` — register a loop directory
- `ai-os loop status <id>` — show current state, last run, blockers
- `ai-os loop run <id>` — run a loop manually now (one-shot, no scheduling)
- `ai-os loop pause <id>` — disable scheduling for a loop
- `ai-os loop rm <id>` — unregister a loop (keeps the loop directory intact)

## Compatibility

This skill is vendor-neutral. The same loop directory works under:
- Hermes (uses `hermes cronjob create`)
- Claude Code (uses its `claude --loop` or `claude task`)
- Codex CLI / Gemini CLI / Antigravity (uses their native scheduler)
- Manual invocation (open the folder, paste the run prompt)

The only Hermes-specific surface is `ai-os loop` (CLI wrapper). The
loop files themselves are pure markdown.

## Pair With ai-os-memory

When a loop needs persistent state across Hermes restarts, use
`ai-os-memory` to sync Hermes sessions into the FalkorDB graph. The
loop's `PROGRESS.md` is the human-readable cross-session state;
FalkorDB is the structured-queryable store. Both can coexist —
loop runs update `PROGRESS.md`, optionally ingest a structured summary
via `ai-os memory sync-sessions`.
