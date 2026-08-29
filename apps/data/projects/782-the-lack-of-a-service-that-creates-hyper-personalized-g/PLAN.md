---
id: "782"
slug: the-lack-of-a-service-that-creates-hyper-personalized-g
title: "The lack of a service that creates hyper-personalized, gamified English courses (in the Duolingo format) for narrow professional niches (e.g., for a barista in a vegan coffee shop or a startup founder"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/education/jdez9r0101-the-lack-of-a-service-that-creates-hyper"
category: education
date: "2026-01-20"
tags: [Education, AI, Career, Other]
country: USA
tech: [Next.js, TypeScript, Convex, PostgreSQL, OpenAI API, Anthropic API, Vercel, Tailwind CSS, Stripe]
---
# The lack of a service that creates hyper-personalized, gamified English courses (in the Duolingo format) for narrow professional niches (e.g., for a barista in a vegan coffee shop or a startup founder

## Tech Stack

- **Next.js + TypeScript** for the web app, chosen because the card-stack lesson UI benefits from React's component model and the Vercel deployment story removes a build step the product does not need.
- **Convex** as the backend and the learner-progress store, picked because the daily-state mutations (streak, hearts, lesson completion) and the read of the next lesson slot fit a reactive document store better than a relational one.
- **PostgreSQL** (via Convex's relational layer) for the niche catalogue, the per-niche quality scores and the long-term spaced-repetition schedule that needs indexed queries.
- **OpenAI API and Anthropic API** for the course generator, with the system prompt kept tight and the output validated before it reaches the learner.
- **Vercel** for hosting, because the audience is learners on the web and the deployment shape is a single Next.js project plus a single Convex deployment.
- **Tailwind CSS** for the lesson UI, matching the card-stack pattern the post invokes without a bespoke design system.
- **Stripe** for any future monetisation that adds a paid tier, kept out of the MVP so the first launch is not gated by a payment integration.

## Architecture

A learner signs up, lands on the niche intake, and types a sentence or two about their job. The intake posts the input to a Next.js API route, which calls the course generator with a tight system prompt that fixes the lesson shape and demands every sentence be drawn from the niche. The generated lesson is validated — every new word and every example sentence is checked against a small blocklist of phrases the model is known to invent badly, and the output is stored against the learner's progress record in Convex.

The spaced-repetition engine runs on the Convex schedule and is keyed off the learner's last completed lesson and the new vocabulary introduced. Each lesson the learner completes schedules the new vocabulary for review on a fixed curve, so a 10-minute daily session has a small, stable load. The streak and the hearts live in the same Convex record, and the day's first lesson reads them, applies the rules, and updates them in a single transaction so two devices cannot double-credit the streak.

The niche catalogue is a small set of seed entries the two examples in the post and a few adjacent ones, plus a learner-generated niche layer that any learner can create. A learner-generated niche goes through a per-niche quality gate based on the niche-relevance rating the learners give it; a niche that scores low enough is flagged for editor review rather than auto-accepted. The progress export is a JSON download the learner can pull at any time, scoped to their own record and never the shared catalogue.

## Milestones

1. **M1 — Niche intake and generator** — the intake form, the generator call and the lesson validator that stores the output against the learner's progress.
2. **M2 — Card-stack lesson UI** — Next.js lesson surface that walks the learner through the validated lesson, with the tap-and-translate exercises.
3. **M3 — Gamification** — XP, daily streak, hearts mechanic and a small set of daily challenges tied to the niche.
4. **M4 — Spaced repetition** — schedule for new vocabulary across sessions, with the per-lesson review load capped at the 10-minute window.
5. **M5 — Niche catalogue and quality gate** — seed catalogue with the two examples plus adjacent niches, plus the per-niche rating and the editor flag.
6. **M6 — Progress export and Vercel launch** — JSON export of the learner's own progress, and a single Vercel + Convex launch.

## Risks

- **Model invents a phrase the learner would not say** — the worst possible failure; the validator and the per-niche rating have to catch it, not the learner.
- **Lesson feels generic despite the niche prompt** — a generator that drifts back to school English defeats the post's premise; a niche-relevance gate has to be measured before scaling the catalogue.
- **Spaced-repetition overload** — a 10-minute daily session with too many reviews crowds out new material; the per-session load has to be capped and measured.
- **Hearts mechanic becomes a paywall** — a hearts design that nudges the learner toward a paid refill violates the constraint; the gamification has to be honest or skipped.
- **Convex relational limits** — the niche catalogue and the per-niche ratings grow over time; the schema has to keep the indexed queries cheap as the catalogue does.
- **Streak divergence across devices** — a daily check-in that double-credits on two devices erodes the trust the streak rests on; the single-transaction update is the control, and it has to be tested.
