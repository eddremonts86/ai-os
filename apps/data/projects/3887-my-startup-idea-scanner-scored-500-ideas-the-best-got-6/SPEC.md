---
id: "3887"
slug: my-startup-idea-scanner-scored-500-ideas-the-best-got-6
title: My startup-idea scanner scored 500 ideas; the best got 6.3/10
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49497779"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [LLM scoring pipeline, Winnability scoring model, Market data retrieval, Solo-founder fit analysis, Vertex token metering]
---
# My startup-idea scanner scored 500 ideas; the best got 6.3/10

## Problem

The author built a tool (1mil.app/hn) to test his intuition about various weird business ideas on his mind. He initially wanted a database of 1 million business ideas — hence the name, one million opportunities — but concluded that was a dumb idea and instead built a tool that returns only 10 ideas, all based on your input, your market and your background. The first release scored ideas on demand only, which gave false confidence, so he rebuilt the scoring around winnability: can a solo founder with a specific background win against what already exists? Since winnability went live in June, the tool has scored 500+ ideas, and none reached 7/10 — the best was 6.3 and the median is 1.3, including every scan he ran for himself. His preliminary conclusion: most business ideas are improbable to win. A free scan without an account is included; each scan costs Vertex tokens, which is why the tool is not free.

## Objective

Ship the idea scanner as a winnability test rather than a confidence machine: given a user's input, market and background, return a small set of ideas with a score that honestly reflects whether a solo founder with that background can win. The MVP is the live tool with the free no-account scan and the June winnability scoring, with the 500-idea score distribution published as evidence.

## Target Users

- Solo founders deciding where to spend effort and wanting a reality check on a business idea before building.
- Indie hackers comparing ideas against their own background rather than a generic ranking.
- Anyone curious about the author's running experiment: 500+ ideas scored, none above 6.3.

## MVP Scope

- Idea input: user's background and market, returning a small set of ideas (10, not 1 million).
- Winnability scoring: can this solo founder, with this background, win against what exists.
- Published score distribution as honest reporting (best 6.3, median 1.3).
- Free scan without an account; paid scans because each one costs Vertex tokens.

## Constraints

- The tool must avoid false confidence — the first release's on-demand scoring was rebuilt for exactly that reason.
- Each scan costs Vertex tokens, so free access is limited to one account-free scan.
- The author's preliminary conclusion (most business ideas are improbable to win) shapes the product's tone; the scoring is his model, not an independent benchmark.
- No price for additional scans is stated.

## Design Direction

See `DESIGN.md` for this project's design tokens.
