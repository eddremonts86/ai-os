---
id: "865"
slug: automating-bureaucracy-and-funding-search-for-a-new-bus
title: Automating bureaucracy and funding search for a new business
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/legal/9gly3h5lg1-automating-bureaucracy-and-funding-searc"
category: legal
date: "2025-10-29"
tags: [Legal, Finance, Business]
country: Canada
tech: [Ruby, Ruby on Rails, PostgreSQL, Sidekiq, Redis, Turbo, Stripe]
---
# Automating bureaucracy and funding search for a new business

## Tech Stack

- **Ruby on Rails** for the API and the server-rendered UI because the workflow is form-driven CRUD with Turbo streams, and Rails keeps the per-step tracking and the bilingual content authoring in one framework.
- **PostgreSQL** for the structured workflow state — business profiles, bureaucratic steps, funding steps, deadlines, portal-status snapshots and per-business trackers — because the data is relational and the schema will evolve as registrations and funding programmes change.
- **Sidekiq** for the scheduled portal-status check, the funding-corpus refresh and the deadline-warning emails, because the work is naturally queue-driven and idempotent at the step level.
- **Redis** as the Sidekiq backing store and the per-business session cache, because the queue is naturally short-lived and the session is naturally evictable.
- **Turbo** for the founder-facing UI because the workflow reads well as a server-rendered page with progressive enhancement, and Turbo streams keep the per-step state visible without a heavyweight SPA.
- **Stripe** for the paid tier because the product has a clear free-versus-paid boundary keyed to organisation-level access, and Stripe handles the billing shape without ceremony.

## Architecture

A founder submits a business profile: province, planned entity type, sector, headcount, expected turnover and founder count. The API evaluates the profile against two datasets maintained side by side. The first is the bureaucratic dataset: federal registrations (corporate federal number, Business Number, GST/HST), provincial registrations for the four largest provinces (with bilingual entries for Quebec) and the municipal layer surfaced as a follow-up step. The second is the funding dataset: grants, loans and tax credits surfaced as separate instruments with their own eligibility tests, sourced from the adjacent grants-only plan's corpus on a scheduled refresh rather than re-implemented.

The two datasets are surfaced as one workflow in the UI but stored separately, with the linkage enforced at the API layer so a change to one does not corrupt the other. Per-step deadlines and ordering dependencies are surfaced in the workflow render, with the next-step marker visible at all times and a clear separation between the bureaucratic track and the funding track. Portal status is checked by a Sidekiq worker against a fixed set of federal and provincial portal URLs, with results cached in Redis with a TTL matching the check interval, and the status page reads from Redis so a stale portal is visible to the founder before they click the link.

Per-business tracker stages are identified, in progress, submitted, decision and outcome, with the deadline visible at every stage. The funding layer reads from the adjacent grants-only plan's corpus on a scheduled refresh and surfaces staleness explicitly when the refresh is overdue. Bilingual support for Quebec is treated as first-class: French and English string tables are maintained side by side, and the language selector at the top of the workflow sets the row-level language at render time.

## Milestones

1. **M1 — Profile and bureaucratic layer** — Rails app, business profile schema, and the ordered federal-registration workflow as the first dataset.
2. **M2 — Provincial layer** — provincial registrations for the four largest provinces, with bilingual entries for Quebec as the first-class language case.
3. **M3 — Funding layer** — funding dataset sourced from the adjacent grants-only plan's corpus on a scheduled refresh, with staleness surfaced when the refresh is overdue.
4. **M4 — Per-step tracker** — identified-through-outcome stages for both the bureaucratic and funding workflows, with the deadline visible at every stage.
5. **M5 — Portal status page** — Sidekiq-driven federal and provincial portal-status check with a public status page that calls out broken or slow portals.
6. **M6 — Admin source-data editor** — registration and funding corpus edits without a code deploy, with version history and the change timestamp visible per item.
7. **M7 — Stripe billing** — Stripe-backed paid tier with organisation-level access for accountants, bookkeepers and small-business support organisations.

## Risks

- **Two-dataset divergence** — the bureaucratic and funding datasets change on different cadences, and a workflow that conflates them gets stale on the wrong axis; the linkage has to stay at the API layer.
- **Threshold staleness** — a missed CRA threshold or provincial registration requirement ships a wrong workflow to every founder who reads it, and the cost is not just a bug report but a missed filing.
- **Government portal unreliability** — portals go down or change URLs without notice, and the status check must surface that rather than mask it; a silent failure here is the exact failure mode the product is supposed to fix.
- **Bilingual coverage drift** — a workflow translated once and never revisited goes stale in French even while the English stays current, which is worse than no translation at all in Quebec.
- **Cross-corpus staleness** — the funding layer reading from the adjacent plan's corpus introduces a staleness hop that has to be visible to the user, not hidden behind a refresh.
- **Accountant replacement perception** — the product has to keep clear that it lists workflows and tracks steps, not that it files them; the wording on every page reflects that.
