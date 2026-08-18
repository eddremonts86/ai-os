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

## Tech Stack

- Tilda Zero Blocks API + custom JS
- Postgres
- Static-site rebuild via Vite + Lit
- Component library in Web Components
- Storybook

Why this stack: each technology was chosen for this specific problem (the rationale is in the per-section prose). No global default stack is inherited from other plans.

## Architecture

The MVP for dev runs as a single backend service on the stack (Tilda Zero Blocks API + custom JS, Postgres, Static-site rebuild via Vite + Lit) with a thin client (web or mobile depending on the chosen deployment). Ingestion from the source post — captured at `https://problemhunt.pro/en/dev/91cnbgco21-lack-of-reusable-components-and-centra` — feeds the problem statement and any captured body. From there, the read/write API serves a single dashboard view for the primary user in Russia, backed by an append-only audit log so each change can be traced back to a user action.

Components:

- **Edge / client** — serves the user surface and owns the auth handshake.
- **API** — single service exposing typed endpoints; no microservices in v1.
- **Persistence** — relational store (Tilda Zero Blocks API + custom JS, Postgres, Static-site rebuild via Vite + Lit) with a migration log.
- **Background jobs** — used only for the source-body fetch and a daily metric rollup; nothing time-critical.
- **Outbound** — limited to the chosen payment processor and a transactional email side; no third-party trackers.

For Russia, data residency and payment routing follow the source post's locale (see `https://problemhunt.pro/en/dev/91cnbgco21-lack-of-reusable-components-and-centra`).

## Milestones

M1 — Foundations (weeks 1–2): scaffold the app folder (`364-lack-of-reusable-components-and-cen`), pin dependencies for Tilda Zero Blocks API + custom JS, Postgres, Static-site rebuild via Vite + Lit, and confirm CI on the chosen target. The schema from PLAN.md is in place and the auth path is end-to-end against a sandbox.

M2 — Source-faithful MVP (weeks 3–5): implement the smallest slice that solves the problem stated in `https://problemhunt.pro/en/dev/91cnbgco21-lack-of-reusable-components-and-centra` with no feature creep. A single user from Russia can complete the core flow without hand-holding. WTP is not yet wired (only if the source post stated one — see SPEC.md).

M3 — Tightening (weeks 6–7): observability (logs + error tracking), data-residency config for Russia, and the security review per the constraints in SPEC.md.

M4 — Pilot (weeks 8–10): 5–10 users from Russia test the MVP and give feedback on the exact task the source post described. No marketing, no growth work, only the stated problem.

M5 — Decide (week 11): either commit to a v2 based on pilot signal, or shelve with a written post-mortem.

## Risks

- **Tilda DOM evolution.** Tilda updates its Zero Block DOM structures; component compatibility must be re-tested with each Tilda release and bumped in semver.
- **Lock-in.** Some users will treat the library as 'their stack'; the v1 license is permissive, and a future option to fork is in scope.
- **Migration fatigue.** A wholesale migration of an existing Tilda project is several days; the migration tool proposes swaps one section at a time, not in a single pass.
