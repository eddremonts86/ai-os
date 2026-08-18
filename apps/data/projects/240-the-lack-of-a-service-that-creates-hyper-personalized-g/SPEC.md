---
id: "240"
slug: the-lack-of-a-service-that-creates-hyper-personalized-g
title: "The lack of a service that creates hyper-personalized, gamified English courses (in the Duolingo format) for narrow professional niches (e.g., for a barista in a vegan coffee shop or a startup founder pitching to VCs)"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/education/jdez9r0101-the-lack-of-a-service-that-creates-hyper"
category: education
date: "2026-01-20"
tags: [AI, Other]
country: USA
tech: [Next.js 14, TypeScript, OpenAI GPT-4o + TTS, PostgreSQL with pgvector, Stripe, React Native, Mixpanel]
---
# The lack of a service that creates hyper-personalized, gamified English courses (in the Duolingo format) for narrow professional niches (e.g., for a barista in a vegan coffee shop or a startup founder pitching to VCs)

## Problem

Generic English-learning apps (Duolingo, Babbel, Busuu) do not teach the vocabulary and phrases specific to a learner's actual job. A barista in a vegan coffee shop, a startup founder pitching to VCs, or a nurse in a US clinic each need a different 200-word working vocabulary, and none of the existing apps generate that course on demand.

## Objective

Ship an English-learning app that, after a 5-question onboarding about the learner's job, generates a 30-day hyper-personalised course in the gamified Duolingo format — vocab, phrases, listening exercises, and a final role-play scenario — that targets the learner's stated professional niche.

## Target Users

Adult English learners in the USA whose job requires English fluency in a specific professional niche (healthcare, hospitality, startups, trades, customer support). Secondary: ESL programs that want per-cohort course generation.

## MVP Scope

Web app with onboarding quiz, GPT-4o-generated 30-day course, daily 10-minute lesson loop (vocab + phrase + listening + role-play), spaced-repetition review, and a final role-play scenario scored by an LLM. Stripe subscription for the personal tier.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/education/jdez9r0101-the-lack-of-a-service-that-creat` follows the constraints in `240-.../SPEC.md` and the chosen stack (Next.js 14, TypeScript, OpenAI GPT-4o + TTS). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in USA.

For USA, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Course generation cost per learner must stay below the subscription revenue. Voice acting for listening exercises via OpenAI TTS (no human voice actors in MVP). No medical / legal advice in course content — disclaimer in onboarding.
