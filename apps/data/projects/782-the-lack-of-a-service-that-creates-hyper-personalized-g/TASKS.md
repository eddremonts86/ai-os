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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/782-the-lack-of-a-service-that-creates-hyper-personalized-g/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the niche intake and the course generator call with a tight system prompt and a small phrase-blocklist validator before the lesson reaches the learner.
- [ ] Stand up the Convex schema for the learner's progress, the streak, the hearts and the next-session schedule.
- [ ] Ship the Next.js card-stack lesson UI with the tap-and-translate exercises and a niche-relevance rating prompt at the end of each lesson.
- [ ] Add the gamification layer (XP, daily streak, hearts) and the small set of daily challenges tied to the niche.
- [ ] Wire the spaced-repetition schedule with the per-session load capped at the 10-minute daily window.
- [ ] Seed the niche catalogue with the two examples from the post plus a few adjacent niches, and add the per-niche quality gate.
- [ ] Add the JSON progress export the learner can pull at any time, and deploy to Vercel + Convex.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
