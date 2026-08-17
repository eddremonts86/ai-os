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

## Phase 0: Scaffold

- [ ] Read the source at `https://www.reddit.com/r/SideProject/comments/1vny4od/every_day_this_site_posts_one_joke_and_one_photo/` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/509-every-day-this-site-posts-one-joke-and-o/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Next.js, TypeScript, PostgreSQL, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: the country stated in the source`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for the country stated in the source.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
- [ ] Author the schema migrations named in PLAN.md and seed at least one realistic fixture for the {country} locale.
## Phase 1: Core

- [ ] Daily content pair
- [ ] Guess / reveal flow
- [ ] Permanent log
- [ ] No-account flow

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js, TypeScript, PostgreSQL) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 509-every-day-this-site-posts-one-joke- MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js, TypeScript, PostgreSQL errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
