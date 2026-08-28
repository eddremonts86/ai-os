---
id: "270"
slug: people-with-a-criminal-past-cannot-reintegrate-into-soc
title: People with a criminal past cannot reintegrate into society because their real skills are \u00abinvisible\u00bb
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/career/krxg2n1ge1-people-with-a-criminal-past-cannot-reint"
category: career
date: "2025-12-11"
tags: [HR, Other]
country: Norway
tech: [Next.js 14, TypeScript, PostgreSQL, OpenAI GPT-4o-mini, Stripe, Resend, Open Badges 3.0]
---
# People with a criminal past cannot reintegrate into society because their real skills are «invisible»

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/270-people-with-a-criminal-past-cannot-reintegrate-into-soc/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Postgres schema: candidates, skills, evidence, credentials, verifications
- [ ] Skill-assessment catalogue (10 entry-level skills)
- [ ] Evidence upload flow (work samples, supervised-task videos, peer references)
- [ ] Open Badges 3.0 credential issuance
- [ ] Employer-side verifier app (returns only skill signal)
- [ ] Candidate-facing dashboard
- [ ] NGO onboarding flow
- [ ] Privacy audit and Norwegian data-protection compliance review

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js 14, TypeScript, PostgreSQL) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 270-people-with-a-criminal-past-cannot- MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Norway completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js 14, TypeScript, PostgreSQL errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
