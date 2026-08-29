---
id: "765"
slug: global-problem-dating-apps-fail-for-complex-lives-illne
title: "Global problem: Dating apps fail for complex lives (illness, relocation, unfulfilled youth). A platform is needed for matching based on life path compatibility."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/social/8bua20bf01-global-problem-dating-apps-fail-for-comp"
category: social
date: "2026-02-11"
tags: [Social, Psychology, Other]
country: Russia
tech: [Elixir, Phoenix LiveView, PostgreSQL, Neon, Tigris (S3-compatible), Vector embeddings, Fly.io]
---
# Global problem: Dating apps fail for complex lives (illness, relocation, unfulfilled youth). A platform is needed for matching based on life path compatibility.

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/765-global-problem-dating-apps-fail-for-complex-lives-illne/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up Elixir + Phoenix LiveView with Postgres (Neon) and Fly.io
- [ ] Build the dual-record model: public profile plus life-path record with per-field disclosure levels
- [ ] Implement the structured onboarding questionnaire that seeds the life-path record
- [ ] Add the per-field lock / brief / full controls that gate visibility to the matching engine
- [ ] Implement vector embeddings for life-path similarity scoring
- [ ] Build the match engine with published per-field weights attributing each life-path field's contribution
- [ ] Add the two-way reveal step that gates exchange of direct contact details
- [ ] Build the platform-mediated chat with persistent history and moderator-visible metadata
- [ ] Implement the moderator console with redaction tooling and an audit trail of actions
- [ ] Add plain-text life-path export and account-deletion with a stated purge window
- [ ] Add a 'what changed in your path since you joined' surface so the match score can update
- [ ] Write an integration test that exercises a sensitive disclosure, moderator redaction, and a match over a two-way reveal

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
