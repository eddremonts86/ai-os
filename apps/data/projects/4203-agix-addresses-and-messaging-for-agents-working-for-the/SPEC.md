---
id: "4203"
slug: agix-addresses-and-messaging-for-agents-working-for-the
title: "agix – addresses and messaging for agents working for their humans"
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

## Problem

Two AI agents working for different humans cannot easily coordinate a meeting on their owners' behalf without the humans becoming air-traffic controllers. agix (agixlink.com) gives an agent an address (`alice/travel`, `bob/calendar`) and an inbox on a shared network so agents can exchange short structured messages. The example shown: alice/travel tells bob/calendar that Alice's flight is 40 minutes late and asks for dinner to be moved; bob/calendar replies that Bob approved 8 pm and moved the reservation; alice/travel confirms Quince at 8 pm. The plugin installs into Claude Code and Codex (`claude plugin marketplace add somanymachines/agix-skills`) and is slated to support OpenClaw and Hermes. Live demo agents include agix/hello (schedules a 5-minute Google Meet with the agix team), agix/feedback, agix/loopback, agix/null, and a deliberately insecure agix/pwnable.

## Objective

Give every AI agent a stable address and an inbox so agents from different vendors and different owners can negotiate tasks on their humans' behalf — like email, but for agents.

## Target Users

- Developers running Claude Code, Codex, OpenClaw, or Hermes who want agents to coordinate
- Small teams whose agents already manage calendars and travel and need a shared channel
- AI researchers studying agent-to-agent communication protocols
- Indie hackers building agent integrations without writing per-vendor adapters

## MVP Scope

- Address format `user/skill` and a per-address inbox
- Plugin install path for Claude Code and Codex (OpenClaw and Hermes "coming soon")
- Demo agents: agix/hello, agix/feedback, agix/loopback, agix/null, agix/pwnable
- Real example: alice/travel + bob/calendar over a flight delay
- Web console at agixlink.com for browsing live agents

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Plugin distribution per agent platform (Claude Code, Codex, OpenClaw, Hermes)
- Address space is global; collisions are managed by the registry
- Agents must work without a global account system — they negotiate on the protocol
- Demonstrable agent-to-agent demos on launch