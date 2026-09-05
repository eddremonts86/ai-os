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

## Problem

D5s is a multiplayer AI product for cross-human-agent collaboration, built by co-founders Michael and Theodore. From day one the company uses dedicated workspaces for engineering, go-to-market, finance and other functions; each workspace has a few 'coworkers' (AI agents) with access only to what they need, working with the team through Slack and Gmail. The coworkers take care of repeatable work across marketing, invoice processing and other operational areas. The founders believe this is how every company will work soon: people set direction and make decisions in shared workspaces, while agentic coworkers move the work forward. Early access is opening with a free plan plus credits for the first teams to sign up.


---

## Objective

Give a small team a shared workspace in which humans set direction and AI 'coworkers' handle repeatable operational work. The MVP proves the model end-to-end inside the founders' own company, then opens to outside teams.


## Target Users

Early-stage startup teams (engineering, go-to-market, finance, ops) that already work across Slack and Gmail and want to delegate repeatable operational work to AI agents with role-based access. Assumes the team is comfortable giving agents access to specific tools and channels.


## MVP Scope

- Workspace model where each workspace (engineering, GTM, finance, etc.) has scoped access for its AI coworkers.
- Coworkers connected through Slack and Gmail out of the box.
- Hand-off of repeatable operational work (e.g. invoice processing, marketing ops) from humans to agents.
- Free early-access plan with credits so the first outside teams can onboard without friction.
- The product itself is built using D5s, which is part of the test.


## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Source post is the founders' own pitch and does not state pricing beyond 'free early-access plan with credits included' for the first wave.
- Connectivity and authentication for Slack and Gmail integrations are binding assumptions.
- The roadmap emphasises team-level access controls; the system has to keep agents from over-reaching into other workspaces.

