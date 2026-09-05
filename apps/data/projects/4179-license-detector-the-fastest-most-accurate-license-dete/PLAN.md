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

## Tech Stack

The chosen stack — React, TypeScript, TanStack Start, SQLite with Drizzle ORM, Coolify, Docker — fits the web app and result dashboard; the detector engine itself is in Go (per the `go install` install line) and is not changed here. SQLite/Drizzle holds detection runs, repos and result caches.

## Architecture

Go CLI does the heavy lifting: walks a repo, dispatches per-ecosystem detectors, returns a structured license inventory. A TanStack Start web app lets users point it at an open/public repo and renders results. A GitHub App posts PR-level comments and pushes results into the same backend. Coolify hosts the web app and the result store behind Docker.

## Milestones

- M1 — Go CLI that detects across all 21 ecosystems.
- M2 — Public benchmark suite comparing against licensee, askalono and scancode-toolkit.
- M3 — Web app that scans an open/public repo on demand.
- M4 — GitHub App that comments on PRs with new/changed licenses.
- M5 — Hosted option for private repos.

## Risks

- Benchmark regression risk if any new ecosystem adds a heavy parser; mitigation is to keep parsers per-ecosystem and benchmark each in isolation.
- GitHub App rate-limit risk; mitigation is to cache aggressively and let the CLI escape the limit.
- Pricing for private repos is unstated; mitigation is to define plans before promising SLA.
