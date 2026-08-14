---
id: "426"
slug: anyone-here-in-a-meteorology-startup-i-will-not-promote
title: Anyone here in a meteorology startup? I will not promote
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vmg8w4/anyone_here_in_a_meteorology_startup_i_will_not/"
category: startups
date: "2026-08-12"
tech: [Next.js (App Router), TypeScript, Python (FastAPI), PostgreSQL, Meilisearch, Vercel]
---
# Anyone here in a meteorology startup? I will not promote

## Tech Stack

Chosen for this problem:

- Next.js (App Router)
- TypeScript
- Python (FastAPI)
- PostgreSQL
- Meilisearch
- Vercel

## Architecture

Next.js front-end with statically generated company pages; FastAPI ingest service that queues user-submitted hiring signals; PostgreSQL for company + skill taxonomy; Meilisearch for skill-first search; Vercel deploy.

## Milestones

- Seed corpus of 40 companies with one source URL per entry
- Skill taxonomy wired into search
- Moderated hiring-signal form live, with email-only submit
- Public roadmap page that lists known gaps (no salaries, no role counts)

## Risks

- Source corpus may not include smaller meteorology startups the poster cares most about
- Manual curation will dominate the roadmap
- Moderation queue must not become the bottleneck
