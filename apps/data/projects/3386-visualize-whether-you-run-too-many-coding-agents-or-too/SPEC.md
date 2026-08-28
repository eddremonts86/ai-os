---
id: "3386"
slug: visualize-whether-you-run-too-many-coding-agents-or-too
title: "Visualize whether you run too many coding agents, or too few"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49456949"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Visualize whether you run too many coding agents, or too few

## Problem

As models have become more capable of running autonomously, I’ve been running more and more agents in parallel. But it’s never been clear to me what the number of agents I can handle is - should I be conservative and try 2-3 agents at a time, or try to push myself to go 5+?So we set out to create a new kind of agent visualization that answered this question.There were two types of agent visualizations we found in our research. One was cursor-wrapped or git-style visualizations that showed high level usage statistics throughout the year. The other was single agent visualizations - showing tool calls and back and forths from an agent session. We found the former too high-level, and the latter too granular.We experimented with a lot of different designs, but we settled on a clock-like design that cleanly shows when your agents were working autonomously, and when they were waiting on your input. This made it easy to visualize how many agents you were running in parallel and quickly spot when you’re the bottleneck.I’ve realized that I’m the kind of person who can only juggle 2-3 at a time - curious to hear what other people’s experiences are! (Especially if you've noticed an improvement)It’s simple to use - npx agentplayback or bunx agentplayback.Or you can clone it from https://github.com/JerryZLiu/AgentPlayback and modify/run it yourself. Open sourced under MIT license.

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
