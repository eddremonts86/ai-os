---
id: "3348"
slug: i-built-an-agent-first-productivity-bridge-for-all-your
title: I built an agent-first productivity bridge for all your agents
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49461578"
category: show-hn
date: "2026-08-27"
tags: [Show HN, Product, Problem]
tech: [TypeScript, Model Context Protocol (stateless HTTP and SSE transports), Node.js MCP server, SQLite, web dashboard (React)]
---

# I built an agent-first productivity bridge for all your agents

## Tech Stack

TypeScript end to end; an MCP server built on the official TypeScript SDK that exposes both the new stateless HTTP configuration and standard SSE so setup is a single prompt from any MCP-compatible harness (Cursor, Codex, Claude Code, Kilo Code, OpenCode); SQLite as the shared task store; a React web dashboard for manual updates and phone use; token-based attribution so every mutation is stamped as either the user via the web app or a named agent via the MCP bridge.

Justification: the post's whole pitch is that the product is a first-class MCP platform — so the protocol SDK and its two transports are the load-bearing pieces, and a single SQLite store is the smallest thing that gives the multi-agent sync story the post describes. The legacy default of a TanStack Start server, Coolify, and Docker would substitute a heavier backend stack for what is essentially an MCP server plus a small web UI.

## Architecture

A TypeScript MCP server speaks both stateless HTTP and SSE so any MCP-compatible client can connect with one prompt. The server fronts a SQLite store that holds tasks, notes and an attribution log keyed to either a user session or an MCP client identity. Tool definitions cover the full CRUD surface plus two cross-cutting queries the author names — "what's due soon" and "plan my week" — so the agent can both read the store and reason over it from inside the same conversation. The same SQLite store is read and written by a React web dashboard that fronts the user identity, so manual edits and on-the-go phone access share one task state with the agents. Every mutation, whether from MCP or from the web, writes an attribution row so the UI can show what the user did versus what each agent did. The "report bug" form in the web app feeds the author's feedback channel.

## Milestones

- **M1 — MCP server with both transports:** stateless HTTP and SSE plumbing, task CRUD tool definitions, attribution model.
- **M2 — Cross-agent sync:** verification that switching from Codex to Claude Code to OpenCode in one session preserves task state with no drift.
- **M3 — Web dashboard:** React UI for tasks, notes, weekly planning, with the same SQLite backing store.
- **M4 — Attribution UX:** every entry shows whether it came from the user (web) or from a specific agent (MCP), with a server-side validator so the label cannot be spoofed.
- **M5 — Launch:** ProductHunt listing, free-tier onboarding, in-app "report bug" form wired up.

## Risks

The MCP specification is evolving, and supporting both stateless HTTP and standard SSE today is work the author has shipped but is not "done"; if a major coding agent forks from MCP to a competing tool-plugging standard, the cross-agent sync story collapses; web-app attribution can be spoofed by an agent posting as the user unless the server validates the source on every mutation; there is no retention mechanism stated beyond the daily agent session, so weekend-day and break-week churn are open questions; pricing and tiering are unstated — the post says free today but gives no anchor for a paid tier.