---
id: "854"
slug: problem-of-entering-the-ai-automation-market-without-te
title: Problem of entering the AI automation market without technical experience
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/gtd8o0taz1-problem-of-entering-the-ai-automation-ma"
category: ai
date: "2025-11-06"
tags: [AI, Business, Education, Other]
country: India
tech: [SvelteKit, TypeScript, Express (Node.js, TypeScript), PostgreSQL, Redis, OpenAI text-embedding-3-small, Cloudflare R2, Razorpay, Coolify, Docker]
---
# Problem of entering the AI automation market without technical experience

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/854-problem-of-entering-the-ai-automation-market-without-te/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up the SvelteKit intake page with the profile form fields and a submission id returned to the user
- [ ] Define the PostgreSQL schema for role records (versioned), intake profiles, generated plans and audit logs
- [ ] Build the Express service with endpoints for profile recording and plan generation
- [ ] Seed the OpenAI text-embedding-3-small vector index over the role library and load an initial set of role records for the most common Indian AI-adjacent roles
- [ ] Wire the plan-generation LLM call behind a per-request cost gate and a profile-hash cache keyed on role-record versions
- [ ] Implement the sequenced 90-day plan output with practice projects and milestone checklist
- [ ] Render the honesty-layer section contrasting role-record demands with commonly made market claims
- [ ] Render the non-certification disclaimer on every output, including the printable PDF
- [ ] Add the operator role-editor route behind admin auth, with version-on-edit semantics
- [ ] Implement PDF export of a generated plan
- [ ] Add the request-id-tied audit log and the re-run endpoint that returns the same plan for the same profile id
- [ ] Define and document the retention policy for intake profile data and Cloudflare R2 prefixes before any pilot learner is onboarded
- [ ] Wire the Razorpay integration for the paid tier in INR, behind a single subscription product

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
