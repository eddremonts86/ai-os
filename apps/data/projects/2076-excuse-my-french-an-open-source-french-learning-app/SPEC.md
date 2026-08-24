---
id: "2076"
slug: excuse-my-french-an-open-source-french-learning-app
title: Excuse My French – an Open Source French-learning app
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49376376"
category: show-hn
date: "2026-08-20"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Excuse My French – an Open Source French-learning app

## Problem

hi HN! Many years ago (in 2018) I wrote a simple French-learning exercise generator in Javascript for my wife. I was looking for a way to generate as many exercises as possible for her to practice. The idea was being able to generate a huge combination of sentences and being able to transform them deterministically based on French grammar rules. The generation and transformation is rule-based (no LLMs back then).For example, we generate (using rule-based) :> Je mange une pommethen we ask the engine to transform it to past and replace the pronoun:> Je l'ai mangéeThen we compare with the user's answer.I recently picked the project back up, thanks to AI coding tools and some free time I improved the UI, added more conventional bits (flashcards, dictation, progress tracking, etc). I kept the core of it: the rule-based sentence generator, because it allows to generate extremely fast locally and in a controlled way.I pushed this new version on the same repository : https://github.com/Celebio/excuse-my-frenchYou can directly use the app here: https://excusemyfrench.org/I hope you'll find it useful too. Very curious about your feedback, specially the onboarding part!

---

## Objective

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
