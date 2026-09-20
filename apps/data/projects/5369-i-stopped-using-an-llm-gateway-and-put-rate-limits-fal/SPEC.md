# SPEC.md — I stopped using an LLM gateway and put rate-limits/fallback in-process

## Problem

Sup HN. I built VernLLM cuz every LLM gateaway I looked at, meant adding a network hop just to get rate limiting, multi provider fallback, circuit breaking and other features.<p>Needing to take a whole seperate service just to deploy, monitor and trust with my API keys is just annoying since my whole tech stack was just TypeScript and Node.<p>VernLLM does the same job within your LLM calls, but its in process instead. Its supports OpenAI-compatible APIs, Anthropic, Gemini and Bedrock providers.<p>I would also argue that the features VernLLM provides is more developed then any other gateaway out there when it comes to resilience and customization.<p>The tradeoff vs a gateaway is that it has no centralized policy across multiple apps or languages so if you want that then its better to use a gateaway instead.<p>Here is the docs for more info: <a href="https:&#x2F;&#x2F;vernllm.dev" rel="nofollow">https:&#x2F;&#x2F;vernllm.dev</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49585787)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-06T12:17:10Z

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
