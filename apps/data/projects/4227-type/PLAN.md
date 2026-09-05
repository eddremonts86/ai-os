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

## Tech Stack

The keyboard is an Android APK with llama.cpp inside the keyboard process; the surrounding site uses React + TypeScript on TanStack Start with SQLite/Drizzle for the model catalogue and the dictionary registry. Coolify hosts the site behind Docker.

## Architecture

The Android keyboard process hosts llama.cpp and the dictionary + edit-distance checker; a model picker lets the user choose which language model to use. The dictionary is bundled with the APK and updated through releases. The site is a TanStack Start app Coolify hosts behind Docker.

## Milestones

- M1 — Android keyboard hosts llama.cpp inside the keyboard process.
- M2 — Model picker lets the user choose a language model.
- M3 — Dictionary + edit-distance checker gates every correction.
- M4 — Undo chip on every change.
- M5 — Shrink-and-fade affordance on letters that cannot continue a word.

## Risks

- On-device is a hard requirement; any future feature that sends a keystroke off-device invalidates the headline claim.
- Keyboard resource budgets are tight; a large model will be cut off the APK and the user has to download it.
