---
id: "4525"
slug: indextkn-live-list-prices-for-900-ai-models-in-one-api
title: Indextkn – live list prices for 900 AI models in one API
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49527549"
category: show-hn
date: "2026-09-01"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Indextkn – live list prices for 900 AI models in one API

## Problem

I've been building quite a few POCs that use LLMs at work, and something that always comes up is: "OK, how much are we paying for X?" Or the one that follows right after: "If we use another model, would that be cheaper?"So far, what we've used are hardcoded files or keeping the data in our DB. This won't hold when moving to prod. It also keeps us very limited when it comes to creating price comparisons across different models/providers.indextkn came from that. Over the past 3 weeks, I've spent a lot of time understanding more about pricing, when prices usually change, discounts (flex, batch, based on X number of tokens, etc.)... and it's massive.The current state is not where I want it to be. The goal is to cover all prices and modalities offered by all providers. But right now, we have:1. Prices fetched every couple of minutes, served via API, MCP, or you can install our SKILL.2. Webhooks per model + provider, so you get a notification when anything changes.Most of the time went into the logic to get the prices right and the logic to validate them! We have different levels of confidence, and I'm particularly proud of how we're double-checking when a price seems off (a combination of programmatic logic + agentic workflow).Happy to answer any questions, and I'd love to have more folks testing it than just myself at the moment. :)

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
