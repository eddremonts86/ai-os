---
id: "473"
slug: i-made-a-free-list-of-100-places-where-you-can-promote-
title: i made a free list of 100 places where you can promote your app
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1vi5ui8/i_made_a_free_list_of_100_places_where_you_can/"
category: indiehackers
date: "2026-08-07"
tech: [Next.js, TypeScript, PostgreSQL, Resend, Vercel]
---
# i made a free list of 100 places where you can promote your app

## Tech Stack

- **Next.js** — chosen for this plan because of how it fits the problem in `https://www.reddit.com/r/indiehackers/comments/1vi5ui8/i_made_a_free_list_of_100`, not because the rest of the monorepo uses it. If a future contributor proposes a migration to the 'global default', they must justify it against this specific problem.
- **TypeScript** — chosen for this plan because of how it fits the problem in `https://www.reddit.com/r/indiehackers/comments/1vi5ui8/i_made_a_free_list_of_100`, not because the rest of the monorepo uses it. If a future contributor proposes a migration to the 'global default', they must justify it against this specific problem.
- **PostgreSQL** — chosen for this plan because of how it fits the problem in `https://www.reddit.com/r/indiehackers/comments/1vi5ui8/i_made_a_free_list_of_100`, not because the rest of the monorepo uses it. If a future contributor proposes a migration to the 'global default', they must justify it against this specific problem.
- **Resend** — chosen for this plan because of how it fits the problem in `https://www.reddit.com/r/indiehackers/comments/1vi5ui8/i_made_a_free_list_of_100`, not because the rest of the monorepo uses it. If a future contributor proposes a migration to the 'global default', they must justify it against this specific problem.
- **Vercel** — chosen for this plan because of how it fits the problem in `https://www.reddit.com/r/indiehackers/comments/1vi5ui8/i_made_a_free_list_of_100`, not because the rest of the monorepo uses it. If a future contributor proposes a migration to the 'global default', they must justify it against this specific problem.

## Architecture

Next.js; Postgres for channels + submission tracker; Resend for weekly digest; Vercel.

## Milestones

- Channel database
- Filter UI (category / audience / effort)
- Submission tracker
- Weekly digest

## Risks

- Channel data freshness
- Submission-rules updates
