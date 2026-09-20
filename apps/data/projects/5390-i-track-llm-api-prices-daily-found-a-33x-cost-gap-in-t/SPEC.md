# SPEC.md — I track LLM API prices daily, found a 33x cost gap in the same model

## Problem

I kept finding LLM pricing comparison posts that were already stale, so I built a scraper that snapshots the full OpenRouter catalog (425 models, 58 providers) every day and diffs it against the previous day. It&#x27;s been running unattended for about a week now: https:&#x2F;&#x2F;costpertoken.dev<p>One thing that fell out of the data surprised me: on the exact same model, a coding-agent-shaped call (large context in, code out) costs roughly 33x more per call than a bulk-classification-shaped call. I checked this on GPT-5.6, Claude Sonnet 5, and Gemini 3.7 Flash and got 33.6x, 33.3x, and 33.3x respectively -- almost identical despite three unrelated pricing tables. Seems to be a property of the call shape, not the vendor. Writeup here: https:&#x2F;&#x2F;costpertoken.dev&#x2F;guides&#x2F;why-agent-calls-cost-more-than-chat-calls&#x2F;<p>The site is a static Cloudflare Worker. Data collection runs via a local launchd job independent of any AI model or API, specifically so it can&#x27;t silently stop working.<p>Feedback and pricing corrections welcome -- it&#x27;s day 8, so there are rough edges.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49586810)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-06T14:23:53Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
