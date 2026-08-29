---
id: "770"
slug: a-freelancer-often-loses-in-proposal-competitions-due-t
title: A freelancer often loses in proposal competitions due to the inability to quickly create personalized and visual website concepts for each job order.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/freelance/c3y54z8xz1-a-freelancer-often-loses-in-proposal-com"
category: freelance
date: "2026-01-29"
tags: [Freelance, AI, Marketing, Other]
country: Australia
tech: [Next.js (App Router), TypeScript, Tailwind CSS, Playwright (headless screenshots), Stripe, S3, OpenAI GPT-4o-mini]
---
# A freelancer often loses in proposal competitions due to the inability to quickly create personalized and visual website concepts for each job order.

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/770-a-freelancer-often-loses-in-proposal-competitions-due-t/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up Next.js (App Router) + TypeScript + Tailwind + Postgres
- [ ] Build the brief ingest surface: paste, URL, and free-text paths
- [ ] Implement the brief parser that produces a deliverable type, audience, and tone
- [ ] Wire the persona-detection step that routes briefs to the right template set
- [ ] Build the concept generator that produces single-page HTML/CSS from the parsed brief and an applied preset
- [ ] Implement the live preview with side-by-side brief and concept rendering
- [ ] Add a keyboard-first edit surface (copy, colour, typography, section order)
- [ ] Build the per-freelancer preset library with save-from-current-concept
- [ ] Implement the hosted preview URL with an unguessable slug and a configurable lifetime
- [ ] Add Playwright-rendered screenshot export at a chosen viewport
- [ ] Build the per-pitch library with revisit and re-export
- [ ] Add asset-license enforcement at generation time with a visible constraint surface
- [ ] Write an integration test that exercises a brief in, a generated concept, three edits, a screenshot export, and a live hosted URL

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
