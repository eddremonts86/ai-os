---
id: "531"
slug: new-saas-got-good-google-impressions-initially-then
title: "New SaaS got good Google impressions initially, then"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo0r7j/new_saas_got_good_google_impressions_initially/"
category: saas
date: "2026-08-14"
---
# "New SaaS got good Google impressions initially, then"

## Tech Stack

- **Frontend:** Astro on Vercel.
- **Image parsing:** a server-side endpoint that uses an LLM with vision (Anthropic Claude) to extract the chart data from the screenshot.
- **Verdict logic:** rules engine in JS, parameterized by the parsed data.

## Architecture

Single Astro app. Upload goes to a server endpoint, the LLM parses the chart, the rules engine returns a verdict, the response renders in the browser. The image is not persisted.

```
Browser ─▶ Astro (upload + verdict UI)
              │
              └─▶ endpoint ─▶ Claude vision ─▶ rules engine ─▶ verdict JSON
```

## Milestones

1. **M0 — Upload + LLM chart parsing.** End of week 2.
2. **M1 — Rules engine + verdict rendering.** End of week 4.
3. **M2 — Affiliate link + shareable URL.** End of week 5.

## Risks

- **LLM vision accuracy.** Charts in GSC vary by date range and view; parsing errors will mislead. Mitigation: a confidence band on the verdict.
- **Limited training set.** The rules engine is built from a small dataset; verdicts may be wrong on outlier curves. Mitigation: "low confidence" verdict when the curve shape doesn't match any known pattern.
