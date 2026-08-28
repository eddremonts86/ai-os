---
id: "585"
slug: what-would-you-do
title: Anti-exploitation job board and ATS auto-fill browser extension
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vojiuh/what_would_you_do/"
  captured: "2026-08-14"
category: jobs
date: "2026-08-14"
tags: [jobs, ats, browser-extension, b2c, job-board, mission-driven]
scores:
  money: 3
  learn: 5
  fun: 4
---
# Anti-exploitation job board and ATS auto-fill browser extension

## Tech Stack

The source does not specify a stack. A modern job-board + browser-extension combination would typically be a public-facing web app (Next.js or similar) backed by a Postgres job-posting store and a search index for the listings, plus a Manifest V3 browser extension that injects the auto-fill script into the ATS pages the user visits. The anti-scam signal (spam-job-poster labelling, perma-hide companies) is a per-user preference store keyed to the user's account.

## Architecture

Two surfaces: the public job board (server-rendered listings, search, the spam-labelling feedback loop) and the browser extension (auto-fill at the ATS, the per-user blacklists). The shared state is the job-posting store and the per-user label/hide lists. The author's "spam-job-poster" labelling is a feedback loop — labels move threads into a regulated view, and trust decays over time when a labelled poster keeps posting.

## Milestones

M1: lock the ATS auto-fill surface area: pick the 3 ATSs the source implies (LinkedIn, Indeed, Glassdoor pages) and ship reliable auto-fill for those. M2: ship the spam-labelling and perma-hide features as a browser-extension overlay. M3: stand up a job-board front-end that reads from the same posting store. M4: choose a GTM path that does not depend on the sponsored-listing model the source explicitly rejects.

## Risks

Risk: the most plausible GTM (sponsored listings) is the exact model the author is criticising, and the source does not propose a replacement. Risk: the author is solo and has zero marketing budget — the bottleneck is distribution, not engineering. Risk: the ATS auto-fill breaks every time the ATS changes its DOM, which is a perpetual maintenance burden. Risk: the "spam-job-poster" label is a moderation problem the author has to staff. Source lacked: a country, a price, a sales channel, and any active-user number.
