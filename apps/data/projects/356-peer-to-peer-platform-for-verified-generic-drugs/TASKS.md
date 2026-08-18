---
id: "356"
slug: peer-to-peer-platform-for-verified-generic-drugs
title: Peer-to-peer platform for verified generic drugs
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/health/tp6dgyysf1-peer-to-peer-platform-for-verified-gener"
category: health
date: "2025-10-10"
tags: [Health]
country: India
---
# Peer-to-peer platform for verified generic drugs

## Phase 0: Scaffold

- [ ] Create project folder in `apps/`
- [ ] Initialize git repo
- [ ] Copy `edd-app-template` → `apps/356-peer-to-peer-platform-for-verified-generic-drugs/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Configure `tailwind.config.ts` with DESIGN.md tokens
- [ ] Set up dev environment
- [ ] Add Prisma + PostgreSQL schema skeleton
- [ ] Wire tRPC routes and a sample call
- [ ] Configure Razorpay sandbox

## Phase 1: Core

- [ ] Seller registration form with license upload (PDF + photo)
- [ ] Back-office verification queue that flips a seller to "verified" on a match
- [ ] Batch listing form (drug name, strength, batch #, mfg date, expiry, lab cert)
- [ ] Public buyer search by drug name and by photographed strip
- [ ] Photo-to-strip OCR pipeline (hosted OCR MVP)
- [ ] Order flow: reserve lot → Razorpay charge → seller confirms → dispatch → receipt
- [ ] Public receipt page that takes a batch number and shows the provenance chain
- [ ] Seller dashboard with order queue and dispatch confirmation

## Phase 2: Deploy

- [ ] Create GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production
- [ ] Recruit 5 verified sellers in one Indian state
- [ ] Run 50 end-to-end orders and capture 30 / 90-day retention
