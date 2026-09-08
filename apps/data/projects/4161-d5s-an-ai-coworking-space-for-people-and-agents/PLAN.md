---
id: "4161"
slug: d5s-an-ai-coworking-space-for-people-and-agents
title: "D5s, an AI coworking space for people and agents"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49511513"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# D5s, an AI coworking space for people and agents

## Tech Stack

The chosen stack — React, TypeScript, TanStack Start, SQLite with Drizzle ORM, Coolify, Docker — covers the web app and API surface that the team and their AI coworkers interact with, plus the integration glue for Slack/Gmail. AI coworker orchestration itself runs on top of model APIs and is not changed here.

## Architecture

Workspace-scoped multi-tenant app: each workspace has its own set of coworkers, each with role-scoped access tokens to those third-party systems. Slack and Gmail act as the front-end surface — agents are reachable where humans already work. Backend keeps a small SQLite (Drizzle) store per workspace for agent config, run logs and audit. Coworkers run as orchestrated jobs that observe a queue and call model APIs plus the allowed Slack/Gmail actions.

## Milestones

- M1 — Workspace and coworker data model with role-scoped access controls.
- M2 — Slack integration so a coworker can read channels and post responses in scope.
- M3 — Gmail integration for inbound triage and outbound replies within scope.
- M4 — A reference workflow: invoice processing end-to-end from Gmail to ledger.
- M5 — Free early-access onboarding path for the first outside teams.

## Risks

- Authorisation bugs across workspaces are the highest-stakes risk; mitigation is to keep access tokens scoped at the integration layer and audit every coworker action.
- Slack/Gmail API changes can break the product; mitigation is to isolate integrations behind a thin adapter.
- Free-credit pricing distorts demand signals; mitigation is to track credit consumption separately from organic usage.
- Founder-narrative bias in the early design; mitigation is to insist on retention data before locking the model.
