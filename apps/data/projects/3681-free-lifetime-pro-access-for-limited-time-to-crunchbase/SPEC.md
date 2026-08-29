---
id: "3681"
slug: free-lifetime-pro-access-for-limited-time-to-crunchbase
title: Free lifetime pro access for limited time to crunchbase alternative
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49485867"
  captured: "2026-08-29"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Next.js, Postgres with pgvector, Python ingestion workers, Meilisearch, Cloudflare R2, Stripe]
---
# Free lifetime pro access for limited time to crunchbase alternative

## Problem

Startup research data sits behind subscriptions that price out the people who need it most. StartupWiki, posted to Show HN by `skiski`, positions itself as a Crunchbase alternative: a community-driven, AI-powered research directory of global startup ventures with profiles across AI and machine learning, biotech and life sciences, cleantech and climate, fintech, cybersecurity, and quantum computing, carrying funding data, financial metrics, competitive analysis, and team insights. To get past the cold-start problem that kills every directory — no data means no visitors, and no visitors means nobody contributes data — the team is giving away free lifetime Pro subscriptions for a limited time, and the announcement post of 2026-08-26 grandfathers those accounts into Pro features added later. The Show HN thread itself sat at 1 point with no comments when captured, so the giveaway is the whole distribution strategy on display, not a validated demand signal.

## Objective

Ship a startup research directory whose per-company profiles are assembled by AI from public sources rather than a sales-gated database, and use time-boxed lifetime Pro grants to seed both the contributor base and the first cohort of retained users — with the grandfathering promise honoured in the entitlement model from day one rather than bolted on later.

## Target Users

- Primary: founders, indie analysts and early-stage operators who need funding and competitor data on deep-tech companies but will not pay Crunchbase's seat price, and who are willing to be an early user in exchange for permanent Pro access.
- Secondary: contributors to the community-driven side — people close to a specific niche (quantum computing, cleantech) who can correct or extend a profile the AI drafted, and who get Pro standing as the reward for it.

## MVP Scope

- Category-first browse: the sector taxonomy the launch already advertises (AI and machine learning, fintech, biotech and life sciences, cybersecurity, cleantech and climate, quantum computing), each listing its companies.
- Company profile page assembled from public sources: description, sector, funding rounds, headline financial metrics, named competitors, team.
- Free versus Pro split: which profile fields, exports and search filters are gated, expressed as entitlements rather than hardcoded checks, because lifetime grants must survive every later change to the Pro tier.
- Lifetime-grant issuance: a redeemable code path that stamps an account as `lifetime_pro` with the grandfathering flag set, plus a hard cap on how many grants the campaign can mint.
- Contribution path: suggest-an-edit on any profile field, queued for review, with attribution back to the contributor.
- A blog surface, since the giveaway announcement is itself the launch's main landing page.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Every fact on a profile must be traceable to the public source it came from. An AI-assembled directory that cannot show provenance for a funding number is worse than no directory, because the reader has no way to check it.
- Lifetime Pro is unrevocable revenue foregone. The grant count has to be capped and the unit cost of serving a Pro account known before the campaign runs, or the giveaway that solved the cold start becomes a permanent margin hole.
- Grandfathering into future Pro features is a promise made in public. It constrains the pricing model permanently: no Pro feature may be structured as a separate paid add-on that lifetime holders are excluded from.
- Sector coverage is the credibility test. A directory advertising quantum computing and cleantech with three companies in each reads as vapour; depth in fewer sectors beats a thin taxonomy.
- No Crunchbase or PitchBook data may be re-hosted. The ingestion pipeline is limited to sources whose terms permit derived profiles.
