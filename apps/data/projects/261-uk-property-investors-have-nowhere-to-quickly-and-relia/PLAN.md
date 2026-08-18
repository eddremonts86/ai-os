---
id: "261"
slug: uk-property-investors-have-nowhere-to-quickly-and-relia
title: "UK property investors have nowhere to quickly and reliably assess refurbishment costs and find verified contractors, leading to weeks of delays and financial risks."
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/business/pu341olhc1-uk-property-investors-have-nowhere-to-qu"
category: business
date: "2026-01-03"
tags: [Business, Other]
country: UK
---
# UK property investors have nowhere to quickly and reliably assess refurbishment costs and find verified contractors, leading to weeks of delays and financial risks.

## Tech Stack

- Python 3.11 + FastAPI for the API; the work is cost-model computation, postcode → regional labour-rate lookup, and PDF report generation; Python's data + templating ecosystem is the strongest fit.
- PostgreSQL for property intake records, estimates, contractor profiles, and verification status.
- A JSON-defined cost model: each scope (kitchen, bathroom, redecoration, light refurb) has a base cost per item, a regional labour-rate factor by postcode prefix, and a finish-level multiplier. The model is rule-based, not ML.
- A small contractor panel database: contractor profiles, verification status, prior-engagement references, completed-similar-jobs evidence.
- ReportLab (or WeasyPrint) for the investor-side PDF report (estimate + shortlist).
- Self-hosted on Coolify; the workload is per-estimate, low-throughput, and predictable.

## Architecture

Three pieces:

1. **Intake + estimate engine** — property intake form; cost model returns an itemised estimate with a low / mid / high band; estimate stored with the property's address, scope, and finish level.
2. **Contractor panel** — verified contractor profiles, indexed by region and scope; each profile carries verification status, references, and prior-engagement evidence.
3. **Report generator** — produces the investor-side PDF: property summary, itemised estimate with band, contractor shortlist with verification badges and references.

The MVP does not run site visits, manage contracts, or hold escrow.

## Milestones

- **M1 — Cost model.** Vetted cost model for the four pilot scopes; regional labour-rate lookup by postcode prefix.
- **M2 — Intake + estimate.** Property intake form; cost model returns an itemised estimate with low / mid / high band.
- **M3 — Contractor panel.** 20–40 verified contractors across the first two pilot regions (e.g., Greater Manchester and West Midlands); each profile carries verification status, references, and prior-engagement evidence.
- **M4 — Report generator.** PDF report with property summary, itemised estimate, and contractor shortlist.
- **M5 — Estimate-to-completion accuracy audit.** After 50 estimates, measure how often the contractor's final invoice lands inside the mid band; publish the rate honestly.

## Risks

- Estimate honesty is the product's credibility test. A low / mid / high band is the only honest output for a refurbishment; a single number is a fiction. The MVP must publish the band, not a point estimate.
- Regional labour-rate variation is real. The MVP must use the postcode to set a regional factor; a single UK-wide rate is dishonest.
- Verification must reflect real reference calls. A star rating the platform invents is a marketing surface, not a verification signal. The MVP must keep verification cost-bounded so the panel does not collapse under its own overhead.
- Scope coverage is finite. The MVP is honest about which scopes it covers; it must not pretend to estimate structural work, extensions, or new builds.
- Cold-start: contractors do not join a panel with zero investors; investors do not pay for an estimate against an empty panel. The MVP needs a seed of 20–40 verified contractors in two regions to break in.
