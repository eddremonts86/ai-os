---
id: "868"
slug: search-for-an-ai-tool-to-create-high-quality-and-natura
title: Search for an AI tool to create high-quality and natural-looking animation
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/8p64cdskm1-search-for-an-ai-tool-to-create-high-qua"
category: ai
date: "2025-10-29"
tags: [AI, Media, Design]
country: India
tech: [Python, FastAPI, PyTorch, ComfyUI, Celery, Redis, Next.js, S3-compatible object storage]
---
# Search for an AI tool to create high-quality and natural-looking animation

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/868-search-for-an-ai-tool-to-create-high-quality-and-natura/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build prompt-and-reference intake through the Next.js review surface, with the reference uploaded to object storage
- [ ] Stand up the Celery worker with Redis as the broker and one model checkpoint loaded
- [ ] Implement the GPU memory budget check and refuse oversized renders rather than crash
- [ ] Write run metadata to Redis with seed, sampler, checkpoint version and full parameters
- [ ] Write rendered frames to S3-compatible storage with the run id as the key
- [ ] Clean up the per-run scratch path after frames are uploaded
- [ ] Render the clip browser in Next.js sorted by run, with the clip and its prompt side by side
- [ ] Add the parameter form for motion strength, frame count, seed and sampler choice
- [ ] Build the parameter-diff view comparing the latest render against the previous one for the same prompt
- [ ] Implement the replay action that resubmits the same parameters and seed and surfaces the documented tolerance
- [ ] Add a second Celery worker on a second box sharing the same Redis queue with per-worker utilisation visible

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
