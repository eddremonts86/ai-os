---
id: "2982"
slug: readplusone-spanish-stories-built-around-the-words-your
title: "ReadPlusOne – Spanish stories built around the words you're learning"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49433095"
category: show-hn
date: "2026-08-25"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# ReadPlusOne – Spanish stories built around the words you're learning

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hey HN,Over the past 6 months, I've been working on a Spanish language learning app that generates stories for you with your target words. For the last 2, I've been reading with it most mornings and it's really helped me grow my vocab.It generates short stories built around your target words you are learning, and uses vocabulary you already know for the majority of the story (around 95%). As you read along you click any word you don't know and it puts them into a spaced repetition system (SRS) to appear in future generated stories.It does need an account to work. I have a short on-boarding quiz to estimate your level, after that you are able to generate and read stories.I built it because I was having issues finding graded readers that were at my exact level, a B1 graded book can vary greatly on vocabulary used. I also wanted a system to help me learn words that I kept forgetting. I tried Anki for that, but the flashcard system just wasn't for me, but this system has been working much better.For this project I used natural language processing to handle all the recorded words of the user. Nouns and adjectives collapse to their lemma (root of the word), so libro and libros are one record. But with verbs we don't, so each tense and mood is tracked on its own. The SRS picks whichever of these are due, and to simplify it, they are passed into the prompt. Then a separate validator measures the draft's vocabulary against your recorded vocabulary of the user, and if too much falls outside it, the draft is rejected and it tries again.It's Spanish only right now, and it works best from around A2 up, once you get below that level it becomes hard to generate interesting stories to engage the reader. I plan to add other languages in the future, once I feel that the Spanish system feels fully complete.Happy to answer any questions about the project!

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49433095) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
