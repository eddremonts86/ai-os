---
name: full
description: End-to-end delivery pipeline — spec + plan + build + review + simplify + ship. Use when asked to "/full", "take this all the way to shipped", "full delivery cycle". Also "/action", "take this idea to reviewed code", "spec through review in one go" — then run review mode (stop after Phase 4).
argument-hint: 'Describe the feature or change to build (add "review mode" to stop after review)'
user-invocable: true
---

# /full — idea to shipped, production-ready code

Run the following phases in order, completing each one fully (including any user
confirmation it requires) before starting the next.

## Modes

- **Ship mode (default)** — Phases 1–6.
- **Review mode** — Phases 1–4, then stop. Use it when the user asks for `/action`,
  "idea to reviewed code", or "spec through review": the code is reviewed and green
  but not simplified or shipped. (This replaces the former `action` skill.)

## Phases

**Phase 1 — Spec.** Load `brainstorming` to pin down objective, users, acceptance
criteria, and constraints, then follow `workflows/project_start.md` to write the
Spec into `specs/current_spec.md`. If an `intent.md` already exists, use
`intent-to-spec` instead. Confirm the Spec with the user before proceeding.

**Phase 2 — Plan.** Invoke `writing-plans`. Read the Spec, slice the work
vertically into small verifiable tasks with acceptance criteria, save the plan,
and present it for review before implementation starts.

**Phase 3 — Build.** Invoke `subagent-driven-development` (same session) or
`executing-plans` (separate session with checkpoints), together with
`test-driven-development`. Implement each task minimally, write tests first where
practical, run the tests, fix failures, and commit when green.

**Phase 4 — Review.** Invoke `code-review-and-quality`. Review all changes across
five axes (correctness, readability, architecture, security, performance).
Categorize findings and resolve all Critical and Important items.
In review mode, stop here and report.

**Phase 5 — Simplify.** Invoke `patterns-and-refactoring` (on Claude Code the
built-in `/simplify` also works). Simplify the produced code incrementally (guard
clauses, split functions, descriptive names, remove duplication, delete dead code)
while preserving exact behavior. Re-run tests after each change.

**Phase 6 — Ship.** Invoke `shipping-and-launch`. Run the pre-launch checklist
(code quality, security, performance, accessibility, infrastructure,
documentation). Resolve any failing checks and define the rollback plan before
declaring the feature shipped.

Do not skip a phase's own confirmation step just because `/full` chains them —
each phase's normal human checkpoints (confirm the spec, review the plan) still
apply.
