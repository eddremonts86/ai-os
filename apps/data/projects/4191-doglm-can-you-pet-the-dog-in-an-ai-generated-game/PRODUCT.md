---
id: "4191"
slug: doglm-can-you-pet-the-dog-in-an-ai-generated-gam
title: "DogLM – Can you pet the dog in an AI-generated game?"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509649"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# DogLM – Can you pet the dog in an AI-generated game?

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

DogLM gives a model a yes/no per prompt on a small, well-known design rule: if the game has a dog, can the player pet it? The aggregate score is a single number that tracks whether a model is learning to respect player-side affordances, not just visual details.


## Target Users

LLM evaluators, model builders, and game-design researchers who want a single-number signal on whether a model respects a small but well-known design rule. Assumes the reader is comfortable running an LLM benchmark.

## Jobs To Be Done

- When I evaluate a model, I want a single-number signal so I can compare it against others.
- When I tune a model, I want the failure cases so I can see which prompts it misses.
- When I write about game-design-aware LLMs, I want a public leaderboard I can cite.


## Success Metrics

- Coverage of the prompt set across game genres.
- Inter-rater agreement between the automated grader and a human spot-check.
- Number of models scored on the public leaderboard.


## Pricing & Monetization

Source post does not state pricing or monetisation beyond what is named in the live product page (which is referenced where relevant in the Value Proposition). Treat pricing as unstated until the author publishes a model.

## Competitive Landscape

Closely related work includes other LLM benchmarks (HumanEval, MMLU, GSM8K, MT-Bench). The captured source post positions DogLM around a single yes/no design-rule signal rather than general capability, but the precise list of named incumbents is not stated in the source text.


## Risks & Open Questions

- The grader is the bottleneck; a noisy grader invalidates the leaderboard and breaks the benchmark.
- Models change; the prompt set has to be stable across versions so scores are comparable.
