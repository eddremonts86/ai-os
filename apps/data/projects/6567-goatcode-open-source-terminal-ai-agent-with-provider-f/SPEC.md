# SPEC.md — GoatCode – open-source terminal AI agent with provider failover

## Problem

GoatCode is a single 85 MB binary that runs in your terminal. It brings 180+ LLM providers (or your existing Claude&#x2F;ChatGPT&#x2F;Gemini&#x2F;Copilot subscriptions via OAuth), and when your quota dies mid-session it automatically retries then walks your fallback chain live — switches provider mid-turn, says so, and finishes the answer. No crash, no lost context.<p>What’s new in v2.1.10:
- Prompt caching on Anthropic (up to 90% cheaper long sessions; savings shown in &#x2F;cost)
- Inline unified diffs after every write&#x2F;edit
- &#x2F;rewind — jump transcript + files back to any turn
- Parallel subagents (up to 3 task calls fan out concurrently)
- &#x2F;search + goat search — full-text across every saved session
- @file Tab completion, &#x2F;model sonnet aliases
- True context meter (real API tokens vs model window)
- GOAT MODE (bypass) that actually works: mid-turn switch, prompt resolves YES
- Noir theme: deep slate + black-green surfaces<p>Install: npm install -g goatcode-cli (or grab a static binary from the releases page)<p>Repo: https:&#x2F;&#x2F;github.com&#x2F;Arhan-w&#x2F;GoatCode
Landing: https:&#x2F;&#x2F;goatcode.vercel.app

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49670455)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-12T09:02:29Z

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
