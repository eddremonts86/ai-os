---
id: "758"
slug: two-years-searching-for-reliable-current-knowledge-ai-g
title: "Two years searching for reliable, current knowledge. AI gives generic answers, search engines thousands of links. Need a personalized guide to trusted information."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/education/35l4crn5d1-two-years-searching-for-reliable-current"
  captured: "2026-03-12"
category: education
date: "2026-03-12"
tags: [Education, Productivity, Other]
country: Russia
tech: [Next.js, TypeScript, Python (FastAPI), PostgreSQL with pgvector, RSS + arXiv + Semantic Scholar connectors]
---
# Two years searching for reliable, current knowledge. AI gives generic answers, search engines thousands of links. Need a personalized guide to trusted information.

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Stand up the Next.js + FastAPI skeleton, Postgres with pgvector, the registry schema (sources, fields, credential categories, provenance)
- [ ] Editorial import flow for the first 3 fields (programme a starter set per field with explicit credential categories)
- [ ] RSS + arXiv + Semantic Scholar connector skeletons, weekly diff job scaffolded
- [ ] Stripe account with two products (free tier with one active path, paid tier at €9–15/month)
- [ ] Locale detection on signup so the multilingual path is opt-out from day one

## Phase 1: Core

- [ ] Goal + level intake form, validated, locale-aware
- [ ] Path generator: top-N retrieval from the registry, LLM composition with strict inline citations, 10-step output, "why this source" rationale on each citation
- [ ] Source registry read API: every source has a public credential category, recency, provenance, and "why ranked above alternatives"
- [ ] Recency monitor: weekly diff for slow fields, daily for fast fields, flagged-path notifications in the dashboard
- [ ] Free tier: one active path, full registry read access, no card required
- [ ] Paid tier (€9–15/month): unlimited paths, recency alerts, offline export
- [ ] Multilingual source coverage: Russian-language sources seeded for at least 3 fields, language-aware ranking surfaced in the path view
- [ ] Reading tracker: mark-step-done, automatic rebalancing, weekly digest
- [ ] End-to-end test: a learner picks "learn data science from scratch," gets a 10-step path with Russian-language sources included (when locale = ru), the recency monitor flags one path's stale source after a week, the learner re-receives an updated path

## Phase 2: Deploy

- [ ] Stripe live-mode migration and KYC on the company entity
- [ ] Public launch post on Hacker News "Show HN" and on the relevant learning-focused subreddits (r/learnprogramming, r/selfstudy) with the multilingual coverage numbers published
- [ ] Onboard 500 active learners, weekly retention read-outs, per-field coverage numbers published
- [ ] Public status page (registry freshness, recency-monitor lag) and an on-call rotation for the weekly diff job
- [ ] Quarterly review of which fields the editorial team should expand into next, and a published roadmap
