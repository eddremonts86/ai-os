---
id: "492"
slug: built-a-free-platform-to-learn-to-code-the-problem-was-
title: "Built a free platform to learn to code — the problem was never \"no free content,\" it's \"nobody tells you what to learn first\""
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SideProject/comments/1vo06sf/built_a_free_platform_to_learn_to_code_the/"
category: sideproject
date: "2026-08-14"
tech: [Next.js, TypeScript, MDX, PostgreSQL, Resend, Vercel]
---
# Built a free platform to learn to code — the problem was never "no free content," it's "nobody tells you what to learn first"

## Problem

Source: https://www.reddit.com/r/SideProject/comments/1vo06sf/built_a_free_platform_to_learn_to_code_the/

Original post:

> Every programming concept is already free somewhere on the internet — docs, YouTube, blogs. So why do people still pay a lot of money for basic courses? Because nobody tells you what order to learn things in, or which parts actually matter vs which are a distraction. That's the gap I tried to close. Built academy.aniui.dev — free, text-based lessons (read, not video, so you can skim/search instead of scrubbing a timeline) with a live code playground built right into each lesson. Currently live: JavaScript and Claude Code / AI-assisted development. Coming over the next few months: React, React Native, Angular, Vue, DSA, and System Design — all with the same read + practice format. If you want to test what you actually know, there's an optional certification exam with a shareable certificate — that's the only paid part, everything else is free and stays free. Not trying to compete with people who genuinely teach well. Trying to fix the part where beginners (especially here in India, where courses charging ₹10-20k+ for content that's freely available elsewhere are extremely common) don't know where to start or what's worth their time. Built as a companion project to AniUI, an open-source React Native component library I maintain. Would love feedback on the lesson structure and what topic order actually helped you when you were learning — trying to get the "what to learn first" part right, since that's the actual hard problem here. submitted by /u/FailComprehensive323 [link] [comments]

---

What this plan addresses: A free platform to learn to code that focuses on the "I gave up" problem rather than the "no free content" problem.

## Objective

A free platform to learn to code that addresses the "I gave up" problem rather than the "no free content" problem, with curated project tracks and restart stories. When I have given up on learning to code and want to restart, I want a free platform that names the "I gave up" reasons and offers a project-based restart path, so I am not told to "just stick with it."

## Target Users

- Adults who started learning to code and quit
- Bootcamp / self-taught learners who stalled after the first course
- Career switchers who want a low-pressure restart

## MVP Scope

- Curated, project-based learning tracks
- "Why I quit and restarted" stories
- Lightweight streak counter (opt-in)
- No certificates / badges in MVP

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SideProject/comments/1vo06sf/built_a_free_platform_to_l` follows the constraints in `492-.../SPEC.md` and the chosen stack (Next.js, TypeScript, MDX). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body says the problem was never "no free content" but "I gave up"
- Plan keeps the "I gave up" framing
- Source did not name a specific track or language
