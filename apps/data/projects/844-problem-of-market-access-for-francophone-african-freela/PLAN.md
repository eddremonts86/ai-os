---
id: "844"
slug: problem-of-market-access-for-francophone-african-freela
title: Problem of market access for francophone African freelancers
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: freelance
date: "2025-11-14"
tags: [Freelance, Other]
country: Cameroon
tech: [Astro (static), TypeScript, Cloudflare Pages]
---
# Problem of market access for francophone African freelancers

## Tech Stack

Astro (static), TypeScript, Cloudflare Pages.

## Architecture

Static site. New profiles are submitted via a form that opens a GitHub PR or queues for manual moderation. No login, no database in v1.

## Milestones

- M1: bilingual profile template and submission form
- M2: searchable directory with category and language filters
- M3: 'how to brief me' prompts and example scopes

## Risks

Static-first; profile submissions via a simple form that creates a PR or a moderation queue, not a live database.

- Profiles go stale; without an active re-confirmation flow the directory becomes a graveyard.
- The directory is not a vetting service; do not imply otherwise.
