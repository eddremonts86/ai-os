---
id: "872"
slug: student-needs-a-reliable-and-affordable-tool-for-exam-p
title: Student needs a reliable and affordable tool for exam preparation
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/education/mf1bmc02s1-student-needs-a-reliable-and-affordable"
category: education
date: "2025-10-28"
tags: [Education, AI, Other]
country: India
wtp:
  raw: "$1-5/month after confirming effectiveness, plus ads or micropayments"
  currency: USD
  min: 1
  max: 5
  period: month
  mrrMid: 3
  note: "Author explicitly named a $1–5/month band, with ads and per-feature micropayments as acceptable alternative monetisation models."
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Student needs a reliable and affordable tool for exam preparation

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md tokens (PWA mobile chrome, citation card, answer feedback row)
- [ ] Provision Coolify project + Docker image + SQLite volume + CDN for static assets
- [ ] Wire phone-number OTP auth via low-cost SMS provider (Indian market)
- [ ] Seed curriculum list: top 50 Indian boards / universities + JEE / NEET / CUET ingested as base `curricula` rows
- [ ] Decide Drizzle schema: `users`, `curricula`, `chunks` (with embeddings + page metadata), `answers`, `feedback`, `subscriptions`, `purchases`

## Phase 1: Core

- [ ] Syllabus / textbook / past-paper upload: PDF → chunked with page metadata → embeddings stored alongside the chunk text
- [ ] Retrieval endpoint: top-k chunks by question similarity, with source document name + page number attached to each chunk
- [ ] LLM answer endpoint constrained to a structured-output schema: `{answer_text, citation: {source, page, confidence}}`
- [ ] No-citation guard: the API rejects any LLM output that lacks a citation and returns the explicit "I can't find a verified source for this" message; the rejection is logged to the `feedback` table for audit
- [ ] Tutor upgrade path: ₹199/month connects the student to a vetted human tutor when no citation is found; payments via Razorpay
- [ ] PWA shell with service worker: installable on Android, offline past-paper pack cache, first-answer latency ≤ 2s on median 3G
- [ ] Per-answer feedback: correct / partially correct / wrong buttons feed a `feedback` table that ranks retrieval chunks by historical accuracy
- [ ] Free ad tier: 5-second static or short video ad reads before each answer; cap at 1 ad per answer
- [ ] Paid tiers: $1 / month (100 verified answers / day, no ads), $5 / month (unlimited, all past-paper packs, priority retrieval on slow connections); INR pricing via Razorpay
- [ ] Per-pack micropayments: ₹10 / past-paper pack, ₹20 / subject textbook pack; usable from the free tier without subscription
- [ ] Workspace status gating: free tier continues after trial; paid tiers gated by Razorpay / Stripe webhook
- [ ] End-to-end test: upload a sample BSc Physics syllabus, ask 10 questions, confirm every answer returns a citation or the "I don't know" fallback, no confident guesses

## Phase 2: Deploy

- [ ] Move Razorpay / Stripe to live mode
- [ ] Onboard 200 student beta across at least 3 boards (CBSE, ICSE, one state board) and at least 1 competitive track (JEE)
- [ ] Weekly manual audit of 20 random answers to confirm the no-citation guard never silently regresses
- [ ] Add at least 10 community-uploaded curricula with light moderation by week 12
- [ ] Tutor-vetting workflow for the ₹199/month upgrade path; payout structure documented
