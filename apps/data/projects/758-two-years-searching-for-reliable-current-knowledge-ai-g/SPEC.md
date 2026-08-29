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

## Problem

Apollinaria, a lifelong learner in Russia, has spent two years trying to teach herself across fields (marketing, programming, design, psychology) and has hit the same wall each time: she cannot tell which sources to trust, which are still current, where to start as a beginner, or how to distinguish expert opinion from advertising. Her attempts have failed in three consistent ways: search engines return thousands of links with no quality signal, ChatGPT and other AI tools return generic answers with no structure, no path tailored to her level, and no way to verify reliability, and ready-made courses are either too superficial or assume prior knowledge she does not have. The post is explicit that she is "open to discussing any reasonable payment model" but has not committed to a specific price. The implicit ask is for a personal guide that turns the messy landscape of new-field learning into a structured, level-appropriate path of trusted sources.

The broader problem the post is naming is that self-directed learning in 2026 is structurally hard because information is abundant and curation is not. Generic AI is a poor guide because it cannot tell a beginner from an expert, and traditional search is a poor filter because the quality signal is the user's own experience.

## Objective

Ship a personal learning guide that takes the user's stated goal and current level and returns a structured path of trusted sources, updated for current relevance, with explanations of why each source was chosen. The MVP must prove the loop end-to-end: a learner names a topic and a level, the guide returns a sequenced path with cited sources, and the path updates as the underlying field evolves.

## Target Users

- Primary: self-directed adult learners like Apollinaria who want to learn something new without committing to a multi-year degree program. The guide replaces the unstructured search-and-filter loop with a curated path.
- Secondary: career switchers who need to ramp up a new domain quickly and want a path that is current and level-appropriate, not the generic "start with Wikipedia" advice.
- Tertiary: curious professionals who want to keep up with a field adjacent to their own (a marketer wanting to learn enough data science to read the literature, a designer wanting to learn enough ML to read model cards) and need a way in that is not a 6-month bootcamp.

## MVP Scope

- A goal-and-level intake: the user names a topic, picks a starting level (beginner / intermediate / advanced), and the guide returns a sequenced path.
- A source registry curated by topic, with explicit quality signals (publication type, author credentials, peer review status, recency of last update) used to rank sources.
- A path generator that combines the source registry with the user's level and prior paths; outputs a 10–30 step path with one or two sources per step and a short rationale for each.
- A recency monitor that re-checks the source registry weekly and surfaces paths where a key source is now stale or has been superseded.
- A "why this source" inline citation that the user can click to see the registry entry: who wrote it, when, what kind of source it is, and why it ranked above the alternatives.
- A reading tracker so the user can mark steps done and the path rebalances as they progress.

## Design Direction

See `DESIGN.md` for this project's design tokens. The product's first surface is a clean intake form (topic + level + time budget); the second is a step-by-step path view that reads more like a syllabus than a feed. Citations are first-class and inline.

## Constraints

- The post does not name a price; the product must accommodate a free tier with sufficient value to prove the model, and a paid tier for power users. The MVP must not require a card to use.
- The user is in Russia and the source post is in Russian (translated to English on ProblemHunt). The MVP must support both Russian and English sources and surface Russian-language sources when the user is in Russian — language detection on the user side, not a one-language default.
- The product must distinguish expert opinion from advertising. A source that ranks highly because it is widely cited is not the same as a source that ranks highly because an expert wrote it for an expert audience. The registry must record both signals.
- Trust must be auditable. Every recommended source must trace back to a registry entry with the criteria that ranked it. "Black box" recommendations fail the post's stated requirement.
- Recency is part of the promise. A source ranked in 2024 may be stale in 2026, and the path must re-rank as the registry updates, not just on user request.
