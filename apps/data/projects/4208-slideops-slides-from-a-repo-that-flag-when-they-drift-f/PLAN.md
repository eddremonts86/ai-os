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

## Tech Stack

- Two Agent Skills packaged as `SKILL.md` files (make, ops) under `skills/slideops/`
- Python stdlib only for `scripts/check.py` (no model, no network, no tokens)
- HTML output with one `:root` token block per theme (Ledger Light, Ledger Dark, Midnight, Graphite)
- `color-mix()` for theme swapping
- Mermaid CLI for build-time SVG rendering, themed from the deck's own tokens
- Self-contained HTML output (no CDN, no build step at runtime)
- Optional: React + TypeScript companion site (not required for the core skills)
- Optional: Coolify + Docker for a hosted PDF export tier

## Architecture

The "make" Agent Skill reads the repo, scores candidate topics (with "why now" rationale), and asks the user a compact intake question set. The outline is approved before any HTML is written. The HTML renderer emits one self-contained file with the chosen theme's `:root` block, the 13 slide patterns, keyboard navigation, URL hash deep links, an Esc-toggled overview, and speaker notes. Mermaid diagrams are pre-rendered to inline SVG at build time. The "ops" skill is a stdlib Python script that parses the deck and the repo, matches citations to current code, and reports drift with a suggested fix or a JSON repair brief for an agent.

## Milestones

1. Topic-detection scanner and intake question set
2. Outline approval flow before HTML generation
3. Self-contained HTML renderer with 13 patterns and 4 themes
4. Mermaid → themed SVG at build time
5. `check.py` drift scanner with stdlib only
6. Verified PDF export that round-trips pages back to images
7. Per-agent install paths (Claude Code, Codex, Copilot CLI, OpenCode)

## Risks

- Topic detection from a repo is heuristic; bad topics waste user trust
- Drift detection needs a robust code-citation model under renames and moves
- Agent Skills spec drift across loaders
- Build-time Mermaid → SVG still counts as a build step despite the runtime pitch