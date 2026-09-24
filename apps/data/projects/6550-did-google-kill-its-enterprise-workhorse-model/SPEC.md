# SPEC.md — Did Google kill its enterprise workhorse model?

## Problem

Is anyone else in a panic over the Gemini 2.5 model generation (Pro, Flash) being sunset in October before there&#x27;s even any Pro class model in general availability (with geo restrictions etc.)?   Google wants everyone to migrate to 3.x Flash, which beats the older Pro models on the benchmarked tasks, but isn&#x27;t the same thing as the Pro class on reasoning-heavy tasks like complex reasoning on very large documents (my big use case).<p>The Gemini family had a distinct niche in document comprehension, with thousand page input documents taking only 300k tokens.  Nothing quite like that in OpenAI or Anthropic world, even at more than 10x the token adjusted price.  Should we just give up on Google at this point and engineer around the competitors&#x27; limits and eat the costs?  Totally unnecessary own goal by team Google.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49668196)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-12T02:41:49Z

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
