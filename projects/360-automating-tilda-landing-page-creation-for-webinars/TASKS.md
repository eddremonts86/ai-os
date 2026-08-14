---
id: "360"
slug: automating-tilda-landing-page-creation-for-webinars
title: Automating Tilda landing page creation for webinars
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/marketing/tp6dgyysf1-automation-of-creating-a-tilda-landing-page-for-webinars"
category: marketing
date: "2025-10-10"
tags: [Marketing]
country: Russia
---
# Automating Tilda landing page creation for webinars

## Phase 0: Scaffold

- [ ] Create project folder in `apps/`
- [ ] Initialize git repo
- [ ] Copy `edd-app-template` → `apps/360-automating-tilda-landing-page-creation-for-webinars/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Configure `tailwind.config.ts` with DESIGN.md tokens
- [ ] Set up dev environment
- [ ] Add Prisma + PostgreSQL schema skeleton
- [ ] Add Tilda sandbox API key

## Phase 1: Core

- [ ] Brief form (title, date/time, speakers, programme, FAQ, registration provider)
- [ ] Speaker library with photo, bio, consent timestamp
- [ ] Speaker revocation flow
- [ ] Tilda template with hero / speaker / programme / form / FAQ / footer blocks
- [ ] Per-webinar overrides for hero and speaker block
- [ ] Tilda publisher: create project, wire form, return live URL
- [ ] Dashboard: live URLs, registration counts, brief queue
- [ ] Publish-confirmation email

## Phase 2: Deploy

- [ ] Create GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production
- [ ] Onboard 5 Russian marketers
- [ ] Run 20 webinars end-to-end
- [ ] Measure brief-to-publish turnaround
