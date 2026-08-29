---
id: "3624"
slug: auditai-automate-ai-visibility-tracking-and-seo-ranking
title: AuditAI – Automate AI visibility tracking and SEO ranking
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/auditai?utm_campaign=startup-180574&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-28"
tags: [BetaList, Beta, Product]
tech: [Python, Playwright, TimescaleDB on PostgreSQL, Celery with Redis, SvelteKit, residential proxy pool]
---
# AuditAI – Automate AI visibility tracking and SEO ranking

## Phase 0: Scaffold

- [x] Read the BetaList listing and identify the rank-versus-AI comparison as the load-bearing claim
- [ ] Write down the access path for each of the four AI platforms and the risk attached to each
- [ ] Decide the minimum sample count before the product may state a trend, and where that rule is enforced
- [ ] TimescaleDB schema: site, competitor, keyword, run, response, observation, rank, alert
- [ ] Hypertable and retention policy for `response`, with the retention window written down and priced
- [ ] Celery queues partitioned per platform, each with its own rate limit, retry policy and failure recording
- [ ] Playwright runner image with the residential proxy pool wired and a stated location per query
- [ ] Build the human-labelling harness for mention detection before building the detector
- [ ] Define brand-alias handling and the collision rule for brand names that are ordinary words

## Phase 1: Core

- [ ] ChatGPT collector: response text plus cited sources, stored raw, adapter-isolated
- [ ] Claude collector, same contract, own rate limit
- [ ] Perplexity collector, same contract, capturing its citations explicitly
- [ ] Google AI Overview collector via Playwright, storing the rendered artefact
- [ ] Google rank collector with an explicit location recorded on every result
- [ ] Failure recording: every non-completing check writes a run row with a reason, never nothing
- [ ] Mention detector: own domain cited, own brand named, competitor domain cited, competitor brand named
- [ ] Detector versioning plus re-run over stored history, so an improvement does not invalidate the archive
- [ ] Labelled evaluation: 300+ responses per platform, precision and recall recorded per detector version
- [ ] Weekly scheduler fanning out the full keyword times platform set with no user action
- [ ] Per-keyword timeline view: mention rate over samples, per platform, gaps shown as gaps
- [ ] The comparison query and view: ranks on Google, zero mention rate on a platform, ordered by position
- [ ] Evidence link on every mention cell, opening the stored raw response with the matched span highlighted
- [ ] Alerts: mention gained, mention lost, competitor appeared, each referencing the bracketing responses
- [ ] Combined export: one file with AI mentions and Google rank per keyword per week
- [ ] Status surface showing per-platform collector health, since access fragility is a customer-facing fact

## Phase 2: Deploy

- [ ] Run four consecutive unattended weekly cycles and publish completeness per platform
- [ ] Force a platform outage in staging and confirm the timeline shows a gap with no interpolation
- [ ] Publish mention-detection precision and recall alongside the charts they support
- [ ] Verify storage growth against the retention policy at realistic keyword volume before onboarding agencies
- [ ] Onboard the first sites with at least one competitor each, so the competitor path is exercised from week one
- [ ] Week 12 review: detection precision, run completeness, trend depth per keyword, gap-list action rate
