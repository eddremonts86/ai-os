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

## Problem

Most slide decks about code go stale within weeks because the deck and the codebase live in different worlds and nothing checks whether they still agree. The poster's repo (glukicov/slideops) ships a pair of Agent Skills for Claude Code, Codex, Copilot CLI, and OpenCode. The "make" skill scans the repo, asks one compact set of questions (topic — with concrete candidates it found, audience, length, theme, extras), and produces an outline to approve before writing any HTML. The "ops" skill is `scripts/check.py`, a stdlib-only Python script that sweeps `docs/slides/` and reports which slides cite code that has changed, moved, or vanished since the deck was built, with a suggested fix or a JSON repair brief for an agent. Decks are one self-contained HTML file (no build step, no CDN, works offline, attaches to email). Navigation: arrow keys, click-to-advance, URL hash deep links, Esc-toggled overview grid, speaker notes on N. 13 slide patterns and four themes (Ledger Light, Ledger Dark, Midnight, Graphite), all derived from one `:root` token block via `color-mix()`. Mermaid diagrams are pre-rendered to inline SVG and themed from the deck's own tokens.

## Objective

Generate a deck from a repo in minutes, then ask later — cheaply, with no model or network — whether the deck still matches the code, so the slides stop going stale.

## Target Users

- Developer advocates who give talks about their own libraries
- Library authors writing docs as a slide deck
- Engineering teams giving internal tech talks
- Anyone who has a slide deck they keep forgetting to update

## MVP Scope

- "make" Agent Skill that scans the repo, asks intake questions, produces an HTML deck
- "ops" `check.py` script that flags drift between deck and code
- One self-contained HTML file per deck (offline, no CDN)
- Navigation: arrows, click, URL hash, Esc overview, N for speaker notes
- 13 slide patterns and 4 themes via `:root` tokens
- Mermaid → themed inline SVG at build time

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- MIT licence; commercial use permitted
- `check.py` is stdlib-only Python (no model, no network, no tokens)
- One HTML file per deck, no build step, no CDN
- Themes swap by replacing one `:root` block
- Agent Skills spec — loadable from Claude Code, Codex, Copilot CLI, OpenCode