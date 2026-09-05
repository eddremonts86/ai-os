---
id: "4234"
slug: orato
title: Orato
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/orato-speech-coach"
category: product-launch
date: "2026-08-29"
tags: [ProductHunt, Product Launch]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Orato

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4234-orato/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the drill picker surface: the drill list, the per-drill description, the speaker's drill history (on-device).
- [ ] Implement the speak surface: the 30 to 90-second capture via Apple's native frameworks, the local speech recognition, the local four-axis scoring (pacing, fluency, vocabulary, coherence) via Apple Intelligence.
- [ ] Build the transcript review surface: the transcript, every filler and long pause surfaced, the four-axis score alongside the transcript; the speaker can re-listen to compare.
- [ ] Wire the on-device inference: Apple Intelligence integration, the structural no-network guarantee, the on-device verification metric.
- [ ] Implement the no-account onboarding: the drill picker is the launch surface, no signup, no email, no phone number.
- [ ] Run an end-to-end test: a speaker picks a drill, speaks for 30 to 90 seconds, sees the four-axis scores (pacing, fluency, vocabulary, coherence), reads the transcript back and sees every filler and long pause surfaced, confirms the audio stayed on the device, and confirms no account was required.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Submit the app to the App Store as a free launch with the launch tags Productivity, Education, Artificial Intelligence
- [ ] Document the iPhone-with-Apple-Intelligence requirement, the on-device guarantee, and the no-account onboarding in the App Store listing
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-31_
