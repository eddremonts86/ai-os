---
id: "3634"
slug: repobeats-self-hostable-github-activity-cards-in-rust
title: Repobeats – self-hostable GitHub activity cards in Rust
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49481365"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Rust, Axum, SeaORM, SQLite, PostgreSQL, Redis, resvg]
---
# Repobeats – self-hostable GitHub activity cards in Rust

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3634-repobeats-self-hostable-github-activity-cards-in-rust/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Register the read-only GitHub App and implement the install and uninstall webhooks
- [ ] Mint installation tokens per operation and assert in a test that no token reaches the store or the logs
- [ ] Model commits, issues, pull requests and repository metadata in SeaORM against both SQLite and PostgreSQL
- [ ] Implement the first full collection pass for a connected repository
- [ ] Add cursors and conditional requests so subsequent passes are incremental
- [ ] Build the SVG renderer with themes, sizes and time ranges, emitting self-contained output
- [ ] Serve cards with ETags and cache headers, backed by the in-process cache
- [ ] Verify a rendered card through GitHub's image proxy on every theme
- [ ] Record last-successful-refresh per repository and expose it to the operator
- [ ] Implement lease-based refresh claiming and prove single-collection under two replicas
- [ ] Add optional Redis in front of the in-process cache
- [ ] Run the test suite against both SQLite and PostgreSQL in CI

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
