---
id: "3700"
slug: airo-an-ai-chief-of-staff-so-nothing-falls-through-the-
title: Airo – An AI chief of staff so nothing falls through the cracks
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/useairo?utm_campaign=startup-175029&utm_medium=atom&utm_source=newsfeed"
  captured: "2026-08-28"
category: beta
date: "2026-08-28"
tags: [BetaList, Beta, Product]
tech: [Python (FastAPI backend), TypeScript (Next.js chat UI), Postgres, OAuth integrations (Google Workspace, Stripe, QuickBooks, Notion)]
---
# Airo – An AI chief of staff so nothing falls through the cracks

## Phase 0: Scaffold

- [x] Capture BetaList listing at betalist.com/startups/useairo
- [ ] Define connector-verb interface: each connector exposes typed verbs (`read_*`, `draft_*`, `send_*`, `create_*`, `share_*`); side-effect verbs tagged
- [ ] Provision FastAPI skeleton + Postgres schema (workspaces, instructions, plans, audit_log)
- [ ] Provision Next.js chat surface (left rail history, centre live plan, right rail assembled artefact)
- [ ] Stand up audit log table: timestamp, instruction_id, tool, verb, target_resource, approval_status
- [ ] Define approval-token scheme: a per-instruction token issued only after the assembled artefact is shown to the operator

## Phase 1: Core

- [ ] Planner: convert a single-sentence instruction into a step list (tool, verb, resource), exposed to the operator before execution
- [ ] Executor: run read-only connector verbs end-to-end and assemble intermediate artefacts
- [ ] Google Workspace connector: read Gmail, read Calendar, draft Drive doc, draft Doc — no send / share in v1
- [ ] Stripe connector: read invoice list, draft a new invoice — no send / create-in-stripe in v1
- [ ] Notion connector: read page, draft new page — no publish / share in v1
- [ ] Approval gate middleware: refuse any side-effect verb (`send_*`, `create_*`, `share_*`) without a valid approval token
- [ ] Approval UX: operator sees assembled artefact, clicks "approve" or "deny"; click writes to audit log
- [ ] Operator-visible connector scope list: show every OAuth scope the operator has granted, with one-click revoke
- [ ] Activity log view: "what did Airo do this week?" — list of every connector call and its approval status
- [ ] End-to-end test: instruction "chase the May invoice" → planner drafts email and invoice → operator approves → audit log records both calls

## Phase 2: Deploy

- [ ] Onboard 25 beta solo founders
- [ ] Weekly review of approval rates and per-connector adoption
- [ ] Move Stripe payment + paid plan to live mode
- [ ] Mobile text surface (separate workstream, same approval gate, same audit log)
- [ ] Post-mortem at week 14: approval rate, time-saved proxy, unapproved-call count (must be zero)
