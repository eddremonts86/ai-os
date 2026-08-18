---
id: "328"
slug: need-a-simple-alternative-to-meta-ads-after-andromeda-u
title: Need a simple alternative to Meta Ads after Andromeda update
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/8xk7k4gx31-need-a-simple-alternative-to-meta-ads-af"
category: marketing
date: "2025-10-29"
tags: [Marketing]
country: USA
tech: [Meta Marketing API, Google Ads API, TikTok Ads API, Postgres on Fly.io, Plausible Analytics]
---
# Need a simple alternative to Meta Ads after Andromeda update

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/en/marketing/8xk7k4gx31-need-a-simple-alternative-to-meta-ads-af` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/328-need-a-simple-alternative-to-meta-ads-af/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Meta Marketing API, Google Ads API, TikTok Ads API, and confirm versions resolve in CI.
- [ ] Author the schema migrations named in PLAN.md and seed at least one realistic fixture for the {country} locale.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: USA`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for USA.
## Phase 1: Core

- [ ] OAuth flow for Meta Marketing API, Google Ads API, TikTok Ads API (one account each, sandbox mode)
- [ ] Brief form: objective, audience, daily budget cap, creative upload
- [ ] Creative variant generator: image -> square + vertical; video -> 9:16 + 1:1; headline + primary text fields
- [ ] Campaign create endpoint per platform with shared budget pacer (15-min tick)
- [ ] Reporting endpoint: daily rollup of spend, impressions, CTR, CPC, CPA across connected platforms
- [ ] CSV export of per-platform daily metrics for the last 90 days
- [ ] End-to-end test: signup -> connect 3 platforms -> launch one campaign per platform -> verify metrics ingest within 24 hours

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Meta Marketing API, Google Ads API, TikTok Ads API) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 328-need-a-simple-alternative-to-meta-a MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in USA completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Meta Marketing API, Google Ads API, TikTok Ads API errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
