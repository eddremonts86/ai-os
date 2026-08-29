---
id: "3645"
slug: yuktaai-turn-visitor-intent-into-revenue-with-agentic-a
title: YUKTAAI – Turn visitor intent into revenue with Agentic AI conversion intelligence
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/yuktaai?utm_campaign=startup-180510&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-28"
tags: [BetaList, Beta, Product]
tech: [TypeScript, Node.js (NestJS), PostgreSQL, Redis, OpenAI API, LangGraph, WhatsApp Cloud API, Next.js]
---
# YUKTAAI – Turn visitor intent into revenue with Agentic AI conversion intelligence

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3645-yuktaai-turn-visitor-intent-into-revenue-with-agentic-a/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the channel adapters for the website widget, WhatsApp Cloud API and one business-app surface into a common envelope
- [ ] Implement the LangGraph state machine with the qualify, recommend, book and hand-off branches
- [ ] Ship the per-operator catalogue with an admin surface that is the single source of truth
- [ ] Add the structured qualification step with operator-configurable inputs and per-visitor persistence
- [ ] Implement the booking branch that writes to the operator's calendar and confirms back
- [ ] Implement the human handoff with conversation history and qualification result attached
- [ ] Add the conversion-likelihood ranking layer with a stated, even if uncalibrated, scoring function
- [ ] Carry the visitor identifier across web and WhatsApp so the same session survives a surface switch
- [ ] Document the WhatsApp 24-hour window and template rules so the agent does not violate Meta's policy
- [ ] Verify catalogue coverage on real recommendations: every recommendation traces to an operator-entered row
- [ ] Document the retention and deletion posture for conversation history explicitly to the operator

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
