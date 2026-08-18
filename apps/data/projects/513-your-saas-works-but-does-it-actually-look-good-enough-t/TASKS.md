---
id: "513"
slug: your-saas-works-but-does-it-actually-look-good-enough-t
title: Your SaaS works. But does it actually look good enough to make people trust it?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo4wan/your_saas_works_but_does_it_actually_look_good/"
category: saas
date: "2026-08-14"
tech: [Astro, Tailwind CSS, Resend, Stripe, Neon Postgres]
---
# Your SaaS works. But does it actually look good enough to make people trust it?

## Phase 0: Scaffold

- [x] Capture problem from Reddit + write SPEC.md skeleton
- [ ] Define DESIGN.md (palette, typography, intake form styling)
- [ ] Provision Astro + Vercel + Neon Postgres project
- [ ] Wire Stripe test mode and two Checkout SKUs
- [ ] Configure Resend + intake form endpoint

## Phase 1: Core

- [ ] Build landing page with the 3-step critique offer (above-the-fold + form)
- [ ] Intake form posts to a Postgres `critique_requests` table; Resend sends the operator an alert
- [ ] Critique template (Notion → PDF): what works, what to fix first, what to fix later
- [ ] Stripe Checkout for "Landing Page Polish" ($1,200) — webhook writes an `orders` row
- [ ] Stripe Checkout for "Product UI Polish" ($3,500) — same webhook path
- [ ] Linear board template per paid project (intake → wireframe → high-fidelity → handoff)
- [ ] Deliverable checklist attached to every project before kickoff
- [ ] `/work` page with the first 3 case studies (before/after screenshots + 1-line outcome)
- [ ] Waitlist banner shown when 3 active projects are already in flight
- [ ] End-to-end test: founder submits form → critique delivered → package paid → Linear board created → Figma delivered

## Phase 2: Deploy

- [ ] Move Stripe to live mode
- [ ] Recruit 5 founders for the discounted first-5 cohort
- [ ] Coolify-side deployment of the intake API backend
- [ ] Set up Resend + Stripe webhook monitoring
- [ ] Post-mortem after week 14 with first-10 cohort

---

_Lúa generó este análisis automáticamente el 2026-08-14_
