---
id: "3448"
slug: agentcloud-mcp-first-ios-simulator-cloud
title: AgentCloud – MCP-first iOS simulator cloud
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49469964"
category: show-hn
date: "2026-08-27"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# AgentCloud – MCP-first iOS simulator cloud

## Problem

Hi HN, I’m Theo.I built AgentCloud because at Fiber we use Cursor Cloud a lot but cannot test our ios app on it.AgentCloud gives cursor cloud (or any other MCP-compatible cloud agent) a true ios simulator to install apps, tap around and test features and bug fixes end to end.The agent can:
- Upload and build iOS source using Tart.
- Create a disposable Simulator.
- Install and launch the app (built in the previous step)
- See the screen (screenshots, ui tree etc.)
- Tap, swipe, type, and open URLs.
- Read app logs.
- Create bi-directional tunnels. For example this is useful for Expo apps so the metro server can run on the cloud VM and the simulator can reach it.We records every simulator run and cloud builds on a nice UI that you can inspect.Test it out at https://agentcloud.so.

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
