---
id: "4227"
slug: type
title: "Type"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49506762"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# Type

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

Type gives an Android user on-device typo correction that runs in the keyboard process itself: no keystrokes leave the phone, every correction is checked against a dictionary and edit distance before it touches the text, and every change can be undone with a chip.


## Target Users

Android users who want on-device typo correction without their keystrokes leaving the phone. Assumes the reader is willing to install a third-party keyboard and grant it the keyboard permission.

## Jobs To Be Done

- When I type on my phone, I want typo fixes so I do not have to backspace manually.
- When the keyboard suggests a fix, I want it checked against a dictionary so I do not get a nonsense correction.
- When the fix is wrong, I want an undo chip so I can revert in one tap.


## Success Metrics

- Latency of the on-device correction vs. typing speed.
- Coverage of the dictionary against common typos.
- Number of corrections that pass the dictionary + edit-distance check.


## Pricing & Monetization

Source post does not state pricing or monetisation beyond what is named in the live product page (which is referenced where relevant in the Value Proposition). Treat pricing as unstated until the author publishes a model.

## Competitive Landscape

Closely related work includes other Android keyboards with built-in correction (GBoard, SwiftKey) and on-device LLM runtimes. The captured source post positions Type around on-device correction with dictionary + edit-distance gating, but does not enumerate specific competitors by name.


## Risks & Open Questions

- On-device is a hard requirement; any future feature that sends a keystroke off-device invalidates the headline claim.
- Keyboard resource budgets are tight; a large model will be cut off the APK and the user has to download it.
