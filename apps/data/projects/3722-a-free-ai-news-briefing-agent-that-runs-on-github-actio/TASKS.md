---
id: "3722"
slug: a-free-ai-news-briefing-agent-that-runs-on-github-actio
title: "A free AI news briefing agent that runs on GitHub Actions, no server"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49487904"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [GitHub Actions, Python, LLM API, RSS, GitHub Pages]
---
# A free AI news briefing agent that runs on GitHub Actions, no server

## Phase 0: Scaffold

- [x] Create the project folder under `apps/`
- [x] Initialise the git repo
- [x] Copiar `edd-app-template` → `apps/3722-a-free-ai-news-briefing-agent-that-runs-on-github-actio/`
- [x] Write SPEC.md (this document)
- [x] Write DESIGN.md (tokens + visual direction)
- [x] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [x] Set up the development environment
- [x] Read the source repo at github.com/tballochi/daily-briefing to confirm the source-only framing

## Phase 1: Core

- [ ] Lock the RSS source list (YAML) and the cron schedule
- [ ] Implement the Python ingest step (parse feeds, dedupe by URL)
- [ ] Implement the LLM call step (single summarization prompt, model in repo config)
- [ ] Implement the publish step (commit to a `briefings/` branch, or SMTP send)
- [ ] Write a README that documents: how to fork, where to put the API key, how to edit the source list, how to change the cadence
- [ ] Wire a sample run with a single feed so a first-time visitor can see output without configuring anything

## Phase 2: Deploy

- [ ] Create the public GitHub repo
- [ ] Enable GitHub Actions, set the API key in Secrets
- [ ] Confirm a scheduled run completes inside free-tier minute limits
- [ ] Document the failure modes (bad feed, LLM timeout, secret missing) in the README
- [ ] Verify a delivered briefing reaches the chosen channel end-to-end

---

_Generated automatically by Lúa on 2026-08-29_
