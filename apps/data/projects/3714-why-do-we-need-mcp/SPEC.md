---
id: "3714"
slug: why-do-we-need-mcp
title: Why do we need MCP?
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49488654"
category: ask-hn
date: "2026-08-29"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Why do we need MCP?

## Problem

The Ask HN thread "Why do we need MCP?" is a discussion, not a buildable product. The OP argues that publishing API docs and letting the client's bot chain calls together is enough, and even suggests reusing MCP to produce only API documentation as every response, with no LLM required. Other commenters note they already drive Git, Atlassian (ACLI), Metabase, and custom SigNoz shell scripts from the command line in place of an MCP server, and they say it works very well for them. Defenders of MCP in the same thread counter that the dedicated spec unlocks client-side features that fall out of the LLM loop (OAuth flows, elicitation, prompts and resources), and that server-sent notifications only become realistic with a shared protocol. The thread captures a real tension — open HTTP/REST vs. a model-aware tool spec — without pointing at a single product to build.

Because the source is a discussion rather than a buildable product, this plan stays as `draft`. The corpus records the question; downstream readers should treat it as commentary on the MCP ecosystem, not as MVP scope.

## Objective

## Target Users

## MVP Scope

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints
