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

## Problem

The capture is a one-line problem statement: there is no service that creates hyper-personalised, gamified English courses in a Duolingo-like format for narrow professional niches. The title gives two specific examples — a barista in a vegan coffee shop, a startup founder — and explicitly frames them as the poster's own specifics, so they belong in the prose. The only other ground truth is `country: USA`.

The actor the post implies is a working adult who needs English for a very specific job context. The pain is the gap between generic language apps, which teach vocabulary the user will never use, and bespoke tutoring, which is unaffordable at scale. The missing thing is a service that generates the curriculum dynamically from the niche the user names and gamifies it the way the post says Duolingo does.

The capture names no competitor beyond Duolingo, no price, no specific niche beyond the two examples, no measurement of how a user evaluates fit and no platform target. The honest reading of the source is that the poster wants an app that lets a learner type "I work as a barista in a vegan coffee shop" and receive a Duolingo-shaped course whose every sentence comes out of that context.

## Objective

Ship a course generator that takes a learner's narrow professional niche and produces a Duolingo-style English course whose lessons, vocabulary and scenarios are drawn from that niche, with the gamification (streaks, XP, hearts, daily quests) intact. The unit of success is one learner who types their job and walks through a first lesson whose every sentence is recognisably about their work.

## Target Users

- Working adults in the USA whose jobs involve English-language interactions in a narrow domain they did not learn English for, and who need vocabulary and phrases specific to that domain.
- Recent immigrants and bilingual professionals whose English is fluent in general but patchy in their job context, and who want targeted practice rather than more grammar.
- Career changers moving into a new industry who want a fast ramp on the language of the new field.
- Trainers and language schools who want to assign niche courses to cohorts without commissioning bespoke content.

## MVP Scope

- A niche intake that asks the learner for their job, a sentence or two about their day, and a self-rated level, and turns that into a course brief.
- A course generator, driven by an OpenAI / Anthropic API call with a tight system prompt, that produces a structured Duolingo-style lesson: a small set of new words, a handful of sentences that use them in the niche context, and a couple of tap-and-translate exercises.
- A spaced-repetition engine that schedules the new vocabulary into the learner's next sessions, so a course is not a one-shot dump.
- A gamification layer that mirrors the Duolingo pattern the post names: XP for completing a lesson, a daily streak, a hearts or lives mechanic, and a small set of daily challenges tied to the niche.
- A learner progress store on Convex, so the streak, the hearts and the next-session schedule are recoverable across devices.
- A web surface on Next.js that works on mobile, with the lesson rendered as a card stack the learner can tap through.
- A small catalogue of starter niches for the launch (the two examples in the title plus a few adjacent ones the user can pick before typing their own), so a first-time visitor has something to try.
- A feedback prompt at the end of each lesson that asks how niche-relevant the lesson felt, feeding a per-niche quality score.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Every lesson the user sees must be recognisably about the niche they named; a generic sentence in a niche coat is the failure mode the post is rejecting.
- The gamification layer must be honest: hearts must not be a pay-to-avoid mechanic, and the streak must not vanish silently on a missed day with no recovery path.
- The course must work for a learner who only has 10 minutes a day; a lesson that takes 45 minutes defeats the daily-habit promise.
- The system must not produce hallucinated phrases that the learner would actually be embarrassed to say in the named context; the model output has to be checked, not trusted.
- The user's niche input must be stored privately; a niche that includes an employer name or a sensitive detail must not leak into any shared catalogue.
- The learner progress must be exportable; the streak and the vocabulary schedule are the learner's, not the platform's.
- The first launch must work on a single Convex deployment and a single Vercel project, because the poster's framing rules out enterprise onboarding costs.
