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

## Phase 0: Scaffold

- [x] Read the Show HN post and the source site's level sheet to confirm the 48 named specimens, mercy mode, and seeded leaderboard handles
- [x] Write SPEC.md (this document)
- [x] Write DESIGN.md tokens for the deliberate-slop level styling versus the understated game chrome
- [x] Scaffold the static app shell with no build step, an empty level registry, and the CSS and WebAudio file layout

## Phase 1: Core

- [ ] Implement the 48 named levels so each is solvable without external network calls
- [ ] Build the five-minute clock with per-level skip and verify it survives background-tab throttling on Safari and Chrome
- [ ] Implement mercy mode: excluded device-permission levels, removed modifiers, and a separate leaderboard
- [ ] Ship the leaderboard with the seeded runs (federico_sciuca, em, Itos) and handle submission
- [ ] Add public profile pages that replay a seeded run for any visitor to try to beat
- [ ] Build the lab intake: submit, review, and ship a level with its author's handle attached
- [ ] Write the lab moderation policy before opening submissions

## Phase 2: Deploy

- [ ] Deploy the static build and verify a full play-through on one desktop browser
- [ ] Announce with the seeded runs already on the board
- [ ] Watch replay rate and mercy-mode share against the PRODUCT.md targets

---

_Generated automatically by Lúa on 2026-08-29_
