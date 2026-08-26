---
id: "2978"
slug: turn-a-sandbox-into-an-mcp-server
title: Turn a Sandbox into an MCP Server
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49433211"
category: show-hn
date: "2026-08-25"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Turn a Sandbox into an MCP Server

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ mcpd is a way to expose sandbox environments as MCP servers using just configuration. In the repo, I have some example config files that mimic popular coding harness tools.I've been using it to give my cloud agents code search tools on private repos I manage. I have a script that syncs project code to the sandbox on deploy and I can connect it to my cloud agents and debug in Slack. It's awesome in combination with the Sentry MCP. I'm working on a secure way to have the agent open up PRs too.My general thesis is the agent loop should be unprivileged and run remotely and tool execution should be separate and sandboxed. Disconnecting the loop and the tool execution environments opens up a lot of cool possibilities.

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49433211) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
