---
id: "3135"
slug: agentconnect-shared-agents-with-separate-permissions
title: "AgentConnect, shared agents with separate permissions"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49449307"
  captured: "2026-08-26"
category: show-hn
date: "2026-08-26"
tags: [Show HN, AI, Agents, Permissions, Collaboration]
tech: [TypeScript, Node.js, PostgreSQL, OAuth 2.0, JWT]
---
# AgentConnect, shared agents with separate permissions

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3135-agentconnect-shared-agents-with-separate-permissions/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment
- [ ] Stand up PostgreSQL via Docker with the agents/users/permissions/audit-log schema
- [ ] Provision a GitHub OAuth app for the first provider integration

## Phase 1: Core

- [ ] Broker server with the agents, users, and permissions schema
- [ ] OAuth callback handler for the first provider (GitHub) with PKCE and encrypted token storage
- [ ] Agent-side SDK that routes tool calls through the broker
- [ ] Permission engine evaluating (agent, tool, user) against the permission table
- [ ] Admin UI for setting per-user and per-role permissions
- [ ] Audit log table and per-agent log viewer
- [ ] Confirmation-step path for sensitive tools (delete, force-push)
- [ ] Runtime guard that all outbound calls go through the broker

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-26_
