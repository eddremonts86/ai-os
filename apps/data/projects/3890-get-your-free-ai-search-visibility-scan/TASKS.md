---
id: "3890"
slug: get-your-free-ai-search-visibility-scan
title: Get your free AI search visibility scan
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49497538"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [AI answer-engine querying, LLM API, Playwright, domain crawler, report rendering, static site]
---
# Get your free AI search visibility scan

## Phase 0: Scaffold

- [x] Read the Show HN capture and confirm it is URL-only, with the title as the sole product claim
- [x] Write SPEC.md, PRODUCT.md, PLAN.md and TASKS.md
- [x] Scaffold the repo: public static page, job queue stub, config for engine endpoints
- [x] Record the honesty constraints from the thin source in SPEC.md

## Phase 1: Core

- [ ] Build the domain submission form with validation
- [ ] Crawl the submitted domain and derive probe queries from its content
- [ ] Drive one AI answer engine via Playwright and capture responses
- [ ] Judge each answer for cited / not cited / ambiguous against the domain
- [ ] Render the first end-to-end visibility report

## Phase 2: Deploy

- [ ] Add the remaining answer engines and a per-engine breakdown
- [ ] Compute and display the summary visibility score
- [ ] Ship shareable report links and friendly error states when engines block
- [ ] Instrument per-scan cost and set rate-limit budgets
- [ ] Publish the free scan flow to static hosting
