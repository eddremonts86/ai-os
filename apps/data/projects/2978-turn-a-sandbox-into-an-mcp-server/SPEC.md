---
id: "2978"
slug: turn-a-sandbox-into-an-mcp-server
title: Turn a Sandbox into an MCP Server
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49433211"
category: show-hn
date: "2026-08-25"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Turn a Sandbox into an MCP Server

## Problem

mcpd is a way to expose sandbox environments as MCP servers using just configuration. In the repo, I have some example config files that mimic popular coding harness tools.I've been using it to give my cloud agents code search tools on private repos I manage. I have a script that syncs project code to the sandbox on deploy and I can connect it to my cloud agents and debug in Slack. It's awesome in combination with the Sentry MCP. I'm working on a secure way to have the agent open up PRs too.My general thesis is the agent loop should be unprivileged and run remotely and tool execution should be separate and sandboxed. Disconnecting the loop and the tool execution environments opens up a lot of cool possibilities.

---

## Objective

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
