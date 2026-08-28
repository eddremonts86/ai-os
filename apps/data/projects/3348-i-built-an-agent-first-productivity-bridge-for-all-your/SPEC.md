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

## Problem

The author is a product designer who moved from pure design to shipping complete products and ended up using AI coding agents literally every day, working through Cursor, then Codex and Claude Code, then Kilo Code, and now OpenCode. The one thing those agents couldn't handle was keeping their todos and tasks across projects straight: the workaround was either a vibe-coded todo app or a separate tool like TickTick, both of which forced the author to context-switch mid-session and re-paste the tasks they wanted done into the agent over and over. The fix was to hand the agents the full todo list and CRUD tools directly, so the user can prompt them to check what's due, update tasks, add notes, create new ones or plan the week — all inside the same conversation as the project they are working on through OpenCode, including mid-session asks like "add a subtask based on what you just produced". The author built it as a first-class MCP platform that supports the new stateless HTTP configuration as well as the standard SSE, so setup is a single prompt and the agents stay in sync with the actual work state immediately. It works with any harness or app that supports MCPs, so multiple agents (Codex first, then Claude Code, then OpenCode in the same day) all stay in sync with the same tasks. There is also a web-app UI for manual updates and on-the-go phone use, and every entry is attributed to either the user (in the web app) or one of their agents (through the MCP bridge).

## Objective

Be the todo and task layer every MCP-compatible coding agent can read and write to without context-switching, so a single shared task state stays in sync across every harness the user touches in a session and survives the switch from one agent to the next.

## Target Users

Product designers and indie developers who use MCP-capable coding agents daily (Codex, Claude Code, Kilo Code, OpenCode, Cursor) and whose current workaround for tracking todos across projects is either a separate todo app or repeated re-pasting of context into each agent session. A secondary on-the-go user is the same person opening the web app from a phone to add or check a task.

## MVP Scope

Ship a shared task store exposed through a first-class MCP server that supports both the new stateless HTTP configuration and standard SSE so setup is a single prompt; expose CRUD tools for tasks and notes plus "due soon" and weekly-planning queries so agents can do the full set of operations inside the conversation; serve the same data through a web-app UI so users can update tasks manually or from a phone; attribute every change to either the user (web) or a named agent (MCP); and onboard an initial user through a ProductHunt launch with a free tier.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

Must speak the Model Context Protocol correctly across both stateless HTTP and standard SSE so it works with every MCP-compatible agent the author names (Cursor, Codex, Claude Code, Kilo Code, OpenCode); every task mutation must attribute its source as either the user via the web app or a specific agent via the MCP bridge; must remain a "single source of truth" shared by every agent in a session so switching from Codex to Claude Code to OpenCode does not produce drift; must keep setup to a single prompt from the user's perspective.