---
id: "786"
slug: a-beginner-in-online-business-needs-not-a-course-but-a-
title: "A beginner in online business needs not a course, but a personalized AI guide that will create and lead them through an individual step-by-step plan."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/h0x8gh7a71-a-beginner-in-online-business-needs-not"
category: ai
date: "2026-01-18"
tags: [AI, Business, Startups, Other]
country: USA
tech: [Remix, TypeScript, SQLite (better-sqlite3), Anthropic Claude API, Trigger.dev background jobs, PostHog analytics, Fly.io]
---
# A beginner in online business needs not a course, but a personalized AI guide that will create and lead them through an individual step-by-step plan.

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/786-a-beginner-in-online-business-needs-not-a-course-but-a-/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the Remix onboarding flow that captures idea, time per week, budget, current skills and constraints before any plan is generated
- [ ] Define the SQLite schema for beginner answers, plans and step rows, and seed one test beginner
- [ ] Wire the first end-to-end Claude API call that turns the onboarding into a small step-by-step plan with one concrete action per step
- [ ] Implement the conversational step loop: beginner reports what happened, the AI generates the next step, completion is recorded
- [ ] Add the manual step-override path so the beginner can rewrite a step and the AI continues from the rewrite
- [ ] Add the Trigger.dev daily check-in and weekly review jobs, with quiet-mode rules so they stop prompting when the beginner goes silent
- [ ] Wire PostHog funnels for step completion, drop-off and time-between-steps, without recording the underlying conversation content
- [ ] Add the hallucination guardrail: plans that would need market sizes or revenue projections leave those fields blank for the beginner to fill in
- [ ] Build the deliberate plan-reset path so the AI can say "this plan is not working" and propose a different shape
- [ ] Test plan continuation after a two-week absence to confirm a returning beginner is not re-onboarded

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
