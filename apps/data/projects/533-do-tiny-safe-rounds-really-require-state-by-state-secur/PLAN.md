---
id: "533"
slug: do-tiny-safe-rounds-really-require-state-by-state-secur
title: Do tiny SAFE rounds really require state-by-state securities compliance? I will not promote
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vo0d9v/do_tiny_safe_rounds_really_require_statebystate/"
category: startups
date: "2026-08-14"
---
# Do tiny SAFE rounds really require state-by-state securities compliance? I will not promote

## Tech Stack

- **Frontend:** Astro on Vercel (single static site).
- **Data:** a typed JSON file in the repo with one row per state + a sources array.
- **Decision tree:** vanilla JS in the browser.

## Architecture

Single static site. The decision tree reads from a JSON file in the repo; the table is rendered from the same JSON. No backend.

```
Browser ─▶ Astro (static HTML + states.json + tree.js)
```

## Milestones

1. **M0 — State-by-state table + sources.** End of week 3.
2. **M1 — 5-question decision tree.** End of week 5.
3. **M2 — Lawyer review + disclaimer copy.** End of week 6.
4. **M3 — Affiliate link + disclosure.** End of week 7.

## Risks

- **State law drift.** Blue Sky laws change; the table will go stale. Mitigation: a visible "last verified" date per state + quarterly audit.
- **Misuse as legal advice.** A founder reading this and not consulting a lawyer could be in real trouble. Mitigation: prominent disclaimer + a "find a securities lawyer" footer.
