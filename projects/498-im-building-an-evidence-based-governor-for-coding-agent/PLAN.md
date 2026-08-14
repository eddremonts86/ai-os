---
id: "498"
slug: im-building-an-evidence-based-governor-for-coding-agent
title: I’m building an evidence-based governor for coding agents — looking for people to try it
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SideProject/comments/1vnzfc1/im_building_an_evidencebased_governor_for_coding/"
category: sideproject
date: "2026-08-14"
tech: [TypeScript, Node.js (Fastify), PostgreSQL, Redis, Docker, MCP (Model Context Protocol)]
---
# I’m building an evidence-based governor for coding agents — looking for people to try it

## Tech Stack

Chosen for this problem:

- TypeScript
- Node.js (Fastify)
- PostgreSQL
- Redis
- Docker
- MCP (Model Context Protocol)

## Architecture

TypeScript governor; Node.js (Fastify) control API; PostgreSQL for policies + audit log; Redis for ephemeral state; Docker; MCP integration.

## Milestones

- Evidence-based policy engine
- Per-action allow / deny / require-approval
- Audit log
- MCP integration for one coding agent

## Risks

- MCP compatibility
- Policy expressiveness
