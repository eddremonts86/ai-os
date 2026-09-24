# SPEC.md — Cadenya – An Agent Runtime

## Problem

My name is Robert, and I&#x27;m the founder of Cadenya, an agent runtime.<p>Cadenya is not like other managed solutions. Instead, it uses your API or MCP servers as the tools in your agentic loop, which also is managed.<p>Cadenya is also agnostic to the model provider. Wire up OpenRouter, or any OpenAI compatible endpoint, and it will use it for inference.<p>It also supports agent variations - where Cadenya will select the agent&#x27;s with the best feedback using Thompson Sampling.<p>And finally, Cadenya can be used in the frontend. Widgets receive their own hostname with CORS settings, and you can leverage the widgets-sdk and react components to build an agentic experience in the browser, without any complex backend logic.<p>Email support@cadenya.com with the Subject &quot;Saw on HN&quot; and get a promocode that unlocks a free account with $20 of credit.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49651207)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-10T22:52:18Z

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
