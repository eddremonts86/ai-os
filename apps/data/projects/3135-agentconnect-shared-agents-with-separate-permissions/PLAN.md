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

## Tech Stack

- TypeScript end-to-end so the broker server, the OAuth callback handlers, and the agent-side SDK share types.
- Node.js for the broker; the workload is I/O bound (OAuth calls and outbound tool calls) and Node fits it.
- PostgreSQL for agents, users, roles, OAuth tokens (encrypted), permissions, and the audit log.
- OAuth 2.0 with PKCE for the per-user connections to tool providers (GitHub, Slack, etc.).
- JWT for the agent's session with the broker; the broker verifies the user identity before any tool call.

## Architecture

- A broker service holds the registry of agents, the per-user OAuth tokens (encrypted at rest), and the permission table.
- An agent-side SDK calls the broker instead of the tool provider directly; the broker resolves the calling user's token and performs the tool call on their behalf.
- A permission engine evaluates (agent, tool, user) against the permission table and either allows the call, denies it, or asks for an interactive confirmation step.
- An audit log records every call with the user identity, the agent identity, the tool, and the outcome.
- A small admin UI lets the agent owner set permissions per user or per role.

## Milestones

1. Broker server with the agents, users, and permissions schema in PostgreSQL.
2. OAuth callback handlers for the first tool provider (GitHub) with encrypted token storage.
3. Agent-side SDK that routes tool calls through the broker.
4. Permission engine and the admin UI for setting per-user / per-role permissions.
5. Audit log table and a per-agent log viewer.
6. Confirmation-step path for sensitive tools (delete, force-push).

## Risks

- Token encryption at rest is only as good as the key-management story; the broker needs a documented KMS path or at least a clear warning when using a local key.
- The agent SDK must not accidentally bypass the broker; code review and a runtime check that all outbound calls go through the broker are both necessary.
- OAuth scopes differ per user; the permission UI must surface "user X has fewer scopes than the agent needs" rather than fail silently.
- A revoked user must be unable to finish in-flight tool calls; the broker has to check revocation before each call, not only at session start.
