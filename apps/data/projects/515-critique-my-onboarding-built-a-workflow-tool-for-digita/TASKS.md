---
id: "515"
slug: critique-my-onboarding-built-a-workflow-tool-for-digita
title: Critique my onboarding? Built a workflow tool for digital marketing managers
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo4lzy/critique_my_onboarding_built_a_workflow_tool_for/"
category: saas
date: "2026-08-14"
---
# Critique my onboarding? Built a workflow tool for digital marketing managers

## Phase 0: Scaffold

- [x] Capture problem from Reddit + write SPEC.md skeleton
- [ ] Define DESIGN.md (onboarding palette, step density)
- [ ] Provision SvelteKit + Postgres project on Vercel
- [ ] Wire Anthropic Claude API key + prompt template
- [ ] Stand up Mixpanel for step timing

## Phase 1: Core

- [ ] Onboarding: brand → channels → audience → current KPIs → target KPIs → time horizon → review
- [ ] Per-step validation: can't proceed until required fields filled
- [ ] LLM strategy-map generation with structured JSON output + Zod validation
- [ ] Strategy map rendering: channel mix, budget split, weekly cadence, KPIs
- [ ] PDF export via Puppeteer
- [ ] Notion export via Notion API (per-user OAuth)
- [ ] Feedback card (thumbs-up/down + free-text) shown after strategy map renders
- [ ] Email gate appears before export (post-validation)
- [ ] End-to-end test: visitor → onboarding → strategy map → PDF download

## Phase 2: Deploy

- [ ] Recruit 5 US marketing managers for validation sessions
- [ ] Coolify-side deployment of SvelteKit backend
- [ ] Set up LLM cost monitoring + per-user rate limits

---

_Generated automatically by Lúa on 2026-08-14_
