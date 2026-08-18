---
id: "2919"
slug: openwebsearch-a-router-for-web-search-indexes
title: OpenWebSearch – A router for web search indexes
status: draft
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49333187"
category: show-hn
date: "2026-08-17"
tags: [Show HN, Product, Problem]
---
# OpenWebSearch – A router for web search indexes

## Problem

Hi HN, I'm one of the people behind OpenWebSearch (https://openwebsearch.ai).It's a router for web search indexes. You POST to one endpoint with a
`provider` field, and it normalizes both the request and the response for web search indexes like Parallel, Brave, Exa and moreWhy we built it: we run a model company (Interfaze) and a lot of our models are smaller in size and we're experimenting if given web search can a smaller 9b or 70b model perform the same as 300b or 600b model and we found that it does extremely better when given web search similar to this paper (https://arxiv.org/abs/2203.05115)but we also found not all web search are built the same, some are better in people search, some better at financial data and others are bio research, etc.Like LLMs, web indexes are becoming commoditized with different indexes having different strengths and weaknesses with access to niche data, performance and cost. Every large model lab including Interfaze has to build their own internal mini-Google for training and eventually launch that index as a service.Some cool features:
- Centralized billing
- Standardized input and output structure
- Fallback support if a provider goes down
- Cost trackingFull blog: https://interfaze.ai/blog/introducing-openwebsearch

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
