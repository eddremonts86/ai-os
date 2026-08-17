---
id: "526"
slug: how-would-you-distribute-a-niche-saas-for-real-estate-i
title: How would you distribute a niche SaaS for real-estate investors?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo2e8u/how_would_you_distribute_a_niche_saas_for/"
category: saas
date: "2026-08-14"
---
# How would you distribute a niche SaaS for real-estate investors?

## Tech Stack

- **Frontend:** Astro on Vercel (single static page).
- **Worksheet:** a hand-built CSV with formulas; no spreadsheet engine.
- **Analytics:** Plausible.

## Architecture

A single static page renders the playbook from a Markdown file in the repo. The worksheet is a downloadable CSV.

```
Browser ─▶ Astro (static HTML + playbook.md)
              │
              └─▶ Plausible
```

## Milestones

1. **M0 — Channel analysis + CAC ranges.** End of week 2.
2. **M1 — 90-day experiment sequence.** End of week 4.
3. **M2 — Worksheet CSV + experiment log template.** End of week 5.

## Risks

- **Channel drift.** Real-estate communities and conferences move; the playbook will go stale. Mitigation: a "last reviewed" date + quarterly audit.
- **CAC uncertainty.** The CAC estimates are the whole product. If they're wrong, the playbook loses trust. Mitigation: every estimate sourced or labeled "estimate, n=X".
