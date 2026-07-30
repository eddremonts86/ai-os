---
name: full
description: Complete end-to-end delivery pipeline — spec + plan + build + review + code-simplify + ship. Use when asked to "/full", "take this all the way to shipped", "full delivery cycle", or when a feature request should go from idea to a shipped, simplified, reviewed feature without stopping between phases.
argument-hint: 'Describe the feature or change to build and ship'
user-invocable: true
---

# /full — idea to shipped, production-ready code

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
before proceeding.

**Phase 5 — Simplify.** Invoke the `code-simplification` skill. Simplify the
produced code incrementally (guard clauses, split functions, descriptive names,
remove duplication, delete dead code) while preserving exact behavior. Re-run
tests after each change.

**Phase 6 — Ship.** Invoke the `shipping-and-launch` skill. Run the pre-launch
checklist (code quality, security, performance, accessibility, infrastructure,
documentation). Resolve any failing checks and define the rollback plan before
declaring the feature shipped.

Do not skip a phase's own confirmation step just because `/full` chains them —
each phase's normal human checkpoints (confirm the spec, review the plan) still
apply.
