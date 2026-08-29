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

## Tech Stack

- **Frontend:** React + Vite SPA, single workspace per account, table-first UI with inline edit, dashboard widget for stale data.
- **Backend API:** Node.js (Fastify) + Postgres (Supabase or Neon), exposed behind a single Coolify instance.
- **Import / export:** CSV and Google Sheets importer (read via the Sheets API with a user-supplied share link or uploaded XLSX), CSV exporter available from any view.
- **Enrichment worker:** a Node.js cron (daily, per workspace) that refreshes each supplier row's public-facing data: website scrape for phone / email / address, domain expiry check, Brazilian CNPJ lookup via Receita Federal where applicable. Writes back only if a confidence threshold is met; surfaces the change for human review before overwriting the displayed value.
- **Auth:** email magic link or Google OAuth; single workspace per account in v1.
- **Billing:** Stripe Checkout on the $10/month price; webhook updates the workspace's subscription status.

## Architecture

A single Fastify service hosts the web app and the enrichment worker on the same Node process. The Postgres database holds workspaces, suppliers, enrichment events (with old value, new value, confidence score, and review status), negotiation entries, and purchase entries. The worker is rate-limited per workspace so a 1,000-row supplier table does not crush the public registries it polls; the worst-quality rows are enriched first, since they are the highest-value fixes.

```
Browser ─▶ Fastify (web app + JSON API)
                │
                ├─▶ /import (CSV / XLSX / Google Sheets)
                │
                ├─▶ cron (daily, per workspace)
                │       │
                │       ├─▶ Receita Federal (CNPJ)
                │       ├─▶ website scrape (phone / email)
                │       └─▶ domain expiry
                │                  │
                │                  └─▶ enrichment_events (old, new, confidence)
                │
                ├─▶ /export (CSV, anytime)
                │
                └─▶ Stripe webhook ──▶ Postgres (subscription status)
```

## Milestones

1. **M0 — Spec freeze + data model.** SPEC.md approved; `suppliers`, `negotiations`, `purchases`, `enrichment_events` tables defined. End of week 1.
2. **M1 — Web app shell + import.** React table UI, CSV / XLSX import with field mapping, manual edit + "verified on" date. End of week 3.
3. **M2 — Enrichment worker v1.** Daily cron, CNPJ lookup + website scrape + domain expiry; confidence threshold; auto-update only above threshold; "needs review" surface. End of week 5.
4. **M3 — Negotiation + purchase log.** Two structured logs per supplier with a chronological view and a "what did we pay them last time?" lookup. End of week 6.
5. **M4 — Dashboard widget.** Stale-data widget surfacing rows that haven't been verified in N days, no contact, or no recent price update. End of week 7.
6. **M5 — Stripe + trial.** 14-day free trial, Stripe Checkout on $10/month, workspace status gating. End of week 8.
7. **M6 — Pilot.** 25 paid workspaces onboarded; weekly review of enrichment coverage and dashboard trends. End of week 12.

## Risks

- **$10/month unit economics.** Enrichment workers are not free: a workspace with 500 suppliers runs 500 lookups per cycle, and any paid API (CNPJ enrichment, domain monitoring) costs real money. The enrichment cost-per-workspace must stay under ~$1/month, which means the worker has to be rate-limited, the data sources have to be cheap or free, and the row prioritisation has to favour the worst-quality rows first. If unit economics don't hold, the $10 cap is the wrong product.
- **Enrichment correctness.** A wrong phone number is worse than no phone number. The worker must require a confidence threshold and surface the auto-update for human review before overwriting the displayed value. Without this, the tool silently introduces bad data — the exact failure the poster is paying to fix.
- **Brazilian public-data quality.** CNPJ data via Receita Federal is good; small vendors with no web presence have nothing to enrich. The dashboard must reflect "we couldn't verify" honestly, not fake a confidence score.
- **Migration friction.** SMBs that have used the same spreadsheet for years distrust new tools. The import has to be one click (upload file, see the mapping, click confirm) and the export one click at any time, or adoption stalls in trial.
- **Equity-for-feedback dilution.** The poster is offering 1% equity in exchange for being a reference customer. If the MVP is built around only this loop, the team gets one customer's feedback and ships a product tuned to one spreadsheet. The MVP needs at least 10 paid workspaces before the customer-development signal is informative.
