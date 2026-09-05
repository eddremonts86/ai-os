---
id: "4169"
slug: manner-developers-create-ai-clones-that-clients-can-hir
title: Manner – Developers create AI clones that clients can hire
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49511046"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Manner – Developers create AI clones that clients can hire

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4169-manner-developers-create-ai-clones-that-clients-can-hir/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the developer-onboarding flow: capture the developer's judgment, communication, standards, and approach into a clone configuration the platform can host, with a per-developer surface for the clone's owner.
- [ ] Build the marketplace listing: each clone carries the developer's name, experience, stack, and track record, with a browse surface and a filter by stack/experience/track record.
- [ ] Build the paste-repo setup: read the client's project, prepare a sandbox environment, and hand the project off to the coding agent with a real place to build and verify changes.
- [ ] Build the per-task container runtime: each task runs in its own container, sealed off from every other project, with the build-and-health-check step before any change is applied.
- [ ] Build the live-preview orchestrator: the result runs at a real URL before it reaches production, with the preview's data sandboxing (production-shaped, anonymised, or fixture data) documented on the per-task delivery surface.
- [ ] Build the developer review-control gate: per-task gate, per-clone default-on, diff-review and sign-off surface, gate-bypass log surfaced on the listing.
- [ ] Build the automatic-rollback path: retry a broken change once, then restore the last known-good state from a snapshot the platform keeps, and verify the restored state with the build-and-health-check step before declaring success.
- [ ] Build the per-task delivery surface: the client reads the prompt, plan, code, tests, preview, and applied change end-to-end, with the actual wall-clock time alongside the reference timing.
- [ ] Publish the three reference timings as benchmarks (TS migration ~35 min, test coverage ~25 min, third-party API ~20 min), not as a contractual SLA, with the per-task delivery surface exposing the actual wall-clock time.
- [ ] Document the marketplace ranking algorithm's inputs (track record, stack match, developer review rate, client satisfaction) and surface paid placement as a separate signal, not a ranking input.
- [ ] Run an end-to-end test: a developer onboards with a clone configuration, a client hires the clone from the marketplace, pastes a repo, asks for a 150-file TypeScript migration, the per-task container runs sealed off, the build-and-health-check passes, the live preview shows the migrated code, the developer review-control gate fires, and the automatic-rollback path is exercised on a deliberately-broken follow-up change.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Document the per-clone configuration format and the marketplace listing format so a developer can reason about what the platform captures
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-31_
