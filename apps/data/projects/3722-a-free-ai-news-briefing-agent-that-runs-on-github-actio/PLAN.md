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

## Tech Stack

- **Orchestration:** GitHub Actions cron workflow (`schedule:` trigger) — the runtime that makes "no server" true.
- **Agent language:** Python — chosen for the rich RSS parsing, HTTP, and templating ecosystem, all available as GitHub-Actions-compatible steps.
- **News ingestion:** RSS / Atom feeds parsed with a Python library (`feedparser` or equivalent); source list lives in a checked-in YAML.
- **LLM summarization:** a single LLM API call (provider and model in repo config) using an API key supplied via GitHub Secrets.
- **Output rendering:** Markdown or HTML template, committed back to a branch or published via GitHub Pages.
- **Delivery:** SMTP send over GitHub Actions, or a commit to a `briefings/` branch consumed by GitHub Pages — channel choice in repo config.

## Architecture

```
┌────────────┐    ┌────────────┐    ┌────────────┐    ┌────────────┐
│ Cron       │───▶│ RSS ingest │───▶│ LLM call   │───▶│ Publish    │
│ (GH        │    │ (Python)   │    │ (API key   │    │ (Pages /   │
│  Actions)  │    │            │    │  in secret)│    │  commit)   │
└────────────┘    └────────────┘    └────────────┘    └────────────┘
```

The pipeline is a single workflow run. Each stage is a step or a small Python script that reads inputs from the previous step's artifact or stdout. No long-running server, no database — the only persistent state is the repo itself (source list, prompt template, generated briefings).

## Milestones

1. **M0 — Source & cadence agreement.** Lock the news sources (RSS list), the cadence (cron expression), the LLM provider/model, and the delivery channel. These are repo-level decisions, not product features.
2. **M1 — Working cron + RSS + LLM call.** A workflow that ingests feeds, summarizes them, and writes a Markdown briefing to a branch. README documents the API key setup.
3. **M2 — Delivery wired up.** SMTP send or GitHub Pages publish, chosen and documented.
4. **M3 — Hardening.** Failure handling (bad feeds, LLM timeouts), retry/backoff, scheduled run logs visible in Actions, and a "what to do when it breaks" section in the README.

## Risks

- **GitHub Actions minute budget.** Free-tier accounts have a per-month minute cap; the briefing must stay well under it.
- **LLM cost explosion.** A user who adds hundreds of feeds may push their API bill past the "free" promise; the README should warn about this.
- **Flaky sources.** RSS feeds go down or change URLs; the agent must fail visibly rather than silently drop a day's briefing.
- **Schedule drift.** GitHub cron is best-effort; the agent should be idempotent enough that a delayed run still produces a coherent briefing.
- **Secret leakage.** API keys must only live in GitHub Secrets; any committed sample config must use placeholders, not real keys.
