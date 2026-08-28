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

## Problem

When a team wants to share an AI agent — for example, a coding agent that posts PR comments or a data agent that writes to a shared warehouse — the agent's credentials usually belong to one person. Every collaborator either uses that one person's tokens (giving them full access to whatever the agent can do) or gets their own copy of the agent with their own tokens (so no one benefits from the shared memory and shared configuration). The AgentConnect pitch is to keep a single shared agent while letting each collaborator connect with their own OAuth identity, so the agent's actions are scoped per-user.

## Objective

Ship a server that sits in front of a shared AI agent and brokers tool calls: the agent keeps a single configuration and shared memory, but every tool call is performed under the calling user's identity, so the agent never holds a credential it should not.

## Target Users

- Small teams sharing a coding, ops, or data agent across multiple humans.
- OSS maintainers who want to let trusted collaborators run a shared agent without giving any one person broad credentials.
- Platform teams inside companies who need to share agents across business units without violating least-privilege.

## MVP Scope

- A central AgentConnect server that holds the shared agent's configuration and memory.
- Per-user OAuth connections to the tool providers the agent uses (GitHub, Slack, a warehouse, etc.).
- A request broker: when the agent needs to call a tool, the server invokes it using the calling user's connected account.
- A permission model per agent: each tool is allowed per user or per role, set by the agent's owner.
- An audit log of every tool call, attributing it to the user that triggered it.
- Out of scope: marketplace of agents, billing, on-prem deployment with air-gapped tooling.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The agent itself never stores user credentials; the broker is the only path from agent intent to tool call.
- Every tool call is attributed to a specific user and recorded in the audit log; no anonymous execution.
- Per-user OAuth tokens are encrypted at rest with a key the agent runtime cannot read.
- Permission changes take effect on the next call, not retroactively; historical audit entries never change.
