---
id: "436"
slug: what-problem-makes-you-think-omfg-this-sucks-there-must
title: What problem makes you think Omfg this sucks there must be a better way? (I will not promote)
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vm5qbw/what_problem_makes_you_think_omfg_this_sucks/"
category: startups
date: "2026-08-12"
tech: [Next.js, TypeScript, PostgreSQL, Resend, Vercel]
---
# What problem makes you think Omfg this sucks there must be a better way? (I will not promote)

## Tech Stack

- **Next.js** — chosen for this plan because of how it fits the problem in `https://www.reddit.com/r/startups/comments/1vm5qbw/what_problem_makes_you_think_`, not because the rest of the monorepo uses it. If a future contributor proposes a migration to the 'global default', they must justify it against this specific problem.
- **TypeScript** — chosen for this plan because of how it fits the problem in `https://www.reddit.com/r/startups/comments/1vm5qbw/what_problem_makes_you_think_`, not because the rest of the monorepo uses it. If a future contributor proposes a migration to the 'global default', they must justify it against this specific problem.
- **PostgreSQL** — chosen for this plan because of how it fits the problem in `https://www.reddit.com/r/startups/comments/1vm5qbw/what_problem_makes_you_think_`, not because the rest of the monorepo uses it. If a future contributor proposes a migration to the 'global default', they must justify it against this specific problem.
- **Resend** — chosen for this plan because of how it fits the problem in `https://www.reddit.com/r/startups/comments/1vm5qbw/what_problem_makes_you_think_`, not because the rest of the monorepo uses it. If a future contributor proposes a migration to the 'global default', they must justify it against this specific problem.
- **Vercel** — chosen for this plan because of how it fits the problem in `https://www.reddit.com/r/startups/comments/1vm5qbw/what_problem_makes_you_think_`, not because the rest of the monorepo uses it. If a future contributor proposes a migration to the 'global default', they must justify it against this specific problem.

## Architecture

Next.js; Postgres for problem entries with source URL; Resend for moderator notifications; Vercel.

## Milestones

- Problem-entry schema with original-source URL required
- Search + filter UI (industry, role, frequency)
- Moderation queue for solution ideas
- Public methodology page listing inclusion / exclusion criteria

## Risks

- Source URL rot is a constant risk; archive.org fallback planned
- Moderator bandwidth
