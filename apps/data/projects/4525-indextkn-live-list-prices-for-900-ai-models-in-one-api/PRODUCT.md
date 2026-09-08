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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I've been building quite a few POCs that use LLMs at work, and something that always comes up is: "OK, how much are we paying for X?" Or the one that follows right after: "If we use another model, would that be cheaper?"So far, what we've used are hardcoded files or keeping the data in our DB. This won't hold when moving to prod. It also keeps us very limited when it comes to creating price comparisons across different models/providers.indextkn came from that. Over the past 3 weeks, I've spent a lot of time understanding more about pricing, when prices usually change, discounts (flex, batch, based on X number of tokens, etc.)... and it's massive.The current state is not where I want it to be. The goal is to cover all prices and modalities offered by all providers. But right now, we have:1. Prices fetched every couple of minutes, served via API, MCP, or you can install our SKILL.2. Webhooks per model + provider, so you get a notification when anything changes.Most of the time went into the logic to get the prices right and the logic to validate them! We have different levels of confidence, and I'm particularly proud of how we're double-checking when a price seems off (a combination of programmatic logic + agentic workflow).Happy to answer any questions, and I'd love to have more folks testing it than just myself at the moment. :)

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49527549) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
