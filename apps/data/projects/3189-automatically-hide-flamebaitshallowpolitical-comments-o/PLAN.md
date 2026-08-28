---
id: "3189"
slug: automatically-hide-flamebaitshallowpolitical-comments-o
title: Automatically hide flamebait/shallow/political comments on HN
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49452362"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Automatically hide flamebait/shallow/political comments on HN

## Tech Stack

- **Frontend (web app + live page):** React + TypeScript with TanStack Start. TanStack Start is already in the existing tech; it fits a small SSR page that needs to render the live flagged stream with low latency.
- **Classifier pipeline:** TypeScript service that ingests HN comments and scores them against a documented, modified form of the HN guidelines using an LLM API (the source does not name the model; pick whichever provider already has budget).
- **DB:** SQLite with Drizzle ORM. Per-user threshold and a queue of recently-flagged comments; SQLite is enough for the personal-reading audience the poster is targeting.
- **Chrome extension:** Manifest V3 extension written in TypeScript with the same React component for the popup, hitting the backend over HTTPS.
- **Deployment:** Coolify + Docker. Single container for the API + classifier; the Chrome extension ships through the Chrome Web Store.

## Architecture

```
HN thread ──▶ Ingest worker ──▶ Classifier (LLM) ──▶ SQLite
                                                       │
                                                       ▼
Chrome extension ◀── API (TanStack Start) ◀───────────┤
                                                       ▼
                                            Live flagged page (React SSR)
```

- The ingest worker polls new comments from HN's public Firebase endpoint and writes each comment + score to SQLite.
- The API serves two clients: the Chrome extension (which fetches scores by comment id at thread-render time) and the live page (which subscribes for new flags).
- The classifier prompt and the modified guideline text are stored alongside the code so the "how it works" page can render the same artifact the model sees.

## Milestones

1. **M0 — Spec + design tokens + tech stack locked.** Existing SPEC.md and DESIGN.md approved; tech stack matches the source build at classify.stylometry.net.
2. **M1 — Classifier + ingestion working.** Service scores real HN comments against the documented modified guidelines and persists results in SQLite.
3. **M2 — Chrome extension with per-user threshold.** Users can sign in, pick a threshold, and have flagged comments collapsed on news.ycombinator.com threads.
4. **M3 — Live flagged page.** Public page streams newly-flagged comments as they arrive, with a scrollback of recent ones.
5. **M4 — Documentation.** Publish the "how it works" page that the source already links to: pipeline, modified guideline text, threshold model.

## Risks

- HN comment volume can spike on big stories; the ingest worker needs a backlog strategy so a single slow classifier call does not stall the queue.
- Chrome extension review and version pinning: changes to the news.ycombinator.com DOM will silently break selectors, so the extension needs a regression check on real threads.
- Model cost: every comment goes through the classifier; if the volume grows, the LLM bill is the dominant cost, and the source does not say whether the author intends to absorb it or pass it on.
- "Modified form of the HN guidelines" is the model's own definition, not a community-agreed one; users may disagree with what gets flagged and that disagreement will show up first as a threshold-tuning problem.
