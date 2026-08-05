---
name: saas-ui-audit
description: Score an existing product's UI/UX against a 21-criterion matrix and produce a prioritised, evidence-backed findings report (P0/P1/P2) instead of vague design opinions. Use when asked to "audit the UI", "review the whole app's design", "score our interface", "why is this flow losing users", "give me a prioritised UI backlog", or when a redesign is being proposed and nobody has measured anything yet. Provides the scoring matrix, per-screen worksheet, master checklists, report format and the 30-day remediation order. Requires an inventory first — see `app-route-inventory`.
---

# SaaS UI audit

Turn "it looks cheap" into a scored, prioritised, evidence-backed backlog. This skill measures; it
does not redesign. Judgement criteria come from `saas-expensive-ui`.

## Non-negotiables

1. **Inventory before opinion.** You cannot audit an app whose routes you have not enumerated and
   visited. Run `app-route-inventory` first.
2. **Evidence per finding.** Every finding carries a route, a file/component reference, and an
   observable symptom. "Feels cluttered" is not a finding; "four primary buttons in the same view at
   `/settings/billing`, `BillingPanel.tsx:82`" is.
3. **No redesign proposals when hierarchy, content, tokens or existing components can fix it.**
4. **Never invent metrics, users or requirements.** If a baseline does not exist, record "no baseline"
   and list measuring it as a task.
5. **Score before you fix.** The matrix decides the order of work, not personal taste.

## Flow

### Phase 1 — pick the flows that matter

Do not audit 60 routes equally. Score each flow 1–5 on: frequency · commercial impact · observed
friction · error rate · support volume · relevance to activation · trust risk · effort to improve.

Audit in this order unless evidence says otherwise:

1. Signup and activation
2. The core flow that produces value
3. Dashboard or work inbox
4. Errors, permissions and empty states
5. Collaboration or sharing
6. Payment, upgrade, expansion
7. Advanced configuration

### Phase 2 — inventory (four kinds)

- **Screens** — route · segment/role · main job · primary CTA · data needed · components used ·
  states implemented · success metric · known problems · owner
- **Components** — classify each as canonical · duplicate · legitimate variant · temporary exception ·
  obsolete · unowned
- **Styles** — count unique colours, type sizes, radii, shadows, spacings, button styles, field
  styles, modal patterns, table patterns, icon families. A high count is system debt, not richness.
- **Content** — synonyms for the same action · generic error messages · promotional copy inside tasks
  · technical labels the customer does not use · inconsistent dates/units · ambiguous CTAs like
  "Continue", "Accept", "Process"

### Phase 3 — score the matrix

Use `references/audit-matrix.md`. Per criterion: **0** critical failure · **1** weak · **2** correct ·
**3** excellent. Multiply by flow impact (1/2/3), sort by potential value lost.

### Phase 4 — worksheet per critical screen

Use `references/screen-worksheet.md` — one filled copy per critical screen. This is where the
finding-level evidence comes from.

### Phase 5 — report

Use `references/report-template.md`:

1. Executive summary — max 15 findings
2. Full prioritised table
3. Change plan in small batches
4. Decisions requiring a human or user validation

Stop here and get agreement before writing code. Re-scoping is cheap now and expensive after eight
phases of edits.

### Phase 6 — remediate in priority order

`references/rollout-plan.md` carries the P0/P1/P2 definitions, the 30-day order and the success
metrics. The short version:

- **P0 — trust and ability to finish the job.** Ambiguous primary action · wrong, context-free or
  stale data · errors that lose work · confusing permissions · slow operations with no feedback ·
  unsafe destructive actions · serious keyboard/contrast/responsive failures · onboarding blockers.
- **P1 — coherence and friction.** Unify components · reduce colours and variants · remove
  duplication · improve empty states · simplify navigation · shorten onboarding · make progress
  visible · instrument the funnel.
- **P2 — identity and polish.** Distinctive motion · custom illustration · brand detail · advanced
  transitions · celebration moments · extra aesthetic personalisation.

**Never run P2 to cover a P0.**

## Acceptance criteria — global

A screen or flow is not done until:

**Purpose and hierarchy** — documented main job · one visible primary action · content ordered by
decision rather than by technical availability · hierarchy works without colour.

**Visual system** — all colours from tokens · all spacing from the scale · no new shadow/radius/size
without justification · one icon family · no emojis as functional icons · no unnecessary nested cards.

**Data and content** — no information repeated without a new reading · metrics carry unit, period and
context · terms match the customer's language · error messages explain what happened and how to
continue · CTAs describe the concrete action.

**States and safety** — loading, empty, error, permission and success all designed · destructive
actions explain consequences · reversible actions offer undo where appropriate.

**Accessibility and responsive** — keyboard navigable · visible focus · sufficient contrast ·
accessible labels · zoom and long content tested · responsive by priority, not by shrinking.

**Measurement** — start event instrumented · outcome event instrumented · errors and abandonment
measurable · a baseline exists from before the change.

## Reference files

- `references/audit-matrix.md` — the 21 criteria, audit question, red flag, target
- `references/screen-worksheet.md` — per-screen diagnostic sheet
- `references/checklists.md` — the five master checklists (slop, clarity, data/trust, onboarding, speed, system)
- `references/report-template.md` — findings report and redesign spec templates
- `references/rollout-plan.md` — P0/P1/P2, 30-day order, success metrics, weekly quality meeting

## Related skills

`saas-expensive-ui` (the judgement) · `app-route-inventory` (the prerequisite) · `saas-data-trust` ·
`saas-perceived-speed` · `saas-onboarding-activation` · `saas-landing-continuity` · `/saas-review`
(the chained whole-app pass) · `fix-ui-ux` (implementation-level repair chain).
