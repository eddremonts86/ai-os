# Report and spec templates

## 1. Findings report

```markdown
# UI audit — [app name]

- Date:
- Scope: [routes / flows audited]
- Stack: [framework, router, design system]
- Baseline: [what was measured before, or "no baseline"]
- Method: route inventory + runtime walk + 21-criterion matrix

## Executive summary (max 15 findings)

| # | Finding | Route | Severity | User job damaged | Fix in one line |
| --- | --- | --- | --- | --- | --- |

## Scores

| Flow | Impact | Weighted loss | Top 3 gaps |
| --- | --- | --- | --- |

## Full findings

### F-01 — [title]

- **Severity:** P0 / P1 / P2
- **Route:**
- **File / component:** `path/to/File.tsx:LINE`
- **Evidence:** [what was observed, with the screenshot path or the console/network output]
- **User job damaged:**
- **Recommendation:**
- **Component or token to reuse:**
- **Acceptance criterion:**
- **Regression risk:**

## Change plan (small batches)

| Batch | Findings | Files touched | Verification | Revertible alone? |
| --- | --- | --- | --- | --- |

## Needs a human decision

| # | Question | Why an agent must not decide it | Who decides |
| --- | --- | --- | --- |

## Not measured

[Anything the audit could not verify, and what it would take to verify it. Never leave this implicit.]
```

## 2. Redesign spec (per flow)

```markdown
# Redesign: [flow]

## Problem
[What friction exists, for whom, with what evidence]

## User job
[The outcome they are trying to get]

## Business outcome
[Activation, retention, conversion, support reduction]

## Baseline metrics
- Flow starts:
- Completions:
- Task time:
- Errors:
- Abandonment:
- Support tickets:

## Hypothesis
If [change], then [user] will be able to [outcome], because [reason].

## Design decisions
- Primary action:
- Primary information:
- Deferred information:
- Components reused:
- Tokens:
- States:
- Confirmations:
- Responsive:
- Accessibility:

## What gets removed
- Decorative elements:
- Duplicated data:
- Unnecessary steps:
- Obsolete variants:

## Instrumentation
- Start event:
- Success event:
- Error:
- Abandonment:
- Properties:

## Acceptance criteria
[Copy the global checklist from SKILL.md and adapt]

## Rollout
- Feature flag:
- Initial segment:
- Monitoring:
- Revert condition:
```

## Rules for writing findings

- One finding = one defect = one fixable change. Do not bundle.
- Severity is about **the user's ability to finish the job and trust the result**, not about how ugly
  it is.
- If you cannot name the damaged job, it is not a finding — it is a preference. Say so and drop it.
- Always include the regression risk. A fix with unstated blast radius will be reverted by someone
  else at a worse moment.
