---
id: "438"
slug: modern-job-hunting
title: Modern job hunting
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo0nvl/modern_job_hunting/"
category: saas
date: "2026-08-14"
tech: [Next.js, TypeScript, PostgreSQL, Resend, Vercel]
---
# Modern job hunting

## Tech Stack

- **Next.js** — chosen for this plan because of how it fits the problem in `https://www.reddit.com/r/SaaS/comments/1vo0nvl/modern_job_hunting/`, not because the rest of the monorepo uses it. If a future contributor proposes a migration to the 'global default', they must justify it against this specific problem.
- **TypeScript** — chosen for this plan because of how it fits the problem in `https://www.reddit.com/r/SaaS/comments/1vo0nvl/modern_job_hunting/`, not because the rest of the monorepo uses it. If a future contributor proposes a migration to the 'global default', they must justify it against this specific problem.
- **PostgreSQL** — chosen for this plan because of how it fits the problem in `https://www.reddit.com/r/SaaS/comments/1vo0nvl/modern_job_hunting/`, not because the rest of the monorepo uses it. If a future contributor proposes a migration to the 'global default', they must justify it against this specific problem.
- **Resend** — chosen for this plan because of how it fits the problem in `https://www.reddit.com/r/SaaS/comments/1vo0nvl/modern_job_hunting/`, not because the rest of the monorepo uses it. If a future contributor proposes a migration to the 'global default', they must justify it against this specific problem.
- **Vercel** — chosen for this plan because of how it fits the problem in `https://www.reddit.com/r/SaaS/comments/1vo0nvl/modern_job_hunting/`, not because the rest of the monorepo uses it. If a future contributor proposes a migration to the 'global default', they must justify it against this specific problem.

## Architecture

Next.js; Postgres for applications and signal-feed posts; Resend for reminders; Vercel.

## Milestones

- Tracker schema and UI
- Public signal feed (moderated)
- Reminders for stale applications
- Public methodology page listing signal-feed sources

## Risks

- Signal-feed sourcing must remain traceable
- Reminder cadence risk annoying users
