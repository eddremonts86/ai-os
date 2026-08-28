---
id: "530"
slug: free-way-to-actually-see-videos-of-the-errors-your-saas
title: Free way to actually see videos of the errors your SaaS users are running into
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo1r5j/free_way_to_actually_see_videos_of_the_errors/"
category: saas
date: "2026-08-14"
---
# Free way to actually see videos of the errors your SaaS users are running into

## Tech Stack

- **Frontend:** Astro on Vercel (single static site).
- **Content:** Markdown files in the repo (the guide + query templates).
- **Analytics:** Plausible (privacy-friendly, no cookie banner).

## Architecture

Single static site. The guide is Markdown; the PostHog query templates are fenced code blocks. No backend.

```
Browser ─▶ Astro (static HTML + guide.md + templates.md)
              │
              └─▶ Plausible
```

## Milestones

1. **M0 — Setup guide written.** End of week 1.
2. **M1 — PostHog query templates + screenshots.** End of week 2.
3. **M2 — Affiliate link + disclosure.** End of week 3.

## Risks

- **PostHog UI drift.** PostHog changes its UI; screenshots go stale. Mitigation: a "last reviewed" date + quarterly audit.
- **Free tier limits.** PostHog free tier quotas change. Mitigation: explicit note on the page about current quotas, last-verified date.
