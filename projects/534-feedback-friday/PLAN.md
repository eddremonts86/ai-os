---
id: "534"
slug: feedback-friday
title: Feedback Friday
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vnxu7u/feedback_friday/"
category: startups
date: "2026-08-14"
---
# Feedback Friday

## Tech Stack

- **Frontend:** Astro on Vercel.
- **Backend:** Astro endpoints + Postgres for threads, critiques, thanks.
- **Email:** Resend for the weekly thread digest + post-receipt notifications.

## Architecture

Single Astro app. Weekly thread is auto-created by a cron on Friday morning. Critiques and thanks post to Postgres. The scoreboard is a read-only Astro page.

```
Browser ─▶ Astro (thread + critique + scoreboard)
              │
              ├─▶ Postgres (threads, critiques, thanks)
              │
              └─▶ Weekly cron ─▶ new thread + Resend digest
```

## Milestones

1. **M0 — Thread + critique forms.** End of week 2.
2. **M1 — Critique templates + thanks button.** End of week 4.
3. **M2 — Scoreboard + weekly digest.** End of week 6.

## Risks

- **Low critique density.** If critiques don't come in within 48 hours, the founder gives up. Mitigation: a small seed group of 10 regular critics recruited before launch.
- **Quality drift.** Without moderation, critiques will degrade into "looks great!". Mitigation: the templates enforce a minimum length + a required "what I'd change" field.
