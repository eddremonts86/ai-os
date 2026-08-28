---
id: "330"
slug: student-needs-a-reliable-and-affordable-tool-for-exam-p
title: Student needs a reliable and affordable tool for exam preparation
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/education/mf1bmc02s1-student-needs-a-reliable-and-affordable"
category: education
date: "2025-10-29"
tags: [Education, AI, Other]
country: India
tech: [Next.js, Supabase, OpenAI API, Telegram Bot API, Razorpay]
---
# Student needs a reliable and affordable tool for exam preparation

## Tech Stack

- Next.js
- Supabase
- OpenAI API
- Telegram Bot API
- Razorpay

Why this stack: each technology was chosen for this specific problem (the rationale is in the per-section prose). No global default stack is inherited from other plans.

## Architecture

The MVP for education runs as a single backend service on the stack (Next.js, Supabase, OpenAI API) with a thin client (web or mobile depending on the chosen deployment). Ingestion from the source post — captured at `https://problemhunt.pro/en/education/mf1bmc02s1-student-needs-a-reliable-and-aff` — feeds the problem statement and any captured body. From there, the read/write API serves a single dashboard view for the primary user in India, backed by an append-only audit log so each change can be traced back to a user action.

Components:

- **Edge / client** — serves the user surface and owns the auth handshake.
- **API** — single service exposing typed endpoints; no microservices in v1.
- **Persistence** — relational store (Next.js, Supabase, OpenAI API) with a migration log.
- **Background jobs** — used only for the source-body fetch and a daily metric rollup; nothing time-critical.
- **Outbound** — limited to the chosen payment processor and a transactional email side; no third-party trackers.

For India, data residency and payment routing follow the source post's locale (see `https://problemhunt.pro/en/education/mf1bmc02s1-student-needs-a-reliable-and-aff`).

## Milestones

M1 — Foundations (weeks 1–2): scaffold the app folder (`330-student-needs-a-reliable-and-afford`), pin dependencies for Next.js, Supabase, OpenAI API, and confirm CI on the chosen target. The schema from PLAN.md is in place and the auth path is end-to-end against a sandbox.

M2 — Source-faithful MVP (weeks 3–5): implement the smallest slice that solves the problem stated in `https://problemhunt.pro/en/education/mf1bmc02s1-student-needs-a-reliable-and-aff` with no feature creep. A single user from India can complete the core flow without hand-holding. WTP is not yet wired (only if the source post stated one — see SPEC.md).

M3 — Tightening (weeks 6–7): observability (logs + error tracking), data-residency config for India, and the security review per the constraints in SPEC.md.

M4 — Pilot (weeks 8–10): 5–10 users from India test the MVP and give feedback on the exact task the source post described. No marketing, no growth work, only the stated problem.

M5 — Decide (week 11): either commit to a v2 based on pilot signal, or shelve with a written post-mortem.

## Risks

- **Question bank quality.** A bad question damages trust faster than missing a question; quality review is on the critical path.
- **Connectivity reality.** Offline sync must handle conflict on the per-question attempt, not just append.
- **Subscription refund pressure.** Indian parents ask for refunds aggressively when a child stops using the app; refund policy must be in the checkout flow, not in T&Cs.
