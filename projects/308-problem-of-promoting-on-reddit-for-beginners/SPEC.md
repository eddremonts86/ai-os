---
id: "308"
slug: problem-of-promoting-on-reddit-for-beginners
title: Problem of promoting on Reddit for beginners
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/marketing/uya9j4sm41-problem-of-promoting-on-reddit-for-begi"
category: marketing
date: "2025-11-12"
tags: [Marketing, Other]
country: UK
tech: [Next.js, TypeScript, Postgres, Anthropic Claude API, PRAW (Reddit API), Resend, Vercel]
---
# Problem of promoting on Reddit for beginners

## Problem

A UK user describes a real beginner problem: promoting on Reddit is hard if you do not already know the culture. New accounts post what looks like an obvious ad, get downvoted into oblivion, and learn nothing. The title captures it: there is no tool that teaches a beginner how to participate on Reddit in a way that does not feel like promotion, even when the goal is to drive traffic to a product or service. The user wants the promotional outcome, but the only path that works is the one that respects Reddit's culture.

## Objective

Ship a tool that guides a beginner through their first 30 days on Reddit with a structured plan: which subreddits to read first, which to post in, what a "good" first comment looks like, and how to insert a product mention only after the account has earned enough karma to be heard.

## Target Users

- First-time Reddit users with a product or service to promote (founders, indie hackers, freelancers).
- Marketing generalists at small companies who want a Reddit channel but do not know the rules.
- Community managers learning Reddit as a new channel for their existing brand.

## MVP Scope

- Account audit: link your Reddit account, see karma, subreddit age, posting history; the tool returns a readiness score (ready to promote / not yet).
- 30-day onboarding plan: daily reading list, first-comment prompts, weekly milestone checks.
- Subreddit picker: given a product description, return a shortlist of subreddits with rules summaries and the right entry posture.
- Comment coach: paste a draft comment, the tool flags anything that reads like an ad (link in first sentence, no prior history in the subreddit) and suggests a rewrite.
- Promotion gate: blocks the user from pasting a product link until the readiness score clears a threshold.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/marketing/uya9j4sm41-problem-of-promoting-on-reddit-f` follows the constraints in `308-.../SPEC.md` and the chosen stack (Next.js, TypeScript, Postgres). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in UK.

For UK, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Must use Reddit's official API (PRAW) — no scraping of user pages or comments.
- The tool must not coach deception; if the user's product genuinely does not fit a subreddit, the tool says so.
- Compliance with each subreddit's rules is the user's responsibility; the tool surfaces rules but does not enforce them.
