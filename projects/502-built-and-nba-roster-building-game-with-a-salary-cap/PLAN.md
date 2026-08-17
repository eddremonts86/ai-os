---
id: "502"
slug: built-and-nba-roster-building-game-with-a-salary-cap
title: Built and NBA roster building game with a salary cap
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SideProject/comments/1vnyun5/built_and_nba_roster_building_game_with_a_salary/"
category: sideproject
date: "2026-08-14"
tech: [Next.js, TypeScript, PostgreSQL, Resend, Vercel]
---
# Built and NBA roster building game with a salary cap

## Tech Stack

- **Next.js** — chosen for this plan because of how it fits the problem in `https://www.reddit.com/r/SideProject/comments/1vnyun5/built_and_nba_roster_build`, not because the rest of the monorepo uses it. If a future contributor proposes a migration to the 'global default', they must justify it against this specific problem.
- **TypeScript** — chosen for this plan because of how it fits the problem in `https://www.reddit.com/r/SideProject/comments/1vnyun5/built_and_nba_roster_build`, not because the rest of the monorepo uses it. If a future contributor proposes a migration to the 'global default', they must justify it against this specific problem.
- **PostgreSQL** — chosen for this plan because of how it fits the problem in `https://www.reddit.com/r/SideProject/comments/1vnyun5/built_and_nba_roster_build`, not because the rest of the monorepo uses it. If a future contributor proposes a migration to the 'global default', they must justify it against this specific problem.
- **Resend** — chosen for this plan because of how it fits the problem in `https://www.reddit.com/r/SideProject/comments/1vnyun5/built_and_nba_roster_build`, not because the rest of the monorepo uses it. If a future contributor proposes a migration to the 'global default', they must justify it against this specific problem.
- **Vercel** — chosen for this plan because of how it fits the problem in `https://www.reddit.com/r/SideProject/comments/1vnyun5/built_and_nba_roster_build`, not because the rest of the monorepo uses it. If a future contributor proposes a migration to the 'global default', they must justify it against this specific problem.

## Architecture

Next.js; PostgreSQL for players + caps + lineups; Resend for share / digest; Vercel.

## Milestones

- Player database with historical salaries
- Cap engine (soft, luxury tax, first apron, second apron)
- Lineup builder
- Share / challenge flow

## Risks

- Salary-data accuracy
- UI complexity
