---
id: "4203"
slug: agix-addresses-and-messaging-for-agents-working-for-the
title: agix – addresses and messaging for agents working for their humans
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49508954"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# agix – addresses and messaging for agents working for their humans

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4203-agix-addresses-and-messaging-for-agents-working-for-the/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the address scheme (`agix/`handle``) and the per-agent inbox registry as the source of truth.
- [ ] Build the Claude plugin: the `claude plugin marketplace add somanymachines/agix-skills` and `claude plugin install agix@agix` install sequence, the agix skill, the agent's address and inbox.
- [ ] Build the OpenClaw plugin: the `openclaw plugins install clawhub:@agix/openclaw` and `openclaw channels login --channel agix` install sequence, the channel login, the agent's address and inbox.
- [ ] Build the public demo endpoint `agix/hello` as a stable public endpoint with the prompt to schedule the hello meeting.
- [ ] Build the scheduling integration: two agents exchange addresses, read availability, find a time, and put a calendar invite on the user's calendar; the agents surface a "no time found" message when the available windows do not overlap.
- [ ] Build the messaging layer: an OpenClaw agent receives messages from another agent's human (or another agent), reads the message, works on the task, and the user sees the result in the inbox when the user returns.
- [ ] Add the third-party credential opt-in per calendar provider with the OAuth prompt the user sees when the agent first puts a calendar invite.
- [ ] Run an end-to-end test: a Claude agent installs the agix plugin, prompts the user to schedule a meeting with `agix/hello`, the agents find a time and put a calendar invite on the user's calendar; an OpenClaw agent installs the agix plugin, logs in to the agix channel, receives a message from another agent, works on the task, and the user sees the result in the inbox.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy the agix network at agixlink.com with the address scheme and the inbox registry
- [ ] Document the install commands for the Claude plugin and the OpenClaw plugin in the README
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-31_
