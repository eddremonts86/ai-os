---
id: "2758"
slug: i-built-an-ai-music-generator-with-some-harnesses
title: I built an AI music generator with some harnesses
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49430425"
category: show-hn
date: "2026-08-25"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# I built an AI music generator with some harnesses

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I’m a developer, and also a music producer. When I work on commercial music, especially songs for ads, I’ve gotten pretty used to using AI music tools as part of the creative process.But I noticed that some people around me — e.g. my girlfriend — also want to create music as a way to express themselves, but often run into a few problems when using AI music tools:1. They don’t have a music background, so it’s hard for them to clearly describe the sound they want.
2. Sometimes they just want a song in the style of a certain artist, and the easiest way for them to express that is by naming the artist. But an artist’s name isn’t necessarily a useful description of the actual musical characteristics they’re looking for.
3. A lot of interfaces contain professional terms and parameters, like “weirdness,” that aren’t really designed from a normal user’s perspective and can be confusing.So I built onlymusic.ai and added some harnesses around the underlying models. (Okay, I know “harness” has become a pretty popular word lately.)In practice, it’s mostly prompt preprocessing, a rule system, and model orchestration.For prompt-to-song generation, when someone enters something very simple, we transform it in the background using some good prompt patterns we’ve collected. The goal is to preserve what the user actually meant, while translating it into language that the music model can understand better, hopefully improving the generation results.We also added one-click optimization for styles and lyrics.For styles, if someone mentions an artist, we translate that into musical characteristics — things like era, instrumentation, rhythm, vocal texture, and production style.For lyrics, we try to preserve things like the original rhyme, imagery, and intent, while rewriting parts that may not work well for generation.On the UI side, I’ve also tried to use simple, everyday language wherever possible, remove unnecessary options, and keep only the elements that actually matter, so the interface is cleaner and easier to use.Finally, a big thanks to open-source models like ACE. We deploy some of the models ourselves, which keeps the cost manageable, so we’re able to offer a pretty generous free tier with no signup required.In Fast mode, you can generate up to 5 songs without an account. After signing in, you can generate up to 20 songs per day. (That’s for Fast mode — if you use the more capable models, you’ll get fewer generations.) The credits refresh every day.We’ll keep an eye on the costs. If they become too much, we may have to reduce the free quota a little in the futureThere are still a lot of features under development. Feedback is very welcome, and I’d love for you to try it!I’m also working on a non-form-based lyrics generator right now. Once it’s ready, I’ll share that with you guys too.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49430425) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
