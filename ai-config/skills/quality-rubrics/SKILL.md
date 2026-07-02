---
name: quality-rubrics
description: "Use when you need an explicit pass/fail evaluation matrix to judge work before declaring it done — reviewing a feature, PR, spec, deliverable, or another agent's output against objective criteria. Produces a rubric of weighted, binary-checkable criteria, scores the artifact against it, and returns a PASS/FAIL verdict with evidence per criterion. Pairs with verification-before-completion (runtime evidence) and eval-harness (EDD metrics). Use when 'is this actually good enough?' needs a defensible answer, not a vibe."
user-invocable: true
allowed-tools: Read, Write, Edit, Grep, Glob, Bash
license: Apache 2.0
---

# Quality Rubrics

Turn "is this good enough?" into a defensible PASS/FAIL with evidence. Build a
rubric of binary-checkable criteria, score the artifact against each, and gate
completion on the result.

## When to activate

- Before declaring a feature, fix, spec, or document done.
- Reviewing a PR or another agent's output and needing an objective verdict.
- Defining acceptance criteria up front so "done" is unambiguous.

Complements — does not replace — `verification-before-completion` (which supplies
the runtime evidence a rubric criterion cites) and `eval-harness` (pass@k across
many runs).

## Rubric design rules

1. **Binary criteria only.** Each line must be answerable yes/no with evidence.
   Bad: "code is clean". Good: "no function exceeds 50 lines" / "all public
   functions have a return type".
2. **Cite evidence, not opinion.** Each PASS references a file:line, a command
   output, a screenshot, or a test name. No evidence → FAIL.
3. **Weight by risk.** Tag each criterion `[blocker]`, `[major]`, or `[minor]`.
   Any `[blocker]` fail → overall FAIL, regardless of score.
4. **5–12 criteria.** Fewer misses real risk; more is theater. Cut criteria that
   never fail in practice.

## Scoring

- Each criterion: **PASS** / **FAIL** / **N/A** (with a one-line reason).
- Overall verdict:
  - **FAIL** if any `[blocker]` fails.
  - **FAIL** if any `[major]` fails (unless explicitly waived by the user).
  - **PASS** only when all blockers + majors pass and evidence is attached.
- Never soften a FAIL to "mostly passing". Report the failing criteria and stop.

## Output format

```
## Rubric: <artifact>
| # | Criterion | Weight | Verdict | Evidence |
|---|-----------|--------|---------|----------|
| 1 | <binary criterion> | blocker | PASS | src/x.ts:42 / `npm test` green |
| 2 | ... | major | FAIL | no test covers the empty-input path |

Verdict: FAIL — criterion 2 (major) unmet.
Next: add coverage for empty input, re-run rubric.
```

## Reusable starter rubrics

**Code change / PR**
- [blocker] Builds and type-checks clean (`<build cmd>` output attached).
- [blocker] Tests pass; new behavior has a test that fails without the change.
- [blocker] Runtime-verified: the change was exercised, not just compiled.
- [major] No secret, token, `.env`, or generated artifact committed.
- [major] Errors are handled and surfaced in English; no silent catches.
- [major] Diff is scoped — no unrelated churn.
- [minor] Naming/idioms match surrounding code.

**Spec / plan**
- [blocker] Success criteria are stated and measurable.
- [blocker] Verifier defined: how do we know it worked at runtime?
- [major] Scope boundaries explicit (what is out of scope).
- [major] Risks / rollback noted for irreversible steps.

**Written deliverable**
- [blocker] Every factual claim is sourced or verifiable.
- [major] Answers the actual question asked, lead-first.
- [major] Language rules respected (code/docs English).
- [minor] No filler, no ceremony, lists over prose where lists fit.

## Workflow

1. Pick or adapt a starter rubric to the artifact; add domain-specific criteria.
2. Weight each criterion; confirm the blockers with the user if stakes are high.
3. Score each line — gather the evidence, don't assume it.
4. Emit the table + verdict. On FAIL, list the gap and the next action; do not
   claim completion.
