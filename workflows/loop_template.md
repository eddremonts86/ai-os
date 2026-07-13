# Loop Template

Copy this directory to start a new loop. Run from `my-loop/`.

## Files

```
my-loop/
├── TASK.md
├── LOOP_INSTRUCTIONS.md
├── PROGRESS.md
└── outputs/
```

## TASK.md (start here)

```markdown
# <Loop Name>

## Goal

<One paragraph: what this loop is trying to accomplish>

## Expected Output

Each run should produce or update:

- `outputs/...` # describe the file(s)
- `PROGRESS.md`

## Scope

Claude may:

- read files in <list allowed paths>
- write to `outputs/` only

Claude should NOT:

- modify source files outside <list>
- delete or rename files
- send messages or open tickets without explicit approval

## Blast Radius Level

<1-6 per rules/loop_safety.md>

## Failure Policy

If verification fails:

1. <first failure mode> -> <first failure response>
2. <second failure mode> -> <second failure response>
3. Same check fails 3x -> stop and mark as needing human review
```

## LOOP_INSTRUCTIONS.md

```markdown
# Loop Instructions

## Before You Start

1. Read `TASK.md`
2. Read `PROGRESS.md`
3. Inspect allowed paths
4. Identify what changed, what's incomplete, what needs human review

## What You Should Do

<Concrete, observable, scoped instructions>

After writing:

- update `PROGRESS.md` with date, summary, files checked, blockers
- mark whether human review is needed

## Safety Rules

- Do not delete files
- Do not rename or move files
- Do not modify files outside allowed paths
- Only write to `outputs/...` and `PROGRESS.md`
- If unsure whether an action is allowed -> stop and ask

## Verification Checklist

Before ending the run, confirm:

- `outputs/...` exists with all required sections
- `PROGRESS.md` was updated
- No files outside allowed paths were modified
- Each "Do NOT" rule still holds

## Failure Policy

<mirrors TASK.md failure policy>

## Tool Permissions

### GitHub

Allowed: ...
NOT allowed: ...

### Slack

... etc.

(cut any tool the loop doesn't actually need — blast radius shrinks with
every tool removed)
```

## PROGRESS.md

```markdown
# <Loop Name> Progress

## Current State

- Status: Active | Paused | Needs Review
- Main objective: <one line>
- Current focus: <what matters right now>
- Blast radius level: <1-6>
- Last updated: <date>

## Last Run

- Date:
- Summary:
- Files reviewed:
- Output produced:
- Verification: pass | fail
- Human review needed: yes | no

## Open Items

-

## Blockers

-

## Needs Human Review

-

## Next Run Should

-

## Decisions Made

- <date> — <decision> — <promoted-by>

## Level promotions

<empty until first promotion>

## Do Not Repeat

- <things that already failed — never retry>
```

## outputs/

Empty. Run creates its first file here. Recommended naming:

```
outputs/
├── 2026-07-07-daily-review.md
├── 2026-07-08-daily-review.md
└── history/
    └── 2026-Q3-archive.md
```

## Run Manually First

Don't schedule until you have run 3-5 times with small workspace
changes. Open the folder in your CLI of choice and paste:

```
Read TASK.md, PROGRESS.md, and LOOP_INSTRUCTIONS.md.

Then do exactly what LOOP_INSTRUCTIONS.md says, no more, no less.

Verify the checklist before stopping. Update PROGRESS.md.
```

After each run, check two things:

1. `outputs/<date>-<name>.md` — structured output with all required sections
2. `PROGRESS.md` — updated state, blockers, next run guidance

If both look right, the loop is at level 2. Run 3-5 more times with
intentional changes (add a notes file, add a blocker, change a config).
Each run should pick up the changes without starting from zero. That
continuity is the whole point.

When ready for scheduling, register with Hermes via `ai-os loop add my-loop/`,
or wire to your CLI's native scheduler. Promotion to level 3+ requires
human approval recorded in `PROGRESS.md` (`rules/loop_safety.md`).
