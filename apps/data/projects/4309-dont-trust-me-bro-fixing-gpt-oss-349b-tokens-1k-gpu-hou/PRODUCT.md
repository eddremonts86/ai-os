---
id: "4309"
slug: dont-trust-me-bro-fixing-gpt-oss-349b-tokens-1k-gpu-hou
title: "Don't trust me bro: fixing GPT-OSS (3.49B tokens, 1k GPU hours, 1x3090)"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49523381"
category: show-hn
date: "2026-09-01"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Don't trust me bro: fixing GPT-OSS (3.49B tokens, 1k GPU hours, 1x3090)

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Long story short, about a year ago, in spite of everybody bashing gpt-oss for broken tool calling and refusals, I thought there's something there worth exploring. Model hit a sweet spot for me in that it was the first time I could run full 128k context, factory-precision weights, across parallel requests on a single RTX 3090 at close to 200 tps (well... eventually, but it was still flying at around 100 tps initially which was mind blowing in the before-times).Could and would being two different things, turned out both llama.cpp and vLLM were shitting their pants running the model at the time (love you guys, I know this model was a pita!), particularly around tool calling (vLLM was / is broken seven ways to Sunday), mostly due to the Harmony template introduced by OpenAI (which, coincidentally (?) is almost identically implemented in Gemma 4 and somehwat similar in Muse Glimmer, 9-12 months after the gpt-oss release, so OpenAI was on to something there and likely not just for the OSS release but their bigger and closed siblings too).Anyway, validating my hypothesis with the vanilla backends proved impossible at the time.So I did the only rational thing: built an inference harness that fixes the model, then ran probably the most autistic evals in history -- 320,192 questions across 8 seeds, prefilling and decoding over 3.49B tokens, for 1,062 hours of batch size 1 GPU time on a single 3090.In the words of Carl Sagan, to make an apple pie from scratch, you first have to invent the universe. I spent my nights inventing this one in parking lots between food delivery gigs, so I named it burrito.All that just to test whether OpenAI shipped a broken model (spoiler: it didn't). Did it work? Here's the hero shots for the final boss of tool calling evals: multi-turn, pass@8 (at least 1 seed of 8) and pass^8 (every seed).https://raw.githubusercontent.com/iamskeole/burrito-evals/re...
> task solve rate on at least one seedhttps://raw.githubusercontent.com/iamskeole/burrito-evals/re...
> task solve rate on every seedSharing everything, MIT:- harness: https://github.com/iamskeole/burrito-core
- evals (incl. full inference traces): https://github.com/iamskeole/burrito-evals
- fixed jinja template: https://huggingface.co/openai/gpt-oss-20b/discussions/274/fi...(Detailed analysis on reasoning zones and "optimal effort" levels can be found in the evals repo)

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49523381) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
