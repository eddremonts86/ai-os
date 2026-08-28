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

## Value Proposition

One shared AI agent, but every tool call runs under the calling user's own credentials. The team keeps the agent's memory and configuration in one place; each user keeps their own access boundaries.

## Target Users

- Small teams that want a single coding, ops, or data agent without one person's credentials becoming the de facto admin.
- OSS maintainers sharing an agent with a curated list of collaborators.
- Platform teams inside companies rolling out agents across business units.

## Jobs To Be Done

- When I share an agent with my team, I want each collaborator to act under their own identity so I am not handing them my tokens.
- When I audit a tool call, I want to know exactly which user triggered it so the audit log is meaningful and not just "the agent did it".
- When I add or remove a collaborator, I want the permission change to apply immediately and visibly so I can revoke access without redeploying the agent.

## Success Metrics

- Number of agents registered on the broker.
- Number of distinct users connected per agent, as a sharing signal.
- Number of tool calls brokered per day, as a usage signal.
- Audit completeness: 100% of tool calls attributed to a user, no anonymous entries.

## Competitive Landscape

Multi-agent frameworks (CrewAI, LangGraph) exist, but the source does not name any direct competitor that scopes per-agent permissions cleanly when sharing agents.

## Risks & Open Questions

- OAuth refresh-token storage is the highest-value target in the system; the encryption-at-rest contract has to hold even if the database is compromised.
- The agent runtime must never receive raw tokens, only the broker's response — the API surface has to make that the only path.
- Tool providers have inconsistent OAuth scopes; a GitHub token for one user may not include the org scope another user has. The permission model has to handle partial scopes honestly.
- Whether the broker itself becomes a managed service or ships as something teams self-host is undecided.
