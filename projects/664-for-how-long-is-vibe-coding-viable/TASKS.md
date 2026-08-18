---
id: "664"
slug: for-how-long-is-vibe-coding-viable
title: For how long is vibe coding viable?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vpvr2y/for_how_long_is_vibe_coding_viable/"
category: saas
date: "2026-08-16"
tags: [AI Coding, Sustainability, Audit]
---
# For how long is vibe coding viable?

## Phase 0: Scaffold

- [ ] Create project folder in `apps/`
- [ ] Initialize git repo
- [ ] Copy `edd-app-template` into project root
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Configure `tailwind.config.ts` with DESIGN.md tokens
- [ ] Configure dev environment

## Phase 1: Core

- [ ] Build 12-15 question questionnaire with save-state and resume support
- [ ] Implement the declarative scoring rubric in TypeScript (each answer maps to a number, number ranges map to one of three states)
- [ ] Build the verdict page rendering state + rationale + three concrete next actions
- [ ] Add markdown export of answers + verdict + next actions
- [ ] Add the 30-day "did this age well" email reminder, opt-in, easy to turn off
- [ ] Wire SQLite-backed anonymous answer store keyed by cookie
- [ ] Publish the rubric in the audit's footer so the founder can audit the audit
- [ ] Link two or three founder mental-health resources at the bottom of exhausted verdicts
- [ ] Write tests covering each scoring branch (still viable, exhausted, graduating)

## Phase 2: Deploy

- [ ] Create repo on GitHub
- [ ] Deploy to Vercel or Cloudflare Pages
- [ ] Verify in production
