---
id: "4400"
slug: saccade-live-semantic-browser-truth-for-ai-agents
title: Saccade – Live semantic browser truth for AI agents
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49516118"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Saccade – Live semantic browser truth for AI agents

## Problem

I build one this application is to resolve the most of the agent cannot handle the brother they extremely slow. So I come up with this idea, we install one of the extntion on chrome or edge to give continuously compile the tabs authorized by the user into semantically meaningful objects with stable identities, and push page changes as deltas to the local Node.js Broker. The Agent reads the full truth or delta of the specified tab via MCP and executes actions using object IDs bound to document. The preliminary result shows that it is very close to the performance of Playwright in terms of token use and speed.The only problem with this one is that at the very first time, it is going to send the full truth, and after that, for any page changes, it only sends the data. So, after the first read, the continuous operation of the page reaches the millisecond reaction loop.It can also upload filled forms, downloads, and all kinds of stuff. I want somebody to check and use it. If it is possible plz give me some feedback.

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
