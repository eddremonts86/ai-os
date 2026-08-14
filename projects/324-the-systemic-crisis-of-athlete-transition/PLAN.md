---
id: "324"
slug: the-systemic-crisis-of-athlete-transition
title: The systemic crisis of athlete transition
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/fitness/6k2z8m4uw1-the-systemic-crisis-of-athlete-transition"
category: fitness
date: "2025-10-29"
tags: [Fitness, Career, Other]
country: USA
tech: [Next.js 14, TypeScript, Postgres + pgvector, OpenAI API, LinkedIn / Indeed / ZipRecruiter adapters, Stripe, Hetzner]
---
# The systemic crisis of athlete transition

## Tech Stack

- Next.js 14 (App Router) + TypeScript for the athlete console and employer marketplace.
- Postgres + pgvector on Hetzner for athlete profiles, employer roles, cohort records.
- OpenAI API for skills translation, resume, and interview narrative generation.
- LinkedIn / Indeed / ZipRecruiter adapters for civilian-job posting.
- Stripe for subscriptions.
- Cloudflare for ingress.
- Sendgrid + Twilio for cohort communications.

## Architecture

Next.js console hosts the athlete profile, the skills-translation output, the resume + interview narrative, the cohort community, and the employer marketplace. Skills translation pipeline maps athletic achievements to civilian skills via a curated mapping table + OpenAI refinement. Cohort community is a private space per cohort with a licensed facilitator. Employer marketplace exposes athlete-fit-scored roles; employers filter by sport, position traits, and tenure.

## Milestones

1. **M0** — Spec freeze, skills translation + resume builder MVP. End of week 1.
2. **M1** — Interview narrative + financial runway planner. End of week 4.
3. **M2** — Employer marketplace with athlete-fit scoring. End of week 7.
4. **M3** — Cohort community + licensed facilitator flow. End of week 10.
5. **M4** — Pilot with 100 athletes across NFL/NBA/MLB/NCAA; measure placement at month 6.

## Risks

- **Mental-health exposure** — Mitigation: licensed facilitator in every cohort; referral flow.
- **NCAA compliance** — Mitigation: no payment to athletes; NIL-neutral; legal review.
- **Placement claims risk** — Mitigation: explicit disclaimer; aggregate stats only.
