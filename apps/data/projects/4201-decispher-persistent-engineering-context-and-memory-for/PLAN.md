---
id: "4201"
slug: decispher-persistent-engineering-context-and-memory-for
title: Decispher – persistent engineering context and memory for coding agents
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509142"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# Decispher – persistent engineering context and memory for coding agents

## Tech Stack

The chosen stack — React, TypeScript, TanStack Start, SQLite with Drizzle ORM, Coolify, Docker — fits the web app and admin UI; the context store itself is a different backend (likely a vector DB plus per-integration connectors) and is not changed here. SQLite/Drizzle can hold config, audit logs and per-workspace memory-set definitions.

## Architecture

Multi-tenant Context Engine that ingests engineering records through per-platform connectors (GitHub via API, Jira, Slack, etc.), combines fragments into context units, and exposes them through MCP. Memory Plane stores per-user/team/project memory sets; on each task the right set is injected. Worker Agent runs in an isolated sandbox, retrieves context through the Context Engine and Memory Plane, and routes any external calls through an allowlisted proxy. Branch Story writes a structured handoff onto the PR.

## Milestones

- M1 — Context Engine GA for GitHub + Jira + Slack.
- M2 — Memory Plane for user/team/project memory sets.
- M3 — Worker Agent sandbox + allowlisted proxy + automatic purge.
- M4 — Branch Story structured PR handoff.
- M5 — VS Code/OpenVSX extension for context viewing and handoff writing.
- M6 — LongMemEval harness published.
- M7 — Pricing plans published.

## Risks

- Privacy and security posture is a hard sell; mitigation is the documented sandbox + encryption + purge guarantees.
- Integration churn: GitHub/Jira/Slack APIs change; mitigation is to keep each adapter behind a thin layer.
- LongMemEval results are part of the marketing surface; mitigation is to publish the eval harness so reviewers can reproduce.
- Pricing is undefined; mitigation is to announce plans before scaling sales.
