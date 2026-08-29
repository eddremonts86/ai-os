---
id: "3725"
slug: doodle-ai-open-source-photo-to-doodle-avatar-generator
title: "Doodle AI: open-source photo-to-doodle avatar generator"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49487781"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Python, diffusion model, image-to-image, FastAPI, web UI]
---
# Doodle AI: open-source photo-to-doodle avatar generator

## Phase 0: Scaffold

- [x] Create the project folder under `apps/`
- [x] Initialise the git repo
- [x] Copiar `edd-app-template` → `apps/3725-doodle-ai-open-source-photo-to-doodle-avatar-generator/`
- [x] Write SPEC.md (this document)
- [x] Write DESIGN.md (tokens + visual direction)
- [x] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [x] Set up the development environment
- [x] Read doodleai.art and the repo to confirm the Kiro-Hackathon origin and the free-credits mechanic

## Phase 1: Core

- [ ] Lock the base model and the doodle conditioning; document both in the README
- [ ] Implement the photo-to-doodle inference pipeline
- [ ] Build the hosted demo at doodleai.art (UI + backend + signup + credit counter)
- [ ] State N (the number of free generations) in the README and in the UI
- [ ] Publish a license note for generated avatars (commercial-use yes/no)

## Phase 2: Deploy

- [ ] Publish github.com/Type-Think-AI/doodle-ai with model card, base-model attribution, and a feedback channel
- [ ] Verify the free-credits flow end-to-end on the hosted demo
- [ ] Document the self-host path for contributors who want to run the same code on their own GPU

---

_Generated automatically by Lúa on 2026-08-29_
