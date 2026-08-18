---
id: "663"
slug: i-will-not-promote-i-want-to-do-business-where-should-i
title: "I will not promote: I want to do business. Where should I start?"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vp3cx3/i_will_not_promote_i_want_to_do_business_where/"
category: startups
date: "2026-08-15"
tags: [founder-onboarding, idea-discovery, validation, beginner]
tech: [Astro (static site), Markdown-driven content, Postgres + Drizzle (for the journal), Resend, Plausible]
---
# I will not promote: I want to do business. Where should I start?

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialize the git repository and adopt a license
- [ ] Copy `edd-app-template` into `apps/663-i-will-not-promote-i-want-to-do-business-where-should-i/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Configure `tailwind.config.ts` with the tokens from DESIGN.md
- [ ] Set up the local development environment

## Phase 1: Core

- [ ] Author the 30-day playbook as 30 markdown files (one per day), structured around the seven questions the poster asked in order
- [ ] Build the journal web app with a per-founder token, a daily entry form, a tag-to-question selector, and a private read view
- [ ] Implement the idea scorecard: a 10-row scoring sheet the founder fills for each candidate idea, with a published rubric
- [ ] Ship the prompt library: 20 concrete "talk to people with the problem" interview scripts the founder can copy
- [ ] Wire the weekly Sunday check-in cron that emails a templated prompt referencing the founder's last entry via Resend
- [ ] Publish the example journal from a real founder who completed the 30 days, anonymised and with consent, so the playbook is not a blank page
- [ ] Add an explicit "what to do if you need more than 30 days" section so the founder can pause the cron without abandoning the playbook

## Phase 2: Deploy

- [ ] Create the public GitHub repository
- [ ] Deploy the Astro playbook and the journal app to Coolify
- [ ] Verify in production
