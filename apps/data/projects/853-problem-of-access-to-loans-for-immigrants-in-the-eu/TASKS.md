---
id: "853"
slug: problem-of-access-to-loans-for-immigrants-in-the-eu
title: Problem of access to loans for immigrants in the EU
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/lhvgiz7hs1-problem-of-access-to-loans-for-immigrant"
category: other
date: "2025-11-06"
tags: [Immigration, Finance, Legal, Other]
country: Portugal
tech: [Astro, TypeScript, Go (chi), PostgreSQL, Pinecone (vector index), Anthropic Claude API, Plaid EU (sandbox), Coolify, Docker]
---
# Problem of access to loans for immigrants in the EU

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/853-problem-of-access-to-loans-for-immigrants-in-the-eu/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up the Astro intake page with the profile form fields and a submission id returned to the user
- [ ] Define the PostgreSQL schema for rule records (versioned), intake profiles, generated readouts and audit logs
- [ ] Build the Go (chi) service with endpoints for profile recording and readout generation
- [ ] Seed the Pinecone vector index over the rule library and load an initial set of rule records for the most common Portuguese residency-permit types and lending categories
- [ ] Wire the Anthropic Claude API call behind a per-request cost gate and a profile-hash cache keyed on rule-record versions
- [ ] Implement the personalised readout with eligibility categories, required documents, refusal drivers and the sequenced gap-closure plan
- [ ] Render the non-regulated-advice disclaimer on every output, including the printable PDF
- [ ] Add the operator rule-editor route behind admin auth, with version-on-edit semantics
- [ ] Implement PDF export of a generated readout
- [ ] Add the request-id-tied audit log and the re-run endpoint that returns the same readout for the same profile id
- [ ] Define and document the GDPR and Portuguese-compliant retention policy for intake profile data before any pilot applicant is onboarded
- [ ] Add the optional Plaid EU (sandbox) opt-in link behind explicit consent, with no persistence of linked-account data beyond the single readout

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
