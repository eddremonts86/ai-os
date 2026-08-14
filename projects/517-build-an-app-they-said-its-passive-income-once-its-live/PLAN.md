---
id: "517"
slug: build-an-app-they-said-its-passive-income-once-its-live
title: Build an app they said it’s Passive income once it’s live.
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo45xx/build_an_app_they_said_its_passive_income_once/"
category: saas
date: "2026-08-14"
---
# Build an app they said it’s Passive income once it’s live.

## Tech Stack

- **Frontend:** Astro on Vercel, with a small client-side calculator.
- **Benchmarks dataset:** a JSON file in the repo, sourced from a 50-founder survey (or attributed estimates).
- **Shareable URL:** URL-encoded state in the query string.
- **Mailing list:** Buttondown (free tier).

## Architecture

Single static page. The calculator is pure JavaScript; the shareable URL is just the inputs encoded into the query string so any visitor with the same URL sees the same result.

```
Browser ─▶ Astro (static HTML + calculator.js + benchmarks.json)
              │
              └─▶ URL state (encoded inputs) → shareable result
```

## Milestones

1. **M0 — Calculator with placeholder benchmarks.** End of week 1.
2. **M1 — Survey + benchmarks published.** End of week 3.
3. **M2 — Shareable URL + mailing list opt-in.** End of week 4.

## Risks

- **Benchmark credibility.** If the benchmarks are wrong or perceived as made-up, the entire tool loses trust. Mitigation: every benchmark linked to a source or labeled "estimate, n=X".
- **Defensive founders.** People don't like being told their app is a job. Mitigation: framing as "calibrate expectations", not judgment.
