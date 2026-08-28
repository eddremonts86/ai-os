---
id: "572"
slug: if-your-saas-resells-model-output-your-margin-is-decide
title: Billing-dimension audit — the unit economics trap when reselling model output
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vobkje/if_your_saas_resells_model_output_your_margin_is/"
  captured: "2026-08-14"
category: finops
date: "2026-08-14"
tags: [ai, saas, pricing, unit-economics, finops]
scores:
  money: 6
  learn: 6
  fun: 5
---
# Billing-dimension audit — the unit economics trap when reselling model output

## Tech Stack

Python CLI; a small set of provider connectors (Replicate, Fal, OpenAI, Anthropic); a SQLite store for invoice line items; a lightweight web UI optional.

## Architecture

Three components: (1) provider pricing-page ingest (manual first), (2) invoice-line scraper (per-provider connector), (3) reconciliation engine that emits cost-per-accepted-output and the dimension that drives it.

## Milestones

M1: ship the CLI with one provider connector. M2: add 2 more providers. M3: ship the web UI. M4: 10 paying teams.

## Risks

Risk: providers rate-limit or block scrapers. Risk: pricing-page scraping triggers ToS concerns. Risk: the 20-minute audit is too short for complex multi-tier pricing.
