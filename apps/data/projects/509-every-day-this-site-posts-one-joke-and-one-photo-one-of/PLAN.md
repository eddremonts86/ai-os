---
id: "509"
slug: every-day-this-site-posts-one-joke-and-one-photo-one-of
title: Every day this site posts one joke and one photo. One of each is AI. You guess.
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SideProject/comments/1vny4od/every_day_this_site_posts_one_joke_and_one_photo/"
category: sideproject
date: "2026-08-14"
tech: [Next.js, TypeScript, PostgreSQL, Resend, Vercel]
---
# Every day this site posts one joke and one photo. One of each is AI. You guess.

## Tech Stack

- **Next.js** — chosen for this plan because of how it fits the problem in `https://www.reddit.com/r/SideProject/comments/1vny4od/every_day_this_site_posts_`, not because the rest of the monorepo uses it. If a future contributor proposes a migration to the 'global default', they must justify it against this specific problem.
- **TypeScript** — chosen for this plan because of how it fits the problem in `https://www.reddit.com/r/SideProject/comments/1vny4od/every_day_this_site_posts_`, not because the rest of the monorepo uses it. If a future contributor proposes a migration to the 'global default', they must justify it against this specific problem.
- **PostgreSQL** — chosen for this plan because of how it fits the problem in `https://www.reddit.com/r/SideProject/comments/1vny4od/every_day_this_site_posts_`, not because the rest of the monorepo uses it. If a future contributor proposes a migration to the 'global default', they must justify it against this specific problem.
- **Resend** — chosen for this plan because of how it fits the problem in `https://www.reddit.com/r/SideProject/comments/1vny4od/every_day_this_site_posts_`, not because the rest of the monorepo uses it. If a future contributor proposes a migration to the 'global default', they must justify it against this specific problem.
- **Vercel** — chosen for this plan because of how it fits the problem in `https://www.reddit.com/r/SideProject/comments/1vny4od/every_day_this_site_posts_`, not because the rest of the monorepo uses it. If a future contributor proposes a migration to the 'global default', they must justify it against this specific problem.

## Architecture

Next.js; PostgreSQL for daily content + answers; Resend for daily reminder; Vercel.

## Milestones

- Daily joke + photo pair
- Public guess / reveal
- Permanent answer log
- No-account flow

## Risks

- Content pipeline freshness
- AI vs human balance
