---
id: "527"
slug: i-built-an-app-for-4-months-launched-in-1-week-ago-0-us
title: "I built an app for 4 months, launched in 1 week ago. 0 users, super polished and proven demand."
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo28x9/i_built_an_app_for_4_months_launched_in_1_week/"
category: saas
date: "2026-08-14"
---
# "I built an app for 4 months, launched in 1 week ago. 0 users, super polished and proven demand."

## Tech Stack

- **Frontend:** Astro on Vercel.
- **Intake + diagnosis:** vanilla JS in the browser; the diagnosis rules live in a JSON file.
- **Daily check-in:** a small Astro endpoint that posts to Postgres.
- **Email:** Resend for the daily check-in reminder.

## Architecture

A single Astro app hosts the intake, the diagnosis report, and the daily check-in form. The diagnosis rules are a JSON file in the repo; updates are content edits, not code changes.

```
Browser ─▶ Astro (intake + diagnosis + check-in)
              │
              ├─▶ Postgres (intakes, daily check-ins)
              │
              └─▶ Resend (daily reminder)
```

## Milestones

1. **M0 — Intake + diagnosis JSON.** End of week 2.
2. **M1 — 14-day experiment plan generator.** End of week 4.
3. **M2 — Daily check-in + reminder.** End of week 5.

## Risks

- **Diagnosis generality.** The rules are the whole product. If they don't match real launches, the tool loses trust. Mitigation: validate against 30 real launches before launch.
- **Founder follow-through.** Most founders abandon a 14-day plan by day 5. Mitigation: the daily reminder + streak counter is the only retention mechanic; keep it light.
