---
id: "884"
slug: looking-for-interested-buyers-for-export-of-dehydrated-
title: Looking for interested buyers for export of dehydrated products from India
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/p158tshc81-looking-for-interested-buyers-for-export"
  captured: "2025-10-25"
category: marketing
date: "2025-10-25"
tags: [Marketing, Business]
country: India
wtp:
  raw: percentage of successfully closed deals (partnership model)
  currency: USD
  min: 0
  max: 0
  period: one-shot
  mrrMid: 0
tech: [Next.js, TypeScript, Python (FastAPI), PostgreSQL, HubSpot + Apollo.io + LinkedIn Sales Navigator]
---
# Looking for interested buyers for export of dehydrated products from India

## Tech Stack

- **Front-end:** Next.js (App Router) for the exporter workspace and the public marketing surface.
- **API + lead-generation engine:** Python with FastAPI; orchestrates trade-data APIs (un Comtrade, optional ImportGenius / Panjiva), enrichment APIs (Apollo.io, optional LinkedIn Sales Navigator), and the lead-ranking model.
- **Persistence:** PostgreSQL for product profiles, lead records, outreach logs, deal records; Redis for the outreach-rate-limit and the lead-generation-job queue.
- **Outbound email:** SES or Postmark with per-exporter sending identity, DKIM/SPF/DMARC aligned, per-region unsubscribe handling.
- **CRM sync:** HubSpot bidirectional sync for accounts that already run their sales motion there; the platform's deal record is the system of record and HubSpot is downstream.
- **Invoicing:** Stripe with a per-deal Invoice Item, percentage-based on the recorded deal value, invoice generated automatically on deal confirmation.
- **Auth:** email-link + optional Google OAuth for the importer-side opt-in surface (phase 2).

## Architecture

```
Browser ─▶ Next.js (exporter workspace + importer opt-in)
                │
                ├──▶ /api/profiles/* ──▶ Postgres
                │
                ├──▶ /api/leads/*  ──▶ lead-generation engine (Python)
                │                          │
                │                          ├─▶ trade-data APIs
                │                          ├─▶ enrichment APIs
                │                          └─▶ lead-ranking model
                │
                ├──▶ /api/outreach/* ──▶ SES / Postmark
                │                          │
                │                          └─▶ outreach log
                │
                └──▶ /api/deals/*  ──▶ Postgres
                                          │
                                          └─▶ Stripe invoice (success fee)
```

The lead-generation engine is the asset. The trade-data and enrichment APIs are inputs; the ranking model is the differentiator. The deal record is the second asset — every closed deal that flows through the platform feeds back into the ranking model as positive signal for the next query.

## Milestones

1. **M0 — Profile + lead list.** Product-profile intake, lead-generation engine for dehydrated powders (commodity-specific), trade-data + enrichment integration, ranked list with confidence per contact. End of week 4.
2. **M1 — Outreach workspace.** First-touch template editor with merge tags, per-region unsubscribe handling, reply logging, lead-status tagging. End of week 7.
3. **M2 — Deal tracking + invoicing.** Closed-deal record, percentage-based Stripe invoice on confirmation, deal-record → ranking-model feedback loop. End of week 10.
4. **M3 — HubSpot bidirectional sync.** Sync contacts and deal records; the platform remains the system of record. End of week 12.
5. **M4 — Second commodity.** Onboard a second commodity (e.g., dried spices) and validate that the lead-generation engine generalizes without a per-commodity rewrite. End of week 18.
6. **M5 — Importer opt-in surface (phase 2).** Public importer-side page where distributors in target countries opt-in to receive exporter offers. End of week 24.
7. **M6 — Pilot cohort.** 20 active exporters across 2 commodities, 100 closed deals, published success-fee economics per commodity. End of week 32.

## Risks

- **Success-fee-only model and off-platform closes.** An exporter who closes a deal outside the platform can avoid the fee. The deal-tracking surface has to be the path of least resistance — the place where the exporter already is during the close — not a tax that pushes them offline.
- **Lead-generation cost vs. success-fee band.** Trade-data APIs and enrichment APIs are both expensive. The unit economics at 3–8% of deal value close only if the average closed-deal value is large enough and the lead-generation cost per closed deal is small enough. M0 must publish per-commodity cost-per-closed-deal before M3 fixes the fee band.
- **Trade-data redistribution terms.** Some trade-data sources restrict how their data can be surfaced or stored. The lead-generation engine must respect each source's terms and surface aggregated insights, not raw records. A cease-and-desist from one provider could shut down the engine.
- **Cold-outreach deliverability.** SES or Postmark sending domains warm up over weeks. A new exporter who sends 200 first-touch emails on day one will burn the domain. The platform must rate-limit per-exporter, per-domain, and per-IP, and surface a warm-up plan in the workspace.
- **Importer-side opt-in dilution.** If the importer-side surface never reaches critical mass, the platform is permanently one-sided. Phase 2's importer-side launch must publish a target (number of opted-in importers per country) and the path to it; if the path is not credible, the platform's long-term value is capped at outbound-only.
