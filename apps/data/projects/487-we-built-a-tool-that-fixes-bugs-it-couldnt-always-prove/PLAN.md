---
id: "487"
slug: we-built-a-tool-that-fixes-bugs-it-couldnt-always-prove
title: "We built a tool that fixes bugs. It couldn't always prove it."
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1ve51dd/we_built_a_tool_that_fixes_bugs_it_couldnt_always/"
category: indiehackers
date: "2026-08-03"
tech: [TypeScript, Node.js (Fastify), Playwright, PostgreSQL, Redis, Docker, Hetzner]
---
# We built a tool that fixes bugs. It couldn't always prove it.

## Tech Stack

Chosen for this problem:

- TypeScript
- Node.js (Fastify)
- Playwright
- PostgreSQL
- Redis
- Docker
- Hetzner

## Architecture

TypeScript orchestrator; Fastify control API; Playwright for repro generation; PostgreSQL for runs + scorecards; Redis for ephemeral state; Docker for ephemeral workers; Hetzner.

## Milestones

- Bug ingestion + repro script (when available)
- Auto-repro generator
- Apply-fix + verify loop
- Scorecard per fix

## Risks

- Auto-repro accuracy
- False positive rate
