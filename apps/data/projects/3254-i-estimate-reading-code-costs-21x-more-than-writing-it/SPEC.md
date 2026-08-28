---
id: "3254"
slug: i-estimate-reading-code-costs-21x-more-than-writing-it
title: I estimate reading code costs 2.1x more than writing it
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49456758"
category: ask-hn
date: "2026-08-26"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# I estimate reading code costs 2.1x more than writing it

## Problem

I hate reading agent-generated code and it's not a good use of my time, and I wanted a staistic to quantify by how much.My current estimate is $0.243 for a human to review one changed line and $0.114 in model spend for an agent to produce one benchmark-accepted changed line. That makes human review about 2.1 times as expensive under these assumptions.The agent calculation uses one public GPT-5.5 OpenHands run from May 2026. Its token categories, final patches, per-task costs, and evaluation outcomes come from the same 500 attempts. I then reprice those measured tokens at GPT-5.6 Sol's current rates.Human review: $0.24 per changed lineA SmartBear/Cisco study analyzed more than 2,500 reviews covering 3.2 million lines of code. It found that defect detection deteriorated as inspection rates rose through the 300-500 LOC/hour range. I used 400 LOC/hour as a midpoint.The US Bureau of Labor Statistics reports a median software-developer wage of $65.38/hour for May 2025. BLS employer-compensation data for March 2026 says benefits represented 32.7% of total compensation for private-industry professional and related occupations.Treating $65.38 as the wage component gives: loaded hourly compensation = $65.38 / (1 - 0.327) = $97.15
 review cost per LOC = $97.15 / 400 = $0.243

Agent implementation: $0.11 per changed lineOpenHands publishes its complete GPT-5.5 SWE-bench Verified run. It used OpenHands v1.18.1 with GPT-5.5 at high reasoning effort and attempted all 500 benchmark tasks.I counted changed LOC as additions plus deletions in each unified diff, excluding the +++ and --- file-header lines. "Accepted" means the SWE-bench evaluator marked the task resolved.The run resolved 391 of 500 tasks. One successful result, psf__requests-1142, contained 16,180 changed lines. The next five largest successful patches contained 136, 129, 86, 81, and 79 lines.That single patch accounts for 76% of all successful changed LOC. Including it would reduce the aggregate cost from $0.114 to $0.027 per LOC, which feels wrong. I therefore treat it as an outlier and removed that entire task from both cost and LOC totals. I report both results below.After removing it, the dataset contains: attempted tasks 499
 resolved tasks 390
 resolve rate 78.2%
 accepted changed LOC 5,077

Repricing the measured tokens to GPT-5.6 SolThe remaining 499 attempts consumed: cumulative tokens 651,273,155

GPT-5.6 Sol's promotional prices through November 21, 2026 are $4/M fresh input, $0.40/M cache reads, and $20/M output. Applying those rates: total spend over 499 attempts $577.48

All failed attempts remain in the $577.48 numerator. Only code from the 390 resolved tasks enters the denominator: cost per accepted changed LOC = $577.48 / 5,077
 = $0.1137

 tokens per accepted changed LOC = 651.27M / 5,077
 = 128,279

SourcesSource:
[static1.smartbear.co/support/media/resources…](https://static1.smartbear.co/support/media/resources/cc/book/code-review-cisco-case-study.pdfSources:)
https://www.bls.gov/news.release/ocwage.t01.htm
https://www.bls.gov/news.release/ecec.t04.htmRun metadata and archive link:
https://github.com/OpenHands/openhands-index-results/tree/main/results/GPT-5.5SWE-bench Verified source data:
https://huggingface.co/datasets/SWE-bench/SWE-bench_Verified

---

## Objective

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
