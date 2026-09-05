---
id: "4655"
slug: an-autonomous-agent-for-slay-the-spire
title: An Autonomous Agent for Slay the Spire
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49532826"
category: show-hn
date: "2026-09-02"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# An Autonomous Agent for Slay the Spire

## Problem

While coding agents have reached a relatively mature stage, domain-specific agents are lagging far behind; for instance, using Codex to play games yields poor results.The Spire agent addresses the challenge of maintaining consistency across long-horizon tasks by delegating deterministic actions to domain-specific tools, while the LLM handles logical tasks requiring reasoning and acts as the "glue" connecting the components.Currently, about 40% of runs reach Act 3, and approximately 10% reach Act 4.I am currently optimizing an offline "evolving agent" capable of refining deck-building strategies based on data from past runs. Given that an offline simulator provides ground-truth rewards, this appears to be a promising path toward a self-evolving agent.

---

## Objective

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
