# SPEC.md — OpenBot, open source framework similar to Grok Bot

## Problem

I think the path Grok Bot took is absolutely the right one, the collaborating bots model is easy to understand and it maps to workflows naturally. However, Grok Bot is closed source and quite expensive (I ran out of tokens on Ultra tier), so I&#x27;ve decided to roll out my own: <a href="https:&#x2F;&#x2F;github.com&#x2F;regnull&#x2F;openbot" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;regnull&#x2F;openbot</a>.<p>Same idea, you have collaborating bots that can be configured in any way you like. It supports all major LLM providers: OpenAI, Anthropic, OpenRouter and local Ollama models. You can also configure model per bot - so you can have an engineer bot to work on most of the issues, and a senior engineer bot (using better, more expensive model) to tackle the most difficult ones.<p>It&#x27;s fully operational and at this point it pretty much improves itself - most of the PRs are authored by the bots themselves. I&#x27;m working on adding support for MCP servers, including OAuth, which would make it even more useful. Contributions are welcome!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49739491)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-17T11:58:04Z

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
