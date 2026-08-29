---
id: "3746"
slug: fake-negative-reviews-from-people-who-were-never-custom
title: "Fake negative reviews from people who were never customers are appearing on Google Business. Extortionists offer to remove them for money. Google won't help. Need a real solution"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/business/bgkxok2tu1-fake-negative-reviews-from-people-who-we"
category: business
date: "2026-08-29"
tags: [Business, Security, Marketing, Other]
country: USA
wtp: "unspecified (extortion pain implies SMB WTP)"
tech: [TypeScript, Node.js API, SQLite + Drizzle ORM, Coolify + Docker]
---

# Fake negative reviews from people who were never customers are appearing on Google Business. Extortionists offer to remove them for money. Google won't help. Need a real solution

> Brief derived from the source post. No facts added beyond what the post asserts.

## Value Proposition

Stop extortionists before they finish the loop. A daily risk score, a documented takedown package, and a habit of acting on suspicious reviews within hours instead of weeks.

## Target Users

| Stakeholder | Why they care |
|---|---|
| SMB owner | Their listing is the channel customers use. Fake reviews and extortion are a direct revenue risk. |
| Marketing agency | Their clients pay them partly to keep listings clean; an evidence package is a deliverable. |
| Reputation consultant | Evidence packages shorten the consultant's billable hours and make takedown arguments stronger. |

## Jobs To Be Done

1. **Functional job** — when a fake review appears, the owner wants a documented evidence package to send to Google.
2. **Emotional job** — the owner wants to feel they are responding, not ignoring, the extortion threat.
3. **Social job** — customers browsing the listing should not see the extortion incident; the owner wants the listing to look defended.

## Success Metrics

- **Activation:** % of new customers who connect a Google Business Profile within 7 days of signup.
- **Retention:** weekly digest open rate over the first month.
- **Revenue:** MRR target unstated by the post; priced per location per month.

## Competitive Landscape

- Google Business Profile (free, native): what the SMB already has; baseline.
- Birdeye / Podium / Reputation.com: full-suite reputation platforms with much larger surface area and higher per-location pricing.
- Manual workflow (Google support form + a Gmail draft): the do-it-yourself alternative the poster is currently using.

## Risks & Open Questions

- Google Business Profile API access is gated; a real MVP needs an approved OAuth client.
- Google's takedown process is opaque and the MVP cannot promise outcomes.
- Reviewer-profile data is limited; non-customer signals are heuristics, not proof.
- Legal exposure if the platform flags a real customer as fake.
