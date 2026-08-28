---
id: "803"
slug: uk-property-investors-have-nowhere-to-quickly-and-relia
title: "UK property investors have nowhere to quickly and reliably assess refurbishment costs and find verified contractors, leading to weeks of delays and financial risks."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/business/pu341olhc1-uk-property-investors-have-nowhere-to-qu"
  captured: "2026-01-03"
category: business
date: "2026-01-03"
tags: [Business, Other]
country: UK
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# UK property investors have nowhere to quickly and reliably assess refurbishment costs and find verified contractors, leading to weeks of delays and financial risks.

## Tech Stack

- **Frontend:** React with TypeScript, single-page app served from Coolify.
- **Backend API:** Node.js (TanStack Start) handling estimator input, cost-range calculation, and contractor shortlist queries.
- **Database:** SQLite via Drizzle ORM (file-based, fits the Coolify + Docker one-VPS model).
- **Cost reference data:** Versioned JSON of BCIS average rates + regional adjustment factors + UK trade-rate bands, checked on each deploy, edited in a Git repo so the change history is auditable.
- **Trade-credential lookup:** Periodic batch against the public NICEIC / Gas Safe / FMB find-a-trade pages, cached for 30 days.
- **Hosting:** Coolify on a single Hetzner CX22 (or equivalent), Docker Compose for app + reverse proxy.

## Architecture

```
Browser ─▶ TanStack Start (SSR + route handlers)
              │
              ├─▶ SQLite (Drizzle) — estimator runs, saved properties, contractor shortlists
              │
              ├─▶ Cost reference service — versioned JSON (BCIS + regional + trade bands)
              │
              └─▶ Trade-credential cache — NICEIC / Gas Safe / FMB public lookups, 30-day TTL
```

The estimator is a pure function of (property-specs, cost-reference-data) so it can be re-derived offline. The contractor shortlist is a SQL query joining the contractor profile table against the cached credential set + the prior-investor rating table.

## Milestones

1. **M0 — Reference data v1.** Authored JSON for property types + 12 UK regions + 8 trade categories. End of week 2.
2. **M1 — Estimator.** Property-spec input form, low/mid/high range output with calculation breakdown. End of week 5.
3. **M2 — Contractor shortlist.** Trade + region filter, credential badges, prior-job ratings. End of week 8.
4. **M3 — RFQ handoff.** Estimator output → contractor request-for-quote template, sent to a single contractor or all shortlisted. End of week 11.
5. **M4 — Saved deals + billing.** Saved properties, £29 and £99 Stripe plans wired. End of week 14.
6. **M5 — Credential refresh cadence.** Quarterly trade-body lookup refresh; signed-off PRs into the credential cache repo. Ongoing.

## Risks

- **Cost-reference drift** — a stale BCIS number or regional factor makes the estimate wrong by a meaningful margin. Mitigation: signed-off PRs and a "last reviewed" timestamp on every line item.
- **Trade-credential spoofing** — a contractor uploads a fake NICEIC number. Mitigation: batch verification against the public lookup pages, never trust self-uploaded credentials alone.
- **Regional coverage holes** — first 12 regions leave 75% of UK postcodes uncovered. Mitigation: rank-order by investor deal-flow volume and add regions on demand, not by full national coverage promise.
- **Investor/spec mismatch** — the estimator is only as good as the investor's condition grading. Mitigation: a "show me what each grade looks like" reference gallery on the input form.
