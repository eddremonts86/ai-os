---
id: "4168"
slug: review-large-code-changes-in-your-terminal-one-chapter-
title: "Review large code changes in your terminal, one chapter at a time"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49511126"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Review large code changes in your terminal, one chapter at a time

## Problem

The author wanted a better way to review and give feedback on large agent-generated code changes without staring at walls of files or leaving the terminal multiplexer. Inspired by hunk and stage-cli, they combined and extended the ideas. Revue is a terminal-based code review tool that breaks a large change into ordered, narrated 'chapters', with an optional agent skill that can pre-generate a guided tour of the diff.


---

## Objective

Let a developer step through a large code change one chapter at a time inside the terminal, optionally narrated by an agent, and leave comments that flow back to the agent.


## Target Users

Developers using coding agents (and reviewing their output) who prefer to stay inside their terminal multiplexer rather than a web UI. Assumes comfort with TUIs and diff review.


## MVP Scope

- Terminal-based code review UI that breaks a diff into ordered chapters.
- A skill for an agent to pre-generate a narrated guided tour.
- Step-through navigation between chapters without leaving the multiplexer.
- Per-chapter comments that can be sent back to the agent.
- A `revue diff` command that gives the same UI without the narration.


## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Distribution is the terminal; the tool must feel native to TUIs and multiplexers.
- Optional agent skill means the core flow must work without an agent attached.
- Source post does not state pricing, monetisation, or hosting model.

