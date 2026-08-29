---
id: "857"
slug: lack-of-a-unified-hub-for-tasks-from-different-services
title: Lack of a unified hub for tasks from different services
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/productivity/7pukf4c5a1-lack-of-a-unified-hub-for-tasks-from-dif"
category: productivity
date: "2025-11-04"
tags: [Productivity, Other]
country: Serbia
tech: [SvelteKit, TypeScript, Go (chi), PostgreSQL, NATS (JetStream), OAuth 2.0 (provider integrations), Bun (worker runtime), Coolify, Docker]
---
# Lack of a unified hub for tasks from different services

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/857-lack-of-a-unified-hub-for-tasks-from-different-services/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up the SvelteKit inbox UI and the Go (chi) OAuth and write-back service
- [ ] Define the PostgreSQL schema for OAuth tokens (encrypted at rest), inbox indexes, per-user preferences, daily-digest schedules and audit logs
- [ ] Build the Bun provider-polling workers for the day-one provider list, pushing inbox-row updates onto NATS JetStream
- [ ] Build the OAuth consent screen naming each scope and the data it grants, with re-consent on scope expansion
- [ ] Implement the triage surface with complete, snooze, comment-on and defer actions, each enqueued onto NATS as a write-back event
- [ ] Implement the write-back workers that consume the events and call each provider's official API
- [ ] Add the offline-tolerant queue with staged triage actions and replay on reconnect with per-action status
- [ ] Implement the daily-digest worker that ranks inbox items by priority and sends a configurable daily digest
- [ ] Add the per-service view filter and the unified search across inbox indexes
- [ ] Add the operator integration catalogue route behind admin auth to add, scope and retire providers
- [ ] Render the non-replacement disclaimer on every connected-service view and on every daily-digest email
- [ ] Add the request-id-tied audit log across reads, write-backs and consent changes
- [ ] Define and document the retention policy for aggregated inbox data before any pilot user is onboarded

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
