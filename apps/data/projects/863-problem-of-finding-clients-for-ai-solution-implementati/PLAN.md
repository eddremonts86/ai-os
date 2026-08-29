---
id: "863"
slug: problem-of-finding-clients-for-ai-solution-implementati
title: Problem of finding clients for AI solution implementation in Europe and Eastern Europe
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/ab9rnnoja1-problem-of-finding-clients-for-ai-soluti"
category: ai
date: "2025-10-29"
tags: [AI, Marketing, Business, Other]
country: UK
tech: [Go, chi, PostgreSQL, pgvector, Redis, Stripe, Tauri]
---
# Problem of finding clients for AI solution implementation in Europe and Eastern Europe

## Tech Stack

- **Go with chi** for the API layer because the workload is per-account signal processing and CSV export, where Go's concurrency model and small memory footprint matter more than framework breadth.
- **PostgreSQL with pgvector** for the structured buyer data plus an embedding store, since some fit scoring benefits from a vector lookup against a buyer-account embedding rather than a hand-tuned rule.
- **Redis** for the signal-cache layer and the per-account short-lived scraping queue, because the signal work is naturally short-lived and idempotent at the buyer level.
- **Stripe** for the paid tier because the product has a clear free-versus-paid boundary keyed to account caps, and Stripe handles the billing shape without ceremony.
- **Tauri** for the desktop builder-side UI because some builders want to run the buyer list locally against a private copy of the signal cache, and Tauri keeps that path small.

## Architecture

A builder submits a profile: sector, outcome, reference customers, delivery geography and target buyer-side markets. The API ranks mid-market buyer companies against the profile using a combination of rule-based filters (sector, headcount band, geography) and an embedding lookup against pgvector for the outcome-to-buyer similarity. The output is a per-market scored list of accounts with the contact-path hint, the language preference and the public signals that put each account in-market.

Public signals are collected by a scheduled scraper pipeline: job boards, press releases, public RFP feeds, company-registries and funding-event sources. Each signal is keyed to the buyer account and timestamped, so the buyer list can sort by signal freshness and the freshness target is a first-class config rather than an accident of source speed. Per-builder calibration runs against the outreach log the builder maintains, which is the only honest ground truth for the fit score, and the calibration job recomputes the score per builder on a configurable cadence.

Outreach is the builder's job. The export is a CSV with the buyer account, the contact-path hint, the language preference and the signal references, and the product stops there. Tauri-based local clients consume the same API and let the builder hold a private copy of the signal cache, which is the path for buyers who do not want their buyer list sitting in someone else's database.

## Milestones

1. **M1 — Profile and rule-based ranking** — Go API, builder profile, rule-based filters, and the scored UK buyer list as the first market.
2. **M2 — Public signal ingestion** — scheduled scraper pipeline for job boards, press and public RFP feeds, with per-account timestamped signal storage.
3. **M3 — pgvector fit score** — embedding-based outcome-to-buyer similarity layered on top of the rule-based score, with a per-builder weight slider.
4. **M4 — EU and Eastern Europe** — buyer lists for at least three Western European and three Eastern European markets, with per-market language and procurement-norm hints.
5. **M5 — Outreach log and calibration** — builder-facing outreach log and the calibration job that recomputes the fit score against observed conversions.
6. **M6 — CSV export and Tauri client** — CSV export and the Tauri-based desktop client that runs against the same API with a private signal cache.
7. **M7 — Stripe billing** — Stripe-backed paid tier with the account-cap boundary and the multi-user access for studios.

## Risks

- **Public-source unreliability** — scrapers against job boards and RFP feeds break when the source changes layout; the freshness target has to degrade visibly rather than silently.
- **Fit-score false confidence** — a heuristic that is sold as a prediction of conversion is a liability; the product wording has to keep the score as a heuristic and the conversion as the builder's observed truth.
- **Eastern European coverage gaps** — some markets have weaker public-source coverage and a buyer list that looks full but is actually thin; the source-coverage metadata has to be visible per market.
- **Privacy boundary slip** — public signals are public but the buyer-side expectation of being approached varies by market; the contact-path label has to reflect that, not just the channel.
- **Calibration overfit** — a per-builder calibration that learns from one builder's outbound motion may not generalise, so the calibration surface has to stay narrow.
- **Closed-loop temptation** — the obvious next feature is sending the outreach; the product has to refuse that, or it becomes the very closed-loop engagement tool it was scoped against.
