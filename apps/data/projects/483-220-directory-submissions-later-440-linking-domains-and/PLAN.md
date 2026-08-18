---
id: "483"
slug: "220-directory-submissions-later-440-linking-domains-and"
title: "220 directory submissions later: 440 linking domains and DR 54"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1vfcwbx/220_directory_submissions_later_440_linking/"
category: indiehackers
date: "2026-08-04"
tech: [Next.js, TypeScript, PostgreSQL, Stripe, Resend, Vercel]
---
# 220 directory submissions later: 440 linking domains and DR 54

## Tech Stack

- **Next.js** — chosen for this plan because of how it fits the problem in `https://www.reddit.com/r/indiehackers/comments/1vfcwbx/220_directory_submissions`, not because the rest of the monorepo uses it. If a future contributor proposes a migration to the 'global default', they must justify it against this specific problem.
- **TypeScript** — chosen for this plan because of how it fits the problem in `https://www.reddit.com/r/indiehackers/comments/1vfcwbx/220_directory_submissions`, not because the rest of the monorepo uses it. If a future contributor proposes a migration to the 'global default', they must justify it against this specific problem.
- **PostgreSQL** — chosen for this plan because of how it fits the problem in `https://www.reddit.com/r/indiehackers/comments/1vfcwbx/220_directory_submissions`, not because the rest of the monorepo uses it. If a future contributor proposes a migration to the 'global default', they must justify it against this specific problem.
- **Stripe** — chosen for this plan because of how it fits the problem in `https://www.reddit.com/r/indiehackers/comments/1vfcwbx/220_directory_submissions`, not because the rest of the monorepo uses it. If a future contributor proposes a migration to the 'global default', they must justify it against this specific problem.
- **Resend** — chosen for this plan because of how it fits the problem in `https://www.reddit.com/r/indiehackers/comments/1vfcwbx/220_directory_submissions`, not because the rest of the monorepo uses it. If a future contributor proposes a migration to the 'global default', they must justify it against this specific problem.
- **Vercel** — chosen for this plan because of how it fits the problem in `https://www.reddit.com/r/indiehackers/comments/1vfcwbx/220_directory_submissions`, not because the rest of the monorepo uses it. If a future contributor proposes a migration to the 'global default', they must justify it against this specific problem.

## Architecture

Next.js; Postgres for directories + submissions + outcomes; Stripe for premium analytics; Resend for digest; Vercel.

## Milestones

- Directory database
- Submission tracker
- Outcome data per directory
- Stripe premium analytics

## Risks

- Outcome data freshness
- Directory quality variance
