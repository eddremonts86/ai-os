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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3348-i-built-an-agent-first-productivity-bridge-for-all-your/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up a TypeScript MCP server using the official SDK that exposes both the new stateless HTTP configuration and standard SSE
- [ ] Define task and note CRUD tools plus "due soon" and weekly-planning queries the agent can call from inside a conversation
- [ ] Model the attribution log so every mutation is stamped as either the user (web) or a named MCP client (agent)
- [ ] Persist tasks, notes and attribution to a single SQLite store
- [ ] Add server-side source validation so an agent cannot write to the store stamped as the user
- [ ] Build a React web dashboard that reads and writes the same SQLite store for manual updates and phone access
- [ ] Render attribution badges in the dashboard so the user can tell what they did from what each agent did
- [ ] Wire the in-app "report bug" form to a feedback endpoint the author can read
- [ ] Verify the multi-agent scenario: connect Cursor, Codex, Claude Code, Kilo Code and OpenCode in turn and confirm task state does not drift across switches

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-27_