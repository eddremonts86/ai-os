---
id: "889"
slug: search-for-personal-business-niche-considering-psycholo
title: Search for personal business niche considering psychological barriers
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/psychology/u4o11i24f1-search-for-personal-business-niche-consi"
  captured: "2025-10-22"
category: psychology
date: "2025-10-22"
tags: [Psychology]
country: Russia
tech: [Next.js, TypeScript, Node.js API, PostgreSQL, a small LLM for barrier-categorisation (OpenAI-compatible endpoint), a private journaling store, optional VPN-friendly deployment on Coolify]
---
# Search for personal business niche considering psychological barriers

## Problem

The source post is unusually thin — the title and category (Psychology, Russia, 2025-10-22) are the only data the post provides; the body of the post is empty in the captured page. The title itself, however, does state the problem precisely: a person is searching for a personal business niche and wants the search to consider psychological barriers — internal obstacles (fear of selling, fear of being visible, imposter feelings, perfectionism, decision paralysis) that shape which niches they will realistically stick with and succeed in, not just the niches an external market analysis would rank highest. The likely pain is the gap between "niches the market says are good" and "niches I can actually commit to for two years without burning out," which a pure market-research tool does not surface.

## Objective

Ship a self-reflection + niche-shortlist tool that walks a would-be solopreneur through a structured interview about their psychological barriers (selling, visibility, conflict, repetition, uncertainty, money conversations) and returns a shortlist of business niches scored on both market fit and personal sustainability, with each score's reasoning visible to the user so the result is a starting point for their own judgement, not a black-box recommendation.

## Target Users

- Primary: aspiring first-time solopreneurs in Russian-speaking markets who have already researched niches by surface signals (SEO tools, Reddit threads, YouTube gurus) but cannot tell whether the niche they keep coming back to is one they will still enjoy 18 months in, or whether the resistance they feel toward it is the market telling them to pivot or their own fear telling them to run.
- Secondary: career changers in their 30s–40s transitioning from corporate roles, who have more life experience to draw on but also more entrenched habits and a tighter financial runway, so the psychotherapy-of-the-search matters more than for a 22-year-old.
- Tertiary: business coaches and psychologists who already run "find your niche" workshops and want a structured intake their clients can do between sessions to make the live time more productive.

## MVP Scope

- A guided 25–35 minute self-reflection interview covering nine barrier categories derived from common solopreneur struggles: visibility, selling, conflict, rejection, repetition, uncertainty, money conversations, asking for help, and being the centre of attention.
- Each barrier scored on a 1–5 scale plus a free-text note from the user, stored privately in the user's account.
- A small library of ~80 business-niche templates (service businesses, micro-SaaS, info-products, agencies, local services, e-commerce niches) each pre-tagged with which barrier categories they tend to trip.
- A shortlist generator that returns the top 8 niches for the user, each scored on `market-fit × personal-sustainability × action-ability` with each sub-score reasoning visible.
- One-on-one export: the user can download their barrier profile and shortlist as a PDF or markdown file they can take to a coach, mentor, or therapist.
- Russian-language copy first (matching the source country), English as a secondary locale.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Self-reflection data is private by default; the user must opt in before any aggregate statistic leaves their account, and the privacy policy must say so in language a non-lawyer can read.
- The shortlist is a recommendation, not a prediction; the product copy must say so plainly, because users in this state are vulnerable to any confident-sounding answer.
- No fabricated market-size numbers behind the niche templates: the score is grounded in the user's stated barriers and the niche's qualitative barrier profile, not in TAM claims the source did not make.
- Russian-language copy first; English is secondary, not the other way around, because the source author is in Russia and the audience is Russian-speaking first-time solopreneurs.
- No clinical or therapeutic claims; the tool is a structured self-reflection, not a diagnosis. The copy must respect that boundary on every screen.
