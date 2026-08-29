---
id: "3663"
slug: ai-shipcheck-know-if-your-ai-built-app-is-ready-to-ship
title: AI Shipcheck – know if your AI-built app is ready to ship
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49482469"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Python, Typer CLI, Playwright (Python), tree-sitter, Semgrep, Docker, GitHub Actions]
---
# AI Shipcheck – know if your AI-built app is ready to ship

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3663-ai-shipcheck-know-if-your-ai-built-app-is-ready-to-ship/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the Typer CLI scaffold with a JSON/SARIF report format and a CI-friendly exit-code contract
- [ ] Implement the test-coverage check using tree-sitter to surface untested paths in the supported languages
- [ ] Add the Semgrep-backed security check for AI-introduced gaps (hard-coded secrets, missing input validation, unsafe dependencies)
- [ ] Add the Semgrep-backed error-handling check for uncaught exceptions, swallowed errors, and missing error paths
- [ ] Implement the deployment-readiness check (Dockerfile, env vars, health checks, database migrations)
- [ ] Implement the dependency check (vulnerable and unmaintained packages in the dependency tree)
- [ ] Add opt-in Playwright runtime checks for gaps that only show against a built app
- [ ] Rank findings by severity with documented criteria, and surface the top items first so the report is triage-grade
- [ ] Publish a per-check "what this looks for / what this does not" page and a top-level scope statement
- [ ] Ship a GitHub Actions workflow plus the exit-code contract so other CI systems can adopt it; measure and publish the false-positive rate so the audit credibility is anchored

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
