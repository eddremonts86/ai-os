---
id: "516"
slug: best-mor-provider-out-there
title: Best MoR provider out there?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo4cmj/best_mor_provider_out_there/"
category: saas
date: "2026-08-14"
---
# Best MoR provider out there?

## Tech Stack

- **Frontend:** Astro on Vercel (single static page with client-side filtering).
- **Data:** a typed JSON file in the repo, updated by hand whenever a provider changes pricing/features.
- **Filter widget:** a few lines of vanilla JS (no React, no framework runtime).
- **Analytics:** Plausible (privacy-friendly, no cookie banner).

## Architecture

A single Astro page renders the comparison table from a typed JSON dataset. The filter widget is a small client-side script that toggles a `data-*` attribute per row. There is no backend.

```
Browser ─▶ Astro (static HTML + JSON dataset)
              │
              └─▶ client-side filter (vanilla JS)
                                            │
                                            └─▶ Plausible (analytics)
```

## Milestones

1. **M0 — Static page with the five MoRs and 8 columns.** End of week 1.
2. **M1 — Filter widget.** End of week 2.
3. **M2 — Decision flowcharts for 3 common cases.** End of week 3.
4. **M3 — Affiliate links wired + disclosure.** End of week 4.

## Risks

- **Stale pricing.** MoRs change fee structures quietly; the page could mislead within 6 months. Mitigation: a visible "last updated" date and a quarterly review cron.
- **Bias perception.** Even with honest content, a "comparison" page implies the author has a favorite. Mitigation: explicit disclosure + a "missing data" badge on any cell the author couldn't verify.
