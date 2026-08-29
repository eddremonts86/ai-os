---
id: "777"
slug: online-clothes-shopping-is-a-lottery-theres-no-accessib
title: "Online clothes shopping is a lottery. There's no accessible technology to see how an item will fit your body, especially in small stores. It's a pain for the buyer and a loss for the seller."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/retail/k5z415d0z1-online-clothes-shopping-is-a-lottery-the"
category: retail
date: "2026-01-22"
tags: [Retail, AI, Other]
country: India
tech: [Python, FastAPI, MediaPipe Pose, OpenCV, PostgreSQL, Three.js, Next.js, Tailwind CSS, Coolify, Docker]
---
# Online clothes shopping is a lottery. There's no accessible technology to see how an item will fit your body, especially in small stores. It's a pain for the buyer and a loss for the seller.

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/777-online-clothes-shopping-is-a-lottery-theres-no-accessib/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up FastAPI service with per-merchant API key validation and a PostgreSQL schema for merchants, garments, products and per-visit fit logs.
- [ ] Integrate MediaPipe Pose WASM into a standalone widget that extracts a proportion vector from a phone-camera clip and discards the raw frames.
- [ ] Build the OpenCV garment-registration endpoint that turns a flat-lay image plus measurements into a stored parametric garment record.
- [ ] Implement the Three.js warp that maps a proportion vector and a garment record into a rotatable client-side preview, with the low-power WebGL fallback.
- [ ] Ship the two-script-tag embed and the consent prompt, with a tested graceful path for declined camera permission.
- [ ] Add the Next.js + Tailwind merchant dashboard behind the same Coolify reverse proxy, scoped to aggregate counters only.
- [ ] Document the privacy story (frames on device, no facial landmarks, no per-shopper biometrics stored) end to end.
- [ ] Run a usability pass on the warp output with at least three small-store merchants before treating the preview as the shipped artefact.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
