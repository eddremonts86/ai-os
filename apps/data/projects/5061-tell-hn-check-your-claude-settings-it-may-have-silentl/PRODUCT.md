---
id: "5061"
slug: tell-hn-check-your-claude-settings-it-may-have-silentl
title: "Tell HN: Check your Claude settings, it may have silently enabled remote access"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49565799"
category: ask-hn
date: "2026-09-04"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Tell HN: Check your Claude settings, it may have silently enabled remote access

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I went to https://claude.ai/code today and saw some of my most recent Claude CLI sessions appeared there. I have never explicitly enabled RC, specifically because of security concerns and the only sessions I previously had in https://claude.ai/code were the ones I actually started there out of convenience, whenever I was away from my dev machine.So imagine my complete shock when I saw those sessions in their web client and that /rc was actually enabled in my CLI! Again, I never enabled it!!!Notably, there was a recent bug fixed 3 days ago (https://github.com/anthropics/claude-code/releases/tag/v2.1.257) which reads:"Fixed dismissing the Remote Control consent prompt (Esc, or n at claude remote-control) counting as consent, so the next request connected without asking"But MY GOD, if this is what happened here to me—even though I don't recall being asked that question—then Anthropic NOT handling this properly by disabling RC and re-asking users to double-check their config and explicitly re-enable it is just unimaginable.This has personally absolutely drew the line for me with them. I use Codex simultaneously and as soon as they release GPT6, I am canceling my sub. Enough is enough.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49565799) · **Category:** ask-hn · **Tags:** Ask HN,Problem
