---
id: "362"
slug: automated-tool-for-link-checking-and-stylistic-editing
title: Automated tool for link checking and stylistic editing
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/media/gvks1brdf1-automated-tool-for-link-checking-and-sty"
category: media
date: "2025-10-29"
tags: [Media]
country: Russia
tech: [Next.js, Node.js (link crawler), OpenAI API (style pass), Postgres, Browser extension (Manifest V3)]
---
# Automated tool for link checking and stylistic editing

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/en/media/gvks1brdf1-automated-tool-for-link-checking-and-sty` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/362-automated-tool-for-link-checking-and-sty/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Next.js, Node.js (link crawler), OpenAI API (style pass), and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Russia`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Russia.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
## Phase 1: Core

- [ ] Article input: paste / upload Markdown, HTML, or pull from WP/Tilda CMS
- [ ] Link checker: HTTP probe + status + 30-day cache; broken links surfaced
- [ ] Stylistic edit per publication-specific style guide
- [ ] Diff view: every change proposed as a diff
- [ ] Browser-extension overlay (Manifest V3) on Tilda/WordPress editor
- [ ] Weekly sweep on existing articles; alert on new rot
- [ ] Pilot with 5 Russian digital publications across 60 days; time-saved measured

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js, Node.js (link crawler), OpenAI API (style pass)) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 362-automated-tool-for-link-checking-an MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Russia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js, Node.js (link crawler), OpenAI API (style pass) errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
