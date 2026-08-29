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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/889-search-for-personal-business-niche-considering-psycholo/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Nine barrier categories approved: visibility, selling, conflict, rejection, repetition, uncertainty, money conversations, asking for help, being the centre of attention
- [ ] Russian-language interview copy reviewed by a Russian-native speaker before launch
- [ ] Next.js interview flow: 25–35 minute runtime, server-pause-resume, structured 1–5 score per barrier plus free-text note
- [ ] Rule-based scoring engine: `market-fit × personal-sustainability × action-ability` per niche, top 8 returned
- [ ] Niche template library of ≥ 80 templates across service businesses, micro-SaaS, info-products, agencies, local services, e-commerce; each tagged with barrier categories it tends to trip
- [ ] Every template reviewed by someone with personal experience of the niche before it ships
- [ ] LLM used only for summarising free-text notes into structured barrier categories; scoring engine itself is rule-based and reproducible
- [ ] Privacy: interview data private by default; opt-in aggregate-only contribution; privacy policy linked from every screen that touches user data
- [ ] Export: PDF and markdown of barrier profile + shortlist + reasoning per niche
- [ ] Copy language enforces the "recommendation, not prediction" boundary on every screen, not only in a footer disclaimer
- [ ] End-to-end test: user starts the interview, pauses, resumes the next day, completes it, sees top-8 shortlist with reasoning, downloads the PDF export

## Phase 2: Deploy

- [ ] 200 pilot users complete the interview end-to-end
- [ ] Pricing validated against the post-interview survey ($9 one-time vs alternatives)
- [ ] Set up status page + export-failure alerts
- [ ] Optional VPN-friendly deployment recipe documented for users behind restrictive networks
- [ ] Post-mortem after week 10 with pilot cohort and the Russian-native copy reviewer
