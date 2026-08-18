---
id: "206"
slug: a-designer-needs-an-ai-agent-to-eliminate-the-manual-dr
title: A designer needs an AI agent to eliminate the manual drudgery of adapting designs for mobile and tablet breakpoints.
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/"
category: design
date: "2026-04-20"
tags: [Design, AI, Productivity]
country: Estonia
tech: [Figma Plugin API, TypeScript, Anthropic Claude API, PostgreSQL, Next.js]
---
# A designer needs an AI agent to eliminate the manual drudgery of adapting designs for mobile and tablet breakpoints.

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/206-a-designer-needs-an-ai-agent-to-eliminat/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Figma Plugin API, TypeScript, Anthropic Claude API, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Estonia`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Estonia.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
- [ ] Author the schema migrations named in PLAN.md and seed at least one realistic fixture for the {country} locale.
## Phase 1: Core

- [ ] Figma plugin skeleton with read access
- [ ] Design-system ingest (components, tokens, variants)
- [ ] Per-section decision logic for mobile portrait
- [ ] Tablet portrait variant generation
- [ ] Review-and-approve UI per variant
- [ ] Settings persistence per project
- [ ] Re-run from settings
- [ ] End-to-end test on 10 real Figma files
- [ ] First 20 design teams in private beta

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Figma Plugin API, TypeScript, Anthropic Claude API) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 206-a-designer-needs-an-ai-agent-to-eli MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Estonia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Figma Plugin API, TypeScript, Anthropic Claude API errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
