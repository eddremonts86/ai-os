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

## Value Proposition

Generate a deck from a repo in minutes, then run a stdlib-only Python check that flags every slide that has drifted from the code, so the deck ages with the codebase instead of against it.

## Target Users

- Developer advocates who give talks about their own libraries
- Library authors writing docs as a slide deck
- Engineering teams giving internal tech talks
- Anyone who has a slide deck they keep forgetting to update

## Jobs To Be Done

- When I want a deck, I want an Agent Skill that scans the repo and proposes a topic so I do not start from a blank slide
- When I approve the outline, I want one self-contained HTML file I can email or open offline
- When the code changes, I want a stdlib-only script that tells me which slides need a rewrite so I do not run a stale deck

## Success Metrics

- Median deck generation under 5 minutes from "make slides about this repo" to first usable HTML
- `check.py` runs in milliseconds across a 100-slide deck
- 1,000+ GitHub stars in the first quarter

## Pricing & Monetization

MIT; free. Optional commercial support or a hosted PDF export tier is plausible but not on the source page.

## Competitive Landscape

- Marp, reveal.js, Slidev — open-source deck frameworks; no repo-grounded generation
- Pitch, Beautiful.ai, Gamma — closed SaaS; no drift checking
- Hand-edited Markdown decks — go stale, no check
- Docs-as-code tools (Docusaurus, VitePress) — different surface, no slide model

## Risks & Open Questions

- Topic detection from a repo is heuristic; edge cases will produce bad topics
- Drift checking needs a code-citation model that survives renames and moves
- Agent Skills spec is still evolving; loaders may diverge
- Mermaid → SVG at build time adds a build step despite the "no build step" pitch