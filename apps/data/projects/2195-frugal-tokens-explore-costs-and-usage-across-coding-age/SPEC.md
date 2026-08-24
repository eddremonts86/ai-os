---
id: "2195"
slug: frugal-tokens-explore-costs-and-usage-across-coding-age
title: Frugal Tokens – explore costs and usage across coding agents
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49364223"
category: show-hn
date: "2026-08-19"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Frugal Tokens – explore costs and usage across coding agents

## Problem

I wanted to share a project I’ve been working on called Frugal Tokens. I originally built it because I was curious to see how much all of my sessions cost and how much cache misses affected that spend. I’d noticed people had widely different spend profiles and wanted to better understand what might contribute to that.As I’ve worked on this, the tool has grown to show more usage patterns across all of your sessions. It shows overall usage, estimated working time and overlapping sessions, and where your spend is coming from across models and cache misses. I also have a few session level metrics with percentile breakdowns, along with a list of your sessions and high level info.Clicking into a session opens an explorer where you can see individual model calls and tool inputs and outputs. You can also jump directly to where a cache miss happened. There’s also a rough cost comparison that shows what the recorded session would have cost with another model’s pricing, or for Anthropic, with 5m vs 1h caching.In the future, I’d love to collect more information to see which patterns might make people’s workflows more expensive, e.g. long sessions, high context usage, many turns, etc.The tool requires deno, but is just one command to run once that is installed. The demo provided has some of the data scrubbed, but helps to show what it looks like before running it.Would appreciate any thoughts or ideashttps://github.com/dpclark4/frugal-tokens

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
