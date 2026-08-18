---
id: "364"
slug: lack-of-reusable-components-and-centralized-styling-in-
title: Lack of reusable components and centralized styling in Tilda
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/dev/91cnbgco21-lack-of-reusable-components-and-centrali"
category: dev
date: "2025-10-29"
tags: [Dev, No-Code, Design]
country: Russia
tech: [Tilda Zero Blocks API + custom JS, Postgres, Static-site rebuild via Vite + Lit, Component library in Web Components, Storybook]
---
# Lack of reusable components and centralized styling in Tilda

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/en/dev/91cnbgco21-lack-of-reusable-components-and-centrali` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/364-lack-of-reusable-components-and-centrali/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Tilda Zero Blocks API + custom JS, Postgres, Static-site rebuild via Vite + Lit, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Russia`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Russia.
- [ ] Author the schema migrations named in PLAN.md and seed at least one realistic fixture for the {country} locale.
## Phase 1: Core

- [ ] Web Components library: header, footer, CTA, card, pricing, FAQ, testimonial, news-card
- [ ] Design tokens exported as CSS variables and as Tilda class hooks
- [ ] Migration tool: scan exported Tilda HTML, identify candidate blocks, propose swap
- [ ] Storybook view of the library with RU copy tokens
- [ ] Compatibility mode: Tilda editor continues to edit non-component pages
- [ ] Semver releases with documented breaking changes
- [ ] Pilot with 3 Russian agencies (20 Tilda projects total) over 60 days

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Tilda Zero Blocks API + custom JS, Postgres, Static-site rebuild via Vite + Lit) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 364-lack-of-reusable-components-and-cen MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Russia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Tilda Zero Blocks API + custom JS, Postgres, Static-site rebuild via Vite + Lit errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
