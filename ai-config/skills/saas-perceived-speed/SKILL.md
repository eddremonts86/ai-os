---
name: saas-perceived-speed
description: Make a product feel fast and solid — immediate feedback, stable layouts during load, honest progress for long operations, and a real performance budget. Use when asked "the app feels slow", "make it feel faster", "add loading states", "set performance budgets", "why does this feel cheap/janky", or when reviewing any flow where the user waits. Covers perceived-speed principles, the six feedback types, frontend and backend checklists, and the budget surfaces to define.
---

# Speed as aesthetic

A fast product reads as more solid, more expensive and more trustworthy. Speed is not only technical
throughput — it is perception, continuity and feedback. A 400 ms action that confirms instantly beats a
200 ms action that shows nothing.

## Principles of perceived speed

- Confirm immediately that an action was received.
- Keep the layout stable during load — no reflow, no jump.
- Use skeletons only when they represent the real structure that is coming.
- Never show a blank screen on a critical route.
- Load what is needed to decide or act first; defer the rest.
- Use optimistic updates only where rollback is safe.
- Preserve filters and scroll position when navigating back.
- Show staged progress for long operations.
- Let the user continue with other work where possible.
- Say what is being processed, in words.
- Always offer retry and recovery after a failure.

## The six feedback types

| Type | Use for |
| --- | --- |
| Immediate control change | Local actions — toggle, select, expand |
| Inline state | Saving, syncing, validating |
| Toast | Brief confirmation requiring no decision |
| Banner | A persistent state affecting the whole view |
| Modal | Only when a decision is required before continuing |
| Activity centre | Long processes or several background tasks |

Picking the wrong one is itself a defect: a modal for a toast-level event interrupts; a toast for a
persistent failure hides it.

## Performance budget

Set your own numbers from real users, devices and regions — copied numbers are theatre. Define a
budget for at least:

- Initial load of critical routes
- Response time of frequent interactions
- p95 of critical endpoints
- Initial JavaScript weight
- Image size and count
- Visual stability
- Network error rate

Review **percentiles, not averages**. An average hides the users who are leaving.

## Frontend checklist (React / Vite and equivalents)

- [ ] Code split per route and per heavy feature
- [ ] Non-critical modules lazily loaded
- [ ] Query caching and request deduplication in place
- [ ] No request waterfalls (parent fetch → child fetch → grandchild fetch)
- [ ] Virtualisation for genuinely large lists — not for 20 rows
- [ ] Images dimensioned and optimised; no layout shift on load
- [ ] Heavy dependencies audited against the value they add
- [ ] Re-renders measured before optimising — profile, do not guess
- [ ] Every mutation has a pending state and an error state

## Backend checklist

- [ ] Indexes for the most frequent queries
- [ ] Real pagination, not fetch-all-then-slice
- [ ] N+1 queries eliminated
- [ ] Repeated computation cached or precomputed
- [ ] Long jobs moved to a queue where appropriate
- [ ] Rate limits, retries and idempotency
- [ ] Payload size trimmed to what the screen uses
- [ ] Observability per endpoint and per business operation

## Verification

Never claim a speed improvement from a bundle-size diff alone. Exercise the runtime:

1. Load the critical route with the network throttled and watch what the user sees at each moment.
2. Trigger the slowest action and time from click to first feedback — that is the number that matters.
3. Force a failure and confirm retry works and no entered data is lost.
4. Report before/after with the real measurements, including which percentile.

## Speed checklist

- [ ] No critical route shows a blank screen
- [ ] Every action receives immediate feedback
- [ ] Loading preserves layout structure
- [ ] Long operations show staged status
- [ ] Errors allow retry or recovery
- [ ] Form data is never lost
- [ ] Requests are deduplicated
- [ ] Large lists paginate or virtualise
- [ ] Performance budgets exist and are written down
- [ ] The team reviews percentiles, not only averages

## Related skills

`saas-expensive-ui` · `saas-ui-audit` · `saas-data-trust` · `react-performance` · `benchmark`.
