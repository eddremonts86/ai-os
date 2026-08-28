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

The product is a task store built on the Model Context Protocol that lets AI coding agents read, create and update todos inside the same conversation where the user is shipping code, so a single task state follows the user across Cursor, Codex, Claude Code, Kilo Code and OpenCode in a single day. A web-app UI exposes the same store for manual edits and on-the-go phone use, and every mutation is attributed to either the user or a named agent.

**One-liner:** a shared todo layer every MCP-capable agent can read and write, so context-switching between agents no longer breaks your task list.

## Value Proposition

The product removes the context-switch tax between an MCP-compatible coding agent and the user's todo system. Instead of running a separate TickTick-or-similar app and re-pasting the day's tasks into every agent, the user hands the agent the full todo list and CRUD tools through a first-class MCP platform that supports both the new stateless HTTP configuration and standard SSE — so setup is a single prompt and the agent stays in sync with the actual work state. The same store is exposed through a web-app UI for manual updates and on-the-go phone use, and every change is attributed to either the user (via the web) or the agent that made it (via the MCP bridge). It works with any harness that supports MCPs, which means Codex, Claude Code and OpenCode in the same day all stay in sync with the same tasks.

## Target Users

Product designers and indie developers who use MCP-compatible AI coding agents daily (Cursor, Codex, Claude Code, Kilo Code, OpenCode) and whose current workaround for tracking todos across projects is either a separate todo app or repeated re-pasting of context into each agent session. The same person on their phone, opening the web app to check or add a task on the go, is a secondary use case the author built in deliberately.

## Jobs To Be Done

When I'm working in Cursor, Codex, Claude Code, Kilo Code or OpenCode, give me a single task state that survives the switch between them; when the agent produces something, let me add a subtask based on that output without leaving the conversation; when I need to plan my week, let the agent do it from the same todo store; when I'm on my phone, let me add or check a task through the web app; when something goes wrong, give me a "report bug" path so I can flag it to the author.

## Success Metrics

Number of MCP-connected agents per active user; share of users running two or more MCP-compatible harnesses in a session (the multi-agent scenario the post centers on); task mutations per day per user, with attribution split between "user via web" and "agent via MCP"; time from MCP setup to first successful agent-side task mutation; ProductHunt traction in the launch window; bug-report rate through the in-app "report bug" form.

## Pricing & Monetization

The author is not in the post on a pricing model — only that it is free to try today and was launched on ProductHunt. The product has a web-app UI and a "report bug" form, which together suggest a freemium surface is plausible but no number or tier is stated. Absent the post naming a price, there is no `wtp` to record.

## Competitive Landscape

The post positions the product against vibe-coded personal todo apps and against standalone tools like TickTick. The author argues those break because they force the user to context-switch and re-paste tasks into every agent session, whereas a first-class MCP platform that supports both stateless HTTP and SSE keeps every MCP-capable agent — Codex, Claude Code, OpenCode and others — reading and writing the same store. The product's moat is the cross-harness sync story rather than a richer todo model.

## Risks & Open Questions

The MCP protocol is evolving — supporting both stateless HTTP and standard SSE today is work the author has done, but keeping up with MCP specification churn is a real maintenance cost; if major coding agents fragment from MCP to a competing tool-plugging standard the cross-agent sync story breaks; the "report bug" path is the only feedback channel the post names, so it is unclear how paid positioning will land without more product-market signal; web-app attribution could be spoofed by agents posting as the user and needs server validation; the product has no stated retention mechanism beyond the daily agent session, so weekend-day and break-week churn are open questions.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49461578) · **Category:** show-hn · **Tags:** Show HN,Product,Problem