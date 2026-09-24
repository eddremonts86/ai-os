# SPEC.md — Remind Cards – an offline-first flashcard app with AI generation

## Problem

Hi HN,<p>I’m a software engineer, and for the past several months I’ve been building Remind Cards, a flashcard app I originally made because I wanted a better way to study Estonian vocabulary.<p><a href="https:&#x2F;&#x2F;remindcardsai.com&#x2F;app" rel="nofollow">https:&#x2F;&#x2F;remindcardsai.com&#x2F;app</a><p>What started as a small prototype gradually became a much bigger side project.<p>The app now supports:<p>* AI-generated flashcards from any topic
* Uploading photos of handwritten notes and turning them into flashcards
* Automatically generating example sentences for your cards
* Pronunciation and text-to-speech, so you can hear the words and example sentences
* Custom decks and sub-decks
* A 7-box Leitner spaced-repetition system
* Multiple study modes: multiple choice, typing, matching, writing, and listening
* Images for flashcards
* CSV import&#x2F;export
* Offline studying
* XP, streaks, achievements, and leaderboards<p>Most of the learning functionality works locally. I mainly use the backend for authentication, synchronization, subscriptions, and shared&#x2F;community features.<p>One thing I deliberately avoided was turning the app into just an “AI wrapper.” AI helps with getting learning material into the app — for example, you can photograph your handwritten notes and generate flashcards from them, or have it create example sentences — but the actual learning experience is based around active recall and spaced repetition.<p>I’ve built the whole thing as a side project alongside my full-time job. The first prototype took only a couple of days, but I’ve now spent hundreds of hours polishing all the small things around it.<p>I’d especially appreciate feedback on:<p>1. The study&#x2F;review workflow
2. Whether the app feels too feature-heavy
3. The spaced-repetition approach
4. The handwritten-notes → flashcards work

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49725821)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-16T12:21:12Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
