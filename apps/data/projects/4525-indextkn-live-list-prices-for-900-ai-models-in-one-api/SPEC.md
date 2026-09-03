# SPEC.md — Indextkn – live list prices for 900 AI models in one API

## Problem

I&#x27;ve been building quite a few POCs that use LLMs at work, and something that always comes up is: &quot;OK, how much are we paying for X?&quot; Or the one that follows right after: &quot;If we use another model, would that be cheaper?&quot;<p>So far, what we&#x27;ve used are hardcoded files or keeping the data in our DB. This won&#x27;t hold when moving to prod. It also keeps us very limited when it comes to creating price comparisons across different models&#x2F;providers.<p>indextkn came from that. Over the past 3 weeks, I&#x27;ve spent a lot of time understanding more about pricing, when prices usually change, discounts (flex, batch, based on X number of tokens, etc.)... and it&#x27;s massive.<p>The current state is not where I want it to be. The goal is to cover all prices and modalities offered by all providers. But right now, we have:<p>1. Prices fetched every couple of minutes, served via API, MCP, or you can install our SKILL.<p>2. Webhooks per model + provider, so you get a notification when anything changes.<p>Most of the time went into the logic to get the prices right and the logic to validate them! We have different levels of confidence, and I&#x27;m particularly proud of how we&#x27;re double-checking when a price seems off (a combination of programmatic logic + agentic workflow).<p>Happy to answer any questions, and I&#x27;d love to have more folks testing it than just myself at the moment. :)

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49527549)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-01T20:17:32Z

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
