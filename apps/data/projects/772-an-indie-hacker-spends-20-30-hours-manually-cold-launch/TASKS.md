---
id: "772"
slug: an-indie-hacker-spends-20-30-hours-manually-cold-launch
title: "An indie hacker spends 20-30 hours manually «cold launching» each new product in directories, Reddit, and blogs. There is no tool that fully automates this and proves its effectiveness."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/1trzcj1cz1-an-indie-hacker-spends-20-30-hours-manua"
category: ai
date: "2026-01-29"
tags: [AI, Media, Marketing, Startups, Other]
country: UK
tech: [TypeScript, Bun, Postgres, Drizzle ORM, Playwright (browser automation), Reddit OAuth, Resend]
---
# An indie hacker spends 20-30 hours manually «cold launching» each new product in directories, Reddit, and blogs. There is no tool that fully automates this and proves its effectiveness.

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/772-an-indie-hacker-spends-20-30-hours-manually-cold-launch/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up Bun + TypeScript + Postgres + Drizzle
- [ ] Build the brief ingest with product name, description, audience, and tracking-link target
- [ ] Implement the curated surface list with per-directory, per-subreddit, and per-blog metadata
- [ ] Build the matching step that picks surfaces by audience and category for each brief
- [ ] Add the directory submission path via Playwright with CAPTCHA respect and per-submission artefact saving
- [ ] Implement the Reddit OAuth posting path with per-subreddit rule checks and an approval gate
- [ ] Build the blog outreach drafts with per-blog personalisation against the blog's recent content
- [ ] Add the blog email send queue with indie hacker one-click approval
- [ ] Wire per-activity tracking URLs with a click and signup ingestion layer
- [ ] Implement the post-launch view aggregating clicks, signups, and paying customers per activity over the post-launch window
- [ ] Build the per-product launch history so the next launch can be informed by the previous one
- [ ] Add the JSON export of the launch archive per product without a paid tier
- [ ] Write an integration test that exercises a brief in, three directory submissions, two Reddit posts, three blog drafts, click ingest, and the post-launch view

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
