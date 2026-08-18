---
id: "235"
slug: online-clothes-shopping-is-a-lottery-theres-no-accessib
title: "Online clothes shopping is a lottery. There's no accessible technology to see how an item will fit your body, especially in small stores. It's a pain for the buyer and a loss for the seller"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/retail/k5z415d0z1-online-clothes-shopping-is-a-lottery-the"
category: retail
date: "2026-01-22"
tags: [AI, Other]
country: India
tech: [Next.js 14, TypeScript, MediaPipe Pose, Three.js, PostgreSQL, Cloudflare R2, Razorpay]
---
# Online clothes shopping is a lottery. There's no accessible technology to see how an item will fit your body, especially in small stores. It's a pain for the buyer and a loss for the seller

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/235-online-clothes-shopping-is-a-lottery-theres-no-accessib/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] MediaPipe Pose integration with on-device body segmentation
- [ ] Three.js parametric garment mesh with size-grade morph targets
- [ ] Garment upload flow in seller dashboard
- [ ] Per-garment fit-confidence model (offline training, inference API)
- [ ] Embeddable widget (web component) for Shopify, generic HTML, and Instagram-link landing pages
- [ ] Buyer photo capture UX with explicit discard-and-do-not-store messaging
- [ ] Razorpay seller subscription billing
- [ ] Return-rate tracking per pilot seller for fit-confidence feedback loop

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js 14, TypeScript, MediaPipe Pose) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 235-online-clothes-shopping-is-a-lotter MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in India completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js 14, TypeScript, MediaPipe Pose errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
