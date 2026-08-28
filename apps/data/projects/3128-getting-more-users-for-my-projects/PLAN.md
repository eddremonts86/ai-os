---
id: "3128"
slug: getting-more-users-for-my-projects
title: Getting more users for my projects
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49450064"
  captured: "2026-08-26"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Marketing, Indie]
tech: [TypeScript, React, Node.js, SQLite, Cloudflare Workers]
---
# Getting more users for my projects

## Tech Stack

- TypeScript end-to-end (React for the dashboard, Node.js for the API) because the matching and tracking logic lives in one language and the team already works in it.
- Cloudflare Workers for the impression redirect endpoint, so the per-impression cost stays near zero regardless of traffic.
- SQLite for the project pool, the impression ledger, and the pair-schedule queue — the dataset is small and the access pattern is mostly reads.
- A simple keyword-overlap scorer for the MVP matching rule, swappable for an embedding-based scorer later without changing the rest of the system.

## Architecture

- A submissions service stores projects (description, audience description, target URL, moderation state) and exposes them only after moderation.
- A matcher runs as a scheduled job, picks pairs for the day, writes a pair-schedule into a queue, and emits one impression credit per side.
- An impression service is a Worker that receives an `/_i/{id}` redirect, looks up the pair, checks the dedupe window, logs the impression, and 302s to the target URL.
- A dashboard service reads the ledger and shows each maker what they served, what they received, and their balance.
- Moderation is a manual queue page behind a staff login.

## Milestones

1. Submission form + moderation queue, with five seed projects hand-loaded.
2. Match scorer (keyword overlap) + a daily scheduled job that produces a pair schedule.
3. Impression worker with dedupe by IP-day, plus the click redirect.
4. Maker dashboard with served / received / balance, end to end with one cohort of ten projects.
5. Fairness floor in the matcher (cap on consecutive pairings with the same counterparty) and a public changelog.

## Risks

- The matching rule produces degenerate pairings in the first pilot — keyword overlap is brittle, and embedding similarity is overkill for five projects.
- Click fraud from a single determined maker is cheap; the IP-day dedupe is necessary but not sufficient.
- A two-person moderation queue does not scale beyond a few hundred projects; the MVP needs a plan for the cut-over, even if the plan is just "throw bodies at it".
- Imbalance: the natural equilibrium is that every project wants to receive more than it serves; without a hard cap, the queue starves.
