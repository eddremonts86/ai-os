---
id: "781"
slug: hours-of-manual-searching-for-parts-for-chinese-cars-ne
title: Hours of manual searching for parts for Chinese cars. Need an AI agent that understands queries from photos or text and finds the part.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/retail/a035m95nv1-hours-of-manual-searching-for-parts-for"
category: retail
date: "2026-01-21"
tags: [Retail, AI, Business, Other]
country: Russia
tech: [Python, FastAPI, CLIP, OpenCLIP, Qdrant, PostgreSQL, Redis, Telegram Bot API, Next.js, Tailwind CSS, Docker]
---
# Hours of manual searching for parts for Chinese cars. Need an AI agent that understands queries from photos or text and finds the part.

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/781-hours-of-manual-searching-for-parts-for-chinese-cars-ne/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Seed a Russian-language catalogue of the most common Chinese-brand parts for the post-2015 import set, with photos, part numbers, fitment and supplier metadata.
- [ ] Stand up the FastAPI backend with the CLIP / OpenCLIP image embedding into Qdrant and the join against the Postgres catalogue.
- [ ] Add the text-embedding path that shares the same vector space as the photo path, so text and photo queries return comparable results.
- [ ] Ship the Telegram bot that accepts a photo or a text message and returns the ranked list in chat, with the confidence label.
- [ ] Build the Next.js supplier onboarding surface with the curator review pass for new brand or model range entries.
- [ ] Wire the per-workshop feedback loop into the ranking with the right granularity and the curator override path.
- [ ] Validate end-to-end on real phone-camera photos on a Russian 3G connection, with the confidence label visible to the user.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
