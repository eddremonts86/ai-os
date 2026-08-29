---
id: "3716"
slug: the-ui-ai-slop-game-no-one-can-resist-5-minutes
title: The UI AI-Slop game. No one can resist 5 minutes
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49488507"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Game, UI, AI]
tech: [Vanilla JavaScript, HTML, CSS, WebAudio, Canvas]
---
# The UI AI-Slop game. No one can resist 5 minutes

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A web game that catalogues 48 of the most recognisable AI-generated UI patterns (country dropdowns, OTP inputs, cookie banners, scroll-to-accept gates, slide-to-unlock controls, selfie identity checks) and turns each into a solvable level under a five-minute clock, with a mercy mode that excludes device-permission levels and posts to a separate board.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Designers and product managers | Want a sharable, meme-able reference set of the AI-slop patterns they keep seeing in LLM-generated UIs. |
| Front-end engineers | Want to recognise these patterns on sight and design against them. |
| Hacker News / X visitors | Want a quick 5-minute play they can link back to. |
| AI-UI researchers | Want a tagged corpus of "default-LLM UI" patterns to study or quote. |
| Lab submitters | Want to design their own level and have it ship with their handle on it. |

## Jobs To Be Done

1. **Functional job** — Recognise and solve a series of recognisable AI-generated UI patterns inside a 5-minute timer.
2. **Emotional job** — Get the catharsis of beating (or being beaten by) the slop, then share the score.
3. **Social job** — Land a number on the public leaderboard or get a level shipped with your handle on it.

## Success Metrics

- **Plays:** ≥ 5,000 unique visitors complete at least one full run within the first month.
- **Mercy usage:** ≥ 30% of runs use mercy mode at least once (proxy for accessibility demand).
- **Lab submissions:** ≥ 10 community-submitted levels shipped in the first quarter.
- **Replay rate:** ≥ 25% of visitors click into a seeded profile to try to beat a friend's score.
- **Time-on-page:** median session ≥ 4 minutes (target: people really do play for 5).

## Pricing & Monetization

Free to play. No subscriptions, no ads. The site lists "Mercy mode" with no paywall and explicitly says "no mockery, no catch — it is the one part of this that is sincere." A future "Spectate" tab could let visitors pay a small fee to watch seeded runs live, but v1 is fully free.

## Competitive Landscape

- **Generic browser games / speedrun collections** — wide variety but no AI-slop taxonomy or shared leaderboard.
- **"Spot the AI image" games** — adjacent genre but focused on generated imagery, not UI patterns.
- **Twitter/X threads collecting AI-generated UI screenshots** — shareable but not playable.
- **Design pattern libraries** (Mobbin, Godly) — reference, not gameplay.

## Risks & Open Questions

- [ ] Confirm the 48-level scope is achievable without browser-permission prompts blocking play.
- [ ] Decide moderation policy for community-submitted levels before opening the lab.
- [ ] Verify the leaderboard seed (federico_sciuca, em, Itos) is acceptable to publish.
- [ ] Validate that the timer can survive tab-background throttling on Safari and Chrome.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49488507) · **Category:** show-hn · **Tags:** Show HN,Game,UI,AI
