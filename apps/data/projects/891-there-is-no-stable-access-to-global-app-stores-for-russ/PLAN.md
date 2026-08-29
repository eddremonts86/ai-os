---
id: "891"
slug: there-is-no-stable-access-to-global-app-stores-for-russ
title: There is no stable access to global app stores for Russian developers
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/legal/jg3la3g2k1-there-is-no-stable-access-to-global-app"
  captured: "2025-10-16"
category: legal
date: "2025-10-16"
tags: [Legal]
country: Russia
wtp:
  raw: "10,000 RUB ($110) per year"
  currency: USD
  min: 110
  max: 110
  period: year
  mrrMid: 9.17
tech: [Case-law knowledge base with vector search, Django backend, Celery task queue for review monitoring, Store Connect and Play Console API polling, Document workflow engine, Postgres]
---
# There is no stable access to global app stores for Russian developers

## Tech Stack

- **Case knowledge base with vector search:** the product's asset is documented removals and what resolved them. Notices are prose, so matching a new notice to comparable past cases is a semantic-search problem.
- **Django:** the workflow is forms, documents, deadlines and audit trail — a domain Django's admin and permissions handle without invention, which matters when a case record may be referenced in an appeal months later.
- **Celery:** review-state monitoring runs as scheduled background jobs, so a team learns of a change when the store makes it rather than when their updates stop.
- **Store Connect and Play Console API polling:** the only mechanical signal available about listing and review status.
- **Postgres:** case records, timelines and outcomes, retained because the historical record is what makes the next diagnosis better.
- **Document workflow engine:** appeals need specific documents in a specific order, which is exactly the ready-made scheme the author says does not exist.

## Architecture

A case is the unit. It opens when monitoring detects a status change or a team pastes in a notice. The decoder matches the notice against the case base and returns candidate policies with the corrective actions that resolved similar cases, each linked to the case it came from — so the output is precedent, not an assertion. From there the case follows a document workflow: what to prepare, in what order, with what deadline. Every case closes with a recorded outcome, which feeds back into the base.

The monetisation question is handled differently and deliberately kept separate, because it is not a workflow problem. It is documentation of the corporate options, including the offshore-entity structure a commenter described, plus referral to qualified counsel. Presenting it as a feature the subscription delivers would be a lie about what software can do to a platform's jurisdiction rules.

## Milestones

1. **M0 — Honest scope.** Write down what the product can and cannot promise. The author asked for guaranteed resolution of suspensions; the product can shorten and clarify, not guarantee. Everything downstream depends on that line being drawn first. End of week 1.
2. **M1 — Case base seed.** Collect and structure documented removal-and-resolution cases from real teams. Without a corpus there is no diagnosis. End of week 6.
3. **M2 — Notice decoder.** Paste a notice, get candidate policies plus precedent-linked corrective steps. End of week 8.
4. **M3 — Monitoring.** Store Connect and Play Console polling with alerts on status change. End of week 10.
5. **M4 — Appeal workflow.** Ordered document checklist and deadline tracking per case type. End of week 12.
6. **M5 — Monetisation guidance.** Documented corporate routes with counsel referral, reviewed by a lawyer before publication. End of week 16.

## Risks

- **The headline ask cannot be delivered.** The author wants guaranteed resolution of suspensions and the ability to monetise in the App Store. Neither is in any vendor's gift. The product is worth building only if it is sold as faster diagnosis and a documented process, and mis-selling it here would be the most damaging thing available.
- **The monetisation block is likely jurisdictional.** If Apple blocks monetisation for Russian developers as a policy matter, the remedy is corporate restructuring — the commenter's non-Russian-UBO route — which is legal work, priced far above $110 per year.
- **No corpus, no product.** The diagnosis depends on documented cases from other teams. Removals are commercially sensitive and teams may not share them, in which case the decoder degrades into restating public policy text, which the author can already read.
- **Compliance exposure of the service itself.** Advising developers in a sanctioned jurisdiction on offshore structures is not a neutral act. This needs legal review before any guidance ships.
- **Low revenue against high-touch expectations.** $110 per year per team funds a knowledge product. The problem, as described, invites per-case help, and that gap will show up as support load rather than as revenue.
