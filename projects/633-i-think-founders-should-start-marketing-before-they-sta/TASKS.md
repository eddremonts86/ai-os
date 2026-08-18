---
id: "633"
slug: i-think-founders-should-start-marketing-before-they-sta
title: I think founders should start marketing before they start building.
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1voy6zq/i_think_founders_should_start_marketing_before/"
category: saas
date: "2026-08-15"
tags: [marketing, validation, mvp, founder]
tech: [Next.js 14, Markdown-driven blog, PostHog, Resend (email), SQLite via Drizzle]
---
# I think founders should start marketing before they start building.

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialize the git repository and adopt a license
- [ ] Copy `edd-app-template` into `apps/633-i-think-founders-should-start-marketing-before-they-sta/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Configure `tailwind.config.ts` with the tokens from DESIGN.md
- [ ] Set up the local development environment

## Phase 1: Core

- [ ] Author the six-week protocol document as a markdown checklist with weekly checkpoints and explicit build/pivot/kill decision at week 6
- [ ] Build the journal schema: founder, entry (conversation | post | response), problem statement, signal strength, timestamp
- [ ] Implement the journal UI: log entry form, week-by-week view, and a print-friendly summary page
- [ ] Wire the public shared journal link so a founder can drop it into a Reddit/X post and capture click-throughs as signals
- [ ] Stand up the Sunday cron that aggregates the week's logs and emails a templated digest via Resend
- [ ] Ship the prompt library: 20 concrete scripts for "talk to people with the problem" that the founder can copy, not write
- [ ] Add the week-6 guided build/pivot/kill form that locks the journal and produces a shareable summary the founder can show future investors or collaborators

## Phase 2: Deploy

- [ ] Create the public GitHub repository
- [ ] Deploy to Coolify
- [ ] Verify in production
