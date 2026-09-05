---
id: "4208"
slug: slideops-slides-from-a-repo-that-flag-when-they-drift-f
title: "SlideOps – slides from a repo that flag when they drift from the code"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49508735"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# SlideOps – slides from a repo that flag when they drift from the code

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4208-slideops-slides-from-a-repo-that-flag-when-they-drift-f/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] "make" Agent Skill with repo scanner, topic candidates, intake questions, and outline approval
- [ ] Self-contained HTML renderer with 13 patterns and 4 themes via `:root` + `color-mix()`
- [ ] Keyboard navigation, URL hash deep links, Esc overview, N for speaker notes
- [ ] Mermaid → themed SVG at build time
- [ ] `check.py` stdlib-only drift scanner
- [ ] Verified PDF export with round-trip page-to-image check
- [ ] Per-agent install paths for Claude Code, Codex, Copilot CLI, OpenCode
- [ ] Worked example: `skills/slideops/examples/skill-demo.md`

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Publish skills to each agent marketplace
- [ ] Optional: hosted PDF export on Coolify
- [ ] Verify in production