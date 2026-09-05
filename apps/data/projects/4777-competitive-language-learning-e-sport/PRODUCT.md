---
id: "4777"
slug: competitive-language-learning-e-sport
title: Competitive Language Learning (E-Sport)
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49544661"
category: show-hn
date: "2026-09-03"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Competitive Language Learning (E-Sport)

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ For the past few years i've been on Duolingo & was able to learn Hindi & Spanish (even helped me get state seal of biliteracy)One of the biggest problems that I see in my generation (Gen Z) is loneliness. I love Duolingo's community, but sometimes (well actually oftentimes), I felt myself struggling to come back.Online language learning is a skill where dominantly, the entire motivation is connection and the entire daily practice is solitude.Nobody learns Spanish to know Spanish. They learn it to talk to their partner's family, to not be the silent one at the table, to move somewhere and have a life there. Then they spend 90 days alone with an owl.I was thinking of a way to connect people around the globe-through the shared passion of learning languages, & creating a competitive social space where people could compete in rapid-fire matches, instantly get feedback, & learn through teaching their own avatar (vs a more passive "lesson-style" learning). They learn on the spot, under pressure, & are put in different situations where they have to maneuver through different absurd scenarios & speak or type the language in a satisfactory way).The core flow is: Learn (2–5 min interactive segment) → Teach (explain it to your avatar) → Avatar attempts (your score).Then you take that into ranked 1v1 matches against someone near your level, chess.com style: a blind judge grades both players on speaking and writing, ratings move, there's a global ladder with titles and perks.The point is to bridge this through competition & internal community-building. Beyond the sport, users can interact with each other & create micro-societies based on their shared interests of the language. People learning Spanish who have gotten an interest in creating foods-stuff like Carne Asada or Gazpacho would join a community (based on their shared interest of the language).On the technical side I found an interesting mix of problems (that turned out to just be one).Matchmaking needs P(A beats B) from two ratings.
Grading open-ended output is unreliable with rubrics, so instead of scoring one answer I only ever ask "which of these two is better", Comparative Judgment, with scores recovered via Bradley–Terry.
Calibrating content difficulty across CEFR/JLPT levels is Item Response Theory, usually a Rasch model.All three are the same logistic function. Elo is an online gradient step on the Bradley–Terry likelihood; Rasch is Bradley–Terry with one side fixed as "the item." So a 1v1 match is the pairwise comparison the judge needs, the judge's output is the observation the rating update consumes, and item difficulty falls out of the same fit. Ratings are Glicko-2, so a new player carries explicit uncertainty (high RD) and converges in a handful of matches instead of thirty. Users see it as a Fluency Score.Two Questions:
The human one: does competition make you want to practice, or does it just make you anxious about practicing?If you've shipped LLM-as-judge somewhere the score had real consequences, how did you detect drift you couldn't see from inside the system?If you think you may benefit/want to use from this, I put together a small waitlist of people who might be interested in using this in the future (I also put a small demo of a little creative writing prompt on the site... see if you can get highest accuracy!)Thanks for taking the time to read
https://thelingo.xyz

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49544661) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
