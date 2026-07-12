# Loop Safety Rules

Six blast-radius levels for any automated workflow that runs on
AI-OS. Every loop must declare its level before scheduling.

## The 6 Levels

| Level | Name | What it does | Examples |
|---|---|---|---|
| 1 | Read only | reads files / tickets / logs / issues | daily project review, CI log triage |
| 2 | Draft outputs | writes to `outputs/` only — reports, plans, recommendations | PR review draft, standup note |
| 3 | Sandbox edits | modifies files inside a controlled sandbox (branch / worktree) | code refactor in feature branch |
| 4 | Draft external actions | prepares but does NOT send: PR, Slack message, ticket update | PR description, Slack draft |
| 5 | Human-approved actions | applies changes only after explicit human approval | merge PR, send email |
| 6 | Automated low-risk actions | completes narrowly scoped tasks automatically — with logs, limits, rollback | daily backup, weekly housekeeping |

## Rule: Level <= 3 by Default

When a loop declares its level, start at the lowest level that
satisfies the task. Promotion requires repeated successful runs at
the prior level.

**No loop may run above level 3 without:**
- at least 5 successful manual runs at the prior level
- an explicit human promotion recorded in `memory/loop_state/PROGRESS.md`
- a documented failure / rollback policy in the loop's `LOOP_INSTRUCTIONS.md`

## Decision Tree

```
Does the loop modify anything outside outputs/ ?  NO  -> Level 1 or 2
                                            YES  -> can it be sandboxed?  YES -> Level 3
                                                                         NO  -> does it require external action?
                                                                                  YES -> Level 4 or 5
                                                                                  NO  -> re-think the loop
```

## Mandatory Loop Anatomy

Every loop must have these 4 files:

```
my-loop/
├── TASK.md              # the goal — what this loop is trying to accomplish
├── LOOP_INSTRUCTIONS.md  # operating procedure — how Claude should run
├── PROGRESS.md          # memory — what happened across runs
└── outputs/             # where claude writes results — predictable, inspectable
```

See `workflows/loop_template.md` for copy-paste-ready templates.

## The 5 Failure Modes That Sink Loops

Common patterns that make loops unsafe. Block at review time:

1. **Scheduled before manual testing** — always run 3-5 times manually first
2. **No state file** — every run restarts from zero, defeats the whole point
3. **No verification** — the loop trusts itself blindly
4. **No failure policy** — when something goes wrong, claude improvises
5. **Too many tools too early** — blast radius expands without guardrails

## Level Promotions (recorded in PROGRESS.md)

When promoting a loop from one level to the next, the promotion entry
must include:

```
## Level promotion: 2 -> 3
- date: 2026-07-07
- prior_level_runs: 5
- promoted_by: human (edd)
- verified_checklist: [
    "outputs/daily-review.md present 5/5 runs",
    "PROGRESS.md updated 5/5 runs",
    "no files outside outputs/ modified"
  ]
```

This creates an auditable history of "when did this loop become more
powerful".

## Compatibility

These rules are vendor-neutral — they apply equally to:
- Hermes (AI-OS default)
- Claude Code
- Codex CLI
- Gemini CLI
- Antigravity
- OpenCode
- Aider
- Cursor

The blast-radius classification lives in `LOOP_INSTRUCTIONS.md`, not in
any vendor-specific config file. Any CLI that reads `LOOP_INSTRUCTIONS.md`
gets the same safety guarantee.
