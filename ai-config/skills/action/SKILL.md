---
name: action
description: Combo workflow that takes an idea to reviewed code in one command — spec + plan + build + review. Use when asked to "/action", "take this idea to reviewed code", "spec through review in one go", or when a feature request should run the full spec-plan-build-review cycle without stopping between phases.
argument-hint: 'Describe the feature or change to build'
user-invocable: true
---

# /action — idea to reviewed code

Run the following phases in order, completing each one fully (including any user
confirmation it requires) before starting the next.

**Phase 1 — Spec.** Invoke the `spec-driven-development` skill. Ask clarifying
questions about objective, users, acceptance criteria, and constraints. Produce a
structured SPEC.md and confirm it with the user before proceeding.

**Phase 2 — Plan.** Invoke the `planning-and-task-breakdown` skill. Read SPEC.md,
slice the work vertically into small verifiable tasks with acceptance criteria,
save the plan, and present it for review before implementation starts.

**Phase 3 — Build.** Invoke the `incremental-implementation` skill together with
`test-driven-development`. Implement each task minimally, write tests first where
practical, run the tests, fix failures, and commit when green.

**Phase 4 — Review.** Invoke the `code-review-and-quality` skill. Review all
changes across five axes (correctness, readability, architecture, security,
performance). Categorize findings and resolve all Critical and Important items
before declaring the work done.

Do not skip a phase's own confirmation step just because `/action` chains them —
each phase's normal human checkpoints (confirm the spec, review the plan) still
apply.
