---
id: "3890"
slug: get-your-free-ai-search-visibility-scan
title: Get your free AI search visibility scan
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49497538"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [AI answer-engine querying, LLM API, Playwright, domain crawler, report rendering, static site]
---
# Get your free AI search visibility scan

## Problem

The capture for this plan is a URL-only Show HN submission: the post body contains nothing but a link to https://visiscan.app. The product claim carried by the title is a free scan that reports how visible a website is in AI search engines — the assistants such as ChatGPT or Perplexity that now answer questions people used to put into a classic search box. Beyond that single sentence of claim, the capture states nothing: no methodology, no founders, no traction numbers, and no pricing other than the word free.

## Objective

Ship the tool the title promises: a self-serve scan where a visitor submits a domain and receives a report on how that site surfaces in AI-generated answers. The MVP defines the scan methodology from scratch — which engines to probe, which queries to ask, how a visibility score is computed — because the capture offers none of it.

## Target Users

- Website owners who suspect their traffic is shifting to AI assistants and want a first measurement.
- SEO practitioners extending their work from classic rankings into generative-engine visibility.
- Indie makers who want a zero-effort check on whether their product pages get cited by AI answers.
- Agencies looking for a lightweight, free lead-magnet scan to offer prospects.

## MVP Scope

- A public page with a single domain input and a scan action.
- Automated probes of a small set of AI answer engines with queries derived from the submitted site.
- A per-domain visibility report: which engines cite the domain, on which questions, with a summary score.
- A free run with no account required, matching the title's promise.

## Constraints

- The capture is a bare URL plus title, so every product decision (engines, queries, scoring) is ours to make and defend, not something the source specifies.
- The word free in the title is the only pricing signal; nothing else about monetization may be assumed.
- Probing AI assistants programmatically can hit rate limits and terms-of-service boundaries; the scan must degrade gracefully when an engine refuses.
- No user counts, testimonials or accuracy claims exist in the source; none may be invented in the plan.

## Design Direction

See `DESIGN.md` for this project's design tokens.
