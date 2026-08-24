---
id: "2199"
slug: relarena-open-source-releases-for-relational-learning
title: RelArena-α – open-source releases for Relational Learning
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49363970"
category: show-hn
date: "2026-08-19"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# RelArena-α – open-source releases for Relational Learning

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I’m happy to announce our first release in relational learning at Prior Labs, continuing our commitment to open science.Most of the data that actually matters to a business- users, transactions, sessions, orders- lives in relational databases, not in a single spreadsheet. SQL is built for backward-looking analysis: what happened, how much, when. It can't tell you whether a given user will churn in the next 30 days. This is a relational machine learning problem: making predictions directly over the structure of a database. It's still a young field, where results are often hard to reproduce, hard to compare across methods, and rarely tested outside benchmarks like RelBench. We argue that these problems have slowed progress in relational learning.We open-source three pieces of software that we expect to accelerate research in the field towards meaningful, real-world impact.First and foremost, we release -α: a unified framework for running and comparing baselines on RelBench v1 tasks. Based on learnings from tabular benchmarks like TabArena, we are standardizing data loading, evaluation protocols, tuning regimes, and adding support for systems with custom tuning.We also open-source -: our relational harness for TabPFN-3 (our Tabular Foundation Model). We initialize the (living) RelArena-α leaderboard with TabPFN-Rel and a comprehensive set of baselines. The rankings at the time of release are:• - is the No. 1 model submission
• - is the No. 1 system submissionLast but not least, we open-source an alpha version of the (): enabling you to easily specify prediction tasks on your own relational database and then run any RelArena-α model, like TabPFN-Rel, in a few lines of code, all bundled as a simple PyPI package.• Read the full model report: https://arxiv.org/abs/2608.16319
• GitHub repository: https://github.com/PriorLabs/relarena
• Announcement: https://priorlabs.ai/blog-posts/introducing-relarena
Cookbook: https://docs.priorlabs.ai/cookbook/relational_predictions_ta...

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49363970) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
