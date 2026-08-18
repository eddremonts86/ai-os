---
id: "300"
slug: problem-of-product-selection-and-production-capacity-pl
title: Problem of product selection and production capacity planning
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/business/cbc7zd9891-problem-of-product-selection-and-product"
category: business
date: "2025-11-13"
tags: [Business, Manufacturing, Other]
country: India
tech: [Python (FastAPI), Next.js 14, Postgres + TimescaleDB, Prophet forecasting, WhatsApp Business API, Razorpay]
---
# Problem of product selection and production capacity planning

## Tech Stack

- Python (FastAPI) for the planning engine.
- Next.js 14 (App Router) for the operator console and weekly review UI.
- Postgres + TimescaleDB on Hetzner for time-series order history.
- Prophet (Facebook) for demand forecasting with festival overlays.
- PuLP or OR-Tools for capacity-constraint optimisation.
- WhatsApp Business Cloud API for weekly digest delivery.
- Razorpay for INR subscriptions.

## Architecture

FastAPI ingests order history (CSV, WhatsApp forwards parsed by an LLM, or Tally/Zoho export). A Prophet-based forecasting pipeline produces per-SKU demand for the next 4 weeks with Indian-festival calibration. A constraint solver allocates available machine-hours across SKUs to maximise expected margin subject to demand. The recommendation + reasoning is rendered to a WhatsApp template message and to the operator console.

## Milestones

1. **M0** — Spec freeze, single-plant MVP with CSV ingest and weekly WhatsApp digest. End of week 1.
2. **M1** — Demand forecast per SKU + festival calibration. End of week 4.
3. **M2** — Capacity-constraint solver with per-plant onboarding wizard. End of week 7.
4. **M3** — Tally / Zoho Books integration (Plant tier). End of week 10.
5. **M4** — Pilot with 20 plants in Tirupur + Surat + Ludhiana. End of week 14.

## Risks

- **Forecast accuracy on small histories** — Mitigation: industry-association priors + conservative confidence bands; explicit override flow.
- **Capacity-model fidelity** — Mitigation: per-plant onboarding wizard with manual override; recommendation shows the constraint that was binding.
- **WhatsApp template approval** — Mitigation: utility-template wording tested with Meta; backup email digest in parallel.
