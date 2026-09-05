---
id: "3883"
slug: podiom-durable-sessions-scheduling-and-goals-for-local-
title: "Podiom – durable sessions, scheduling and goals for local Claude/Codex"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49498323"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Local agent orchestration layer, Durable session storage, Scheduler, MCP tool integration, CLI agent integration, Goal tracking]
---
# Podiom – durable sessions, scheduling and goals for local Claude/Codex

## Problem

The capture is a URL-only Show HN post pointing at github.com/Podiom/Podiom; the product claim is the title — durable sessions, scheduling and goals for local Claude/Codex — and the repository describes Podiom as a thin orchestration layer for local LLM agents, with durable sessions, profiles, scheduling, and native MCP, tool and skill integration. The capture itself contains no post body beyond the title and URL.

## Objective

Ship Podiom as the thin orchestration layer the repo describes: durable sessions that survive restarts for local Claude and Codex runs, profiles, scheduling of agent work, and native integration with MCP servers, tools and skills. The MVP is the working layer covering sessions, scheduling and goals, running against local CLI agents.

## Target Users

- Developers running Claude Code or Codex locally who lose session context when a run restarts or a machine reboots.
- Solo builders who want to schedule agent jobs and track goals across sessions rather than running everything by hand.
- People extending local agents with MCP servers and skills who want one layer managing all of it.

## MVP Scope

- Durable session storage: agent sessions persist across restarts.
- Scheduling: agent runs can be planned and triggered without sitting at the terminal.
- Goals: named objectives tracked across sessions.
- Native MCP, tool and skill integration as part of the orchestration layer.

## Constraints

- The layer must stay thin: it orchestrates local agents, it does not replace Claude or Codex themselves.
- Everything the capture states is title plus repository description; no usage evidence exists.
- Local-first: the value proposition assumes local CLI agents, not hosted agent fleets.

## Design Direction

See `DESIGN.md` for this project's design tokens.
