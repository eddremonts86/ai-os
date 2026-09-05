---
id: "4179"
slug: license-detector-the-fastest-most-accurate-license-dete
title: "License Detector – the fastest, most accurate license detection tool"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49510297"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# License Detector – the fastest, most accurate license detection tool

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

License Detector identifies every license across 21 language ecosystems in a single pass, ~80x faster than licensee and matching or beating askalono and scancode-toolkit on accuracy, with a free web app for public repos and a free CLI for everyone.

**One-liner:** Detect every license across 21 ecosystems in seconds, with a free CLI and GitHub App.

## Target Users

Compliance teams, security teams, and engineering teams at companies that ship multi-language software. Adjacent: open-source maintainers who want a clean LICENSE inventory.

## Jobs To Be Done

- When I onboard a new dependency, I want its license identified so I know my obligations.
- When a lawyer asks for a license inventory, I want a single command so I can deliver it today.
- When I add a new language to the codebase, I want my detector to keep up so there are no gaps.

## Success Metrics

- Number of ecosystems supported (target: at least 21).
- Detection time on a reference multi-language repo vs. licensee.
- Accuracy in head-to-head benchmarks vs. askalono and scancode-toolkit.
- Number of GitHub App installs.

## Pricing & Monetization

Free for open/public repos on the web app. CLI is free to install. Source does not state pricing for private repos or for hosted / team use.

## Competitive Landscape

Incumbents: licensee (slow, Go), askalono (accuracy-focused), scancode-toolkit (broad but heavy). License Detector positions on the speed-vs-accuracy frontier and on ecosystem breadth.

## Risks & Open Questions

- Speed and accuracy claims are marketing-grade; mitigation is to keep the published benchmarks reproducible.
- GitHub App rate limits can throttle web app usage; mitigation is to provide the CLI as the heavy-lift path.
- New ecosystems must be added as languages evolve; mitigation is to keep the per-ecosystem rules isolated.
