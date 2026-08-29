---
id: "3673"
slug: is-an-agent-with-tools-the-only-valid-llm-application
title: "Is \"An agent with tools\" the only valid LLM application?"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49484000"
category: ask-hn
date: "2026-08-28"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Is "An agent with tools" the only valid LLM application?

## Problem

Brex's CEO said this and I understand where he comes from, but is there a place for end to end workflows in LLM based applications? At the end of the day I agree that cutting edge software should be fully usable by agents, but I can't decide if every product should be an agent. I personally hate the UX of most agentic applications. I have this fantasy of future products where I can simply enter input X and get output Y without having to give feedback on every little thing. Of course when you're designing something it needs to be a process, but what if I can tell my phone to "buy dinner" and it just does it without bothering me at every step? What if it was just good enough? I think a conversable agent is necessary as long as the application is unsure of the accuracy of the output, but I wonder if the UX of LLM applications could be more like a rich person fixing their car, like here is my situation, just do what you need to do and don't bother me.

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
