---
id: "3152"
slug: dependency-graph-and-impact-analysis-for-your-github-re
title: Dependency graph and impact analysis for your GitHub repo
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49447666"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# Dependency graph and impact analysis for your GitHub repo

## Phase 0: Scaffold

- [ ] Create the repo and web app scaffold
- [ ] Implement repository fetch at a given commit
- [ ] Define the module and symbol graph schema plus its cache key
- [ ] Write SPEC.md, PRODUCT.md, PLAN.md, TASKS.md, DESIGN.md

## Phase 1: Core

- [ ] Implement import-graph extraction for the first language
- [ ] Persist the graph keyed by repository and commit
- [ ] Build the graph visualisation UI
- [ ] Implement reverse-reachability impact queries for a file or symbol
- [ ] Report unresolved imports honestly instead of dropping them silently

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify (or chosen host)
- [ ] Verify in production
