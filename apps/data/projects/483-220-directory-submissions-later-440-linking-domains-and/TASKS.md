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

## Phase 0: Scaffold

- [ ] Read the source at `https://www.reddit.com/r/indiehackers/comments/1vfcwbx/220_directory_submissions_later_440_linking/` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/483-220-directory-submissions-later-440-link/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Next.js, TypeScript, PostgreSQL, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: the country stated in the source`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for the country stated in the source.
- [ ] Wire Stripe (or the regional PSP for {country}) in test mode and document the price model in PRODUCT.md.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
## Phase 1: Core

- [ ] Directory database
- [ ] Submission tracker
- [ ] Outcome data
- [ ] Stripe premium

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js, TypeScript, PostgreSQL) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 483-220-directory-submissions-later-440 MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js, TypeScript, PostgreSQL errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
