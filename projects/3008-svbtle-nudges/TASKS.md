---
id: "3008"
slug: svbtle-nudges
title: Svbtle Nudges?
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49338991"
category: ask-hn
date: "2026-08-17"
tags: [Ask HN, Problem]
---
# Svbtle Nudges?

## Phase 0: Scaffold

- [ ] Create project folder `apps/3008-svbtle-nudges/`
- [ ] Initialize SvelteKit with TypeScript and the static adapter off (Node adapter)
- [ ] Wire design tokens from DESIGN.md into the global stylesheet
- [ ] Build the paste form: textarea, submit button, loading state, and a "plain text only" hint
- [ ] Add a minimal README explaining that no email is stored server-side

## Phase 1: Core

- [ ] Implement the `/api/analyse` endpoint that takes the email body and returns a dossier JSON
- [ ] Write the directory schema in SQLite: vendor name, pattern id, regex, trigger class, preferences URL, source citation
- [ ] Seed the directory with 20 patterns covering "someone nudged you," "your account has been inactive," "we miss you," "your friends are waiting," and similar phrasings
- [ ] Build the dossier screen: claimed sender, trigger class, confidence, vendor preferences link, "report outdated" link
- [ ] Add .eml upload support via `mailparser` with plain-text fallback
- [ ] Implement `localStorage`-backed history: save dossier after each analysis, list past analyses on a small history screen
- [ ] Add the reply generator: three templated drafts (curt, neutral, detailed) the user can copy
- [ ] Write integration tests for the pattern matcher against a corpus of seeded vendor emails
- [ ] Add the export-to-JSON button on the history screen
- [ ] Dogfood for two weeks with a personal inbox before declaring v1 ready

## Phase 2: Deploy

- [ ] Create GitHub repo
- [ ] Deploy the SvelteKit app to a small VM (Fly.io) behind HTTPS
- [ ] Wire CI: type-check + integration tests on every push
- [ ] Set up a tiny cron that re-reads the directory JSON into the SQLite snapshot weekly
- [ ] Verify the deployed instance against a seeded corpus end-to-end
