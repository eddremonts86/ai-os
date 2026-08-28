---
id: "3153"
slug: toned-an-iphone-darkroom-app-that-models-film-negatives
title: "Toned, an iPhone darkroom app that models film negatives and paper"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49447599"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [Swift, iOS, Metal]
---
# Toned, an iPhone darkroom app that models film negatives and paper

## Phase 0: Scaffold

- [ ] Audit the existing Xcode project and confirm Swift + Metal are the actual stack
- [ ] Lock down the two-stage pipeline interfaces (scene → negative → print) so the math is testable in isolation
- [ ] Pick a small reference set of film/paper combinations the maker trusts as ground truth
- [ ] Decide where the feedback submission lands (email, form, GitHub issue — source does not state)

## Phase 1: Core

- [ ] Implement per-dye H&D curves on the negative stage and confirm they compose correctly
- [ ] Implement the paper response curve on the print stage and wire it after the negative stage
- [ ] Profile on a real iPhone (not simulator) to make sure the two-stage pipeline holds its frame budget
- [ ] Add an in-app way for a darkroom-experienced user to send feedback with a sample image

## Phase 2: Deploy

- [ ] Submit an updated build to the App Store when the pipeline changes meaningfully
- [ ] Verify in production: install the current App Store build, run a known input through the pipeline, confirm the output matches expectations

---

_Generated automatically by Lúa on 2026-08-26_
