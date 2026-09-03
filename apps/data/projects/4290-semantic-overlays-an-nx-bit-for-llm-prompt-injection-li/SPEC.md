# SPEC.md — Semantic Overlays – an NX bit for LLM prompt injection (live demo)

## Problem

I&#x27;ve built a new method for steering LLMs called Semantic Overlays, small trained adapters on a frozen model which change how its perceives a piece of its context. The most readily applicable usage is to mitigate prompt injection, and it lets us take a very-injectable Qwen-3.5-9B to SOTA scores on all the prompt injection benchmarks I could find. (They are only blackbox attacks, but I did NOT train on anything like them — whitebox attacks are out of scope for this paper)<p>I&#x27;m excited for you to play with the tech — see if YOU can break it! (let me know if you can)<p>Paper at <a href="https:&#x2F;&#x2F;arxiv.org&#x2F;abs&#x2F;2608.23873" rel="nofollow">https:&#x2F;&#x2F;arxiv.org&#x2F;abs&#x2F;2608.23873</a> if you want to read more about it, code at <a href="http:&#x2F;&#x2F;github.com&#x2F;JoshuaSP&#x2F;semantic-overlays" rel="nofollow">http:&#x2F;&#x2F;github.com&#x2F;JoshuaSP&#x2F;semantic-overlays</a>, adapters at <a href="http:&#x2F;&#x2F;huggingface.co&#x2F;joshuapenman&#x2F;semantic-overlays-adapters" rel="nofollow">http:&#x2F;&#x2F;huggingface.co&#x2F;joshuapenman&#x2F;semantic-overlays-adapter...</a><p>Also <a href="https:&#x2F;&#x2F;x.com&#x2F;joshua_s_penman&#x2F;status&#x2F;2094823990472884389" rel="nofollow">https:&#x2F;&#x2F;x.com&#x2F;joshua_s_penman&#x2F;status&#x2F;2094823990472884389</a> if you wanna watch a little video I made!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49525220)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-01T17:40:13Z

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
