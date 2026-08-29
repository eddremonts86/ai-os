---
id: "759"
slug: procurement-data-quality-suffers-supplier-contacts-outd
title: "Procurement data quality suffers — supplier contacts outdated, prices stale, history lost. Existing solutions too expensive or don't fix data quality. Need a simple tool for $10/month."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/business/1xuloij3k1-procurement-data-quality-suffers-supplie"
  captured: "2026-03-10"
category: business
date: "2026-03-10"
tags: [Business, Finance, Other]
country: Brazil
wtp:
  raw: $10/month
  currency: USD
  min: 10
  max: 10
  period: month
  mrrMid: 10
tech: [React + Vite, Node.js (Fastify) API, Postgres, scheduled enrichment workers (Node.js cron), CSV / Google Sheets import-export]
---
# Procurement data quality suffers — supplier contacts outdated, prices stale, history lost. Existing solutions too expensive or don't fix data quality. Need a simple tool for $10/month.

## Value Proposition

Small procurement teams running on Excel / Google Sheets lose hours to data verification before every purchase, sometimes overpaying or choosing the wrong supplier because the contact list, the price list, and the negotiation history are all rotting in different files. The tool is a $10/month workspace that holds the supplier database, refreshes contacts and prices on a weekly schedule, and records every negotiation and purchase so the team can answer "what did we pay them last time?" in two clicks — without standing up an enterprise procurement suite.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Small procurement team (1–5 people) | Today runs on Excel / Google Sheets; loses hours before each purchase to manual verification. |
| Founder / ops lead at SMB | Owns purchasing informally; wants a lightweight record without standing up an enterprise tool. |
| Contract procurement consultant | Needs a deployable workspace per client, with export so the client is not locked in. |
| Existing procurement-suite vendor (indirect) | The poster has already rejected them as too expensive or as "digitising without fixing data quality". |

## Jobs To Be Done

1. **Functional job** — Keep supplier contacts and prices current, and keep a searchable history of every negotiation and purchase.
2. **Emotional job** — Stop the "I'm about to call a dead number or pay last year's price" anxiety before each purchase.
3. **Social job** — Be able to hand the supplier database to a new team member and have them be productive in a day, instead of inheriting tribal knowledge from a spreadsheet.

## Success Metrics

- **Activation:** the workspace ingests the existing Excel / Google Sheets file and the team uses the new tool as their primary supplier record within 7 days of import.
- **Enrichment coverage:** ≥ 70% of supplier rows have a `last_verified_on` date within the last 30 days after the enrichment worker has run for two cycles.
- **Time-saved:** median "find a supplier and last paid price" lookup completes in under 30 seconds, down from the multi-minute Excel search the team does today.
- **Data quality signal:** dashboard's "rows with stale data" widget trends down over the first 60 days of use.
- **Retention:** ≥ 80% of workspaces remain subscribed after the third billing cycle (proxy for the data quality holding up).

## Pricing & Monetization

$10/month per workspace, matching the poster's stated budget. The free tier is not advertised in the source; if introduced, it should be a 14-day trial that includes the enrichment worker so the value (data quality) is visible before the paywall. Annual plan at $8/month locked. The $10/month price point is the cap the author named — going above it disqualifies the product for the target buyer.

## Competitive Landscape

- **Enterprise procurement suites (Coupa, Ariba, Jaggaer)** — full RFQ-to-PO workflow, three-way match, ERP connectors; priced for mid-market and up, well above $10/month, and complex to deploy.
- **Affordable SMB procurement tools (Precoro, Procurify, Kissflow Procurement)** — digitise the workflow but do not actually refresh supplier data; the poster explicitly calls this out as the gap.
- **Spreadsheets + Zapier / Make** — what teams cobble together today; works for one-off enrichment but no scheduled refresh, no negotiation / purchase log, no quality dashboard.
- **CRM vendors (HubSpot, Pipedrive with custom objects)** — hold supplier records but not designed for procurement; price-per-seat usually exceeds $10/month for the relevant features.
- **Data broker / enrichment APIs (Clearbit, Apollo, ZoomInfo)** — supplier-side data at scale, but priced per-record and aimed at sales prospecting, not supplier relationship management.

## Risks & Open Questions

- [ ] The $10/month cap is tight. Enrichment workers run scheduled jobs that cost real money (data lookups, scraping, sometimes paid APIs). If the enrichment cost-per-workspace exceeds ~$1/month, the unit economics break and the $10 cap must be raised — which loses the target buyer. The enrichment pipeline must be cost-instrumented from day one.
- [ ] Enrichment correctness: a wrong phone number or a stale website can cost more than the absence of data. The worker must require a confidence threshold and surface auto-updates for human review before they overwrite the displayed value.
- [ ] Brazilian supplier data is uneven across public registries; enrichment quality will be high in some categories (CNPJ lookups via Receita Federal) and poor in others (small vendors with no web presence). The dashboard must reflect "we couldn't verify" honestly rather than fake a confidence score.
- [ ] Migration fear: SMBs that have used the same spreadsheet for years distrust new tools. The import must be one click (upload file, see the mapping, click confirm), and the export must be one click at any time.
- [ ] The poster is offering 1% equity for feedback; treating that as the only customer-development loop in v1 would be a mistake. The MVP needs at least 10 paid workspaces before the loop is informative.
