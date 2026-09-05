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

## Problem

Type (type.thingg.co) is an Android keyboard that fixes typos with a language model running on the phone. The landing page states the constraints: the model runs inside the keyboard process through llama.cpp, and the only network use is downloading the model file the user chooses. Corrections are checked against edit distance and a 64k-word dictionary before they may touch the text, and every change comes with an undo chip. Letters that cannot continue a word shrink and fade; hit areas never change so names and slang stay typable.


---

## Objective

Ship an Android keyboard that runs a language model on-device to fix typos, with a dictionary + edit-distance check before any correction touches the user text, and an undo chip on every change.


## Target Users

Android users who want on-device typo correction without their keystrokes leaving the phone. Assumes the reader is willing to install a third-party keyboard and grant it the keyboard permission.


## MVP Scope

- An Android keyboard that runs llama.cpp inside the keyboard process.
- A model picker so the user can choose which language model to use.
- A 64k-word dictionary and an edit-distance check before any correction is applied.
- An undo chip on every change so the user can revert.
- A "shrink and fade" affordance so letters that cannot continue a word are de-emphasised.


## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Source post does not state pricing; the product ships as an APK on GitHub.
- On-device is a hard requirement; if anything leaves the phone, the headline claim collapses.
- llama.cpp must run inside the keyboard process, which limits what can ship in the keyboard's resource budget.
