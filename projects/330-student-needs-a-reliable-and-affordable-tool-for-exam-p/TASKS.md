---
id: "330"
slug: student-needs-a-reliable-and-affordable-tool-for-exam-p
title: Student needs a reliable and affordable tool for exam preparation
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/education/mf1bmc02s1-student-needs-a-reliable-and-affordable"
category: education
date: "2025-10-29"
tags: [Education, AI, Other]
country: India
tech: [Next.js, Supabase, OpenAI API, Telegram Bot API, Razorpay]
---
# Student needs a reliable and affordable tool for exam preparation

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/en/education/mf1bmc02s1-student-needs-a-reliable-and-affordable` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/330-student-needs-a-reliable-and-affordable-/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Next.js, Supabase, OpenAI API, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: India`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for India.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
- [ ] Set up the LLM provider abstraction (rate-limit, fallback model, prompt cache) and the eval harness for the {country}-relevant test cases.
## Phase 1: Core

- [ ] Signup flow: exam selector (JEE/NEET/UPSC/SSC/banking) and language
- [ ] Question bank: minimum 1,500 questions per exam per subject, with explanations
- [ ] Daily set scheduler: 20 MCQs per subject, randomized within topic, sent at student's chosen hour
- [ ] Topic-accuracy tracking with 30-day rolling window and weak-topic flag at <60%
- [ ] Adaptive review session pulling from worst-performing topics, 30-min cap
- [ ] Parent weekly summary PDF (accuracy, study minutes, weak-topic trend)
- [ ] PWA service worker: offline cache for today's set + deferred submission

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js, Supabase, OpenAI API) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 330-student-needs-a-reliable-and-afford MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in India completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js, Supabase, OpenAI API errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
