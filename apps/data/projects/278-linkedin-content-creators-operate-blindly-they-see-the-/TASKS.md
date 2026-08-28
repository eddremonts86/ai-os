---
id: "278"
slug: linkedin-content-creators-operate-blindly-they-see-the-
title: "LinkedIn content creators operate blindly: they see the results but don't understand the reasons behind their posts' success or failure"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/media/ja0oyjzdd1-linkedin-content-creators-operate-blindl"
category: media
date: "2025-12-02"
tags: [Marketing, Other]
country: India
tech: [Next.js 14, TypeScript, PostgreSQL, LinkedIn API, OpenAI GPT-4o, Stripe, Resend]
---
# LinkedIn content creators operate blindly: they see the results but don't understand the reasons behind their posts' success or failure

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/278-linkedin-content-creators-operate-blindly-they-see-the-/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Next.js dashboard with LinkedIn OAuth
- [ ] Postgres schema: creators, posts, analyses, playbooks
- [ ] Post-history import via LinkedIn API
- [ ] GPT-4o per-post classification (topic, hook, format, timing)
- [ ] Per-post "why this worked / didn't work" report
- [ ] Creator-playbook aggregation view
- [ ] Stripe paid tier
- [ ] Resend playbook delivery email

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js 14, TypeScript, PostgreSQL) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 278-linkedin-content-creators-operate-b MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in India completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js 14, TypeScript, PostgreSQL errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
