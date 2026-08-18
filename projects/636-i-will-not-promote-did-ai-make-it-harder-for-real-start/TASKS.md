---
id: "636"
slug: i-will-not-promote-did-ai-make-it-harder-for-real-start
title: "I will not promote: did ai make it harder for real startups to win?"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vozijo/i_will_not_promote_did_ai_make_it_harder_for_real/"
category: startups
date: "2026-08-15"
tags: [ai-noise, discovery, quality-signals, curation]
tech: [Next.js 14, Postgres + Drizzle, OpenAI embeddings, Resend, Plausible]
---
# I will not promote: did ai make it harder for real startups to win?

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialize the git repository and adopt a license
- [ ] Copy `edd-app-template` into `apps/636-i-will-not-promote-did-ai-make-it-harder-for-real-start/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Configure `tailwind.config.ts` with the tokens from DESIGN.md
- [ ] Set up the local development environment

## Phase 1: Core

- [ ] Author the 5-7 criterion rubric in plain language, each dimension captioned so a visitor can read it in under two minutes
- [ ] Build the public directory page in Next.js with up to 200 entries, each carrying a one-paragraph depth score, category, stage, and link to the source
- [ ] Implement the protected editorial admin: submission queue, draft state, rubric scoring, publish action, and a public edit history per entry
- [ ] Wire the dedup pass using OpenAI embeddings so the curator does not publish the same entry twice
- [ ] Stand up the weekly Sunday cron that emails newly published entries via Resend with one templated line per entry
- [ ] Ship the depth-score widget: a small JSON-served snippet founders can embed on their own site, fetching the canonical score from the directory
- [ ] Add the queryable tag system so visitors can filter by category, by stage, and by the rubric dimension the startup fares best on

## Phase 2: Deploy

- [ ] Create the public GitHub repository
- [ ] Deploy to Coolify
- [ ] Verify in production
