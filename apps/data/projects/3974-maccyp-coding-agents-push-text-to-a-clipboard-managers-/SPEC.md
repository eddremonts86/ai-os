---
id: "3974"
slug: maccyp-coding-agents-push-text-to-a-clipboard-managers-
title: "MaCcyP – coding agents push text to a clipboard manager's Agents view"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49505100"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# MaCcyP – coding agents push text to a clipboard manager's Agents view

## Problem

I recently forked https://github.com/p0deje/Maccy to make coding agents or even just regular old Claude Desktop work better with it. Coding agents are constantly writing text they expect you to copy and then paste somewhere else — a command for another terminal, JS for the browser console, SQL, a drafted reply. MaCcyP ("Maccy Put") is a fork of the Maccy clipboard manager where agents push that text into a separate Agents view in the maccy popup proactively so you don't have to hunt through conversations and fumble with copying, saving you time and errors (and maybe your wrists too!). For the question about why not just use regular maccy + letting agents pbcopy to your clipboard, that works pretty well but the agents can't be as proactive in putting stuff into your clipboard contents because it can just be too much noise. With this approach it's much more contained and enables some other nice features.Features:
* Agents view beside your clipboard history. Each agent session gets its own conversation as a private space — the key it holds can't see, list, or touch any other conversation or see your regular clipboard history either.
* Secrets masked on screen — whole items or just the marked spans; paste yields the real value
* Runbooks arrive as one batch: an agent pushes a multi-step sequence in a single call — steps display in order, one notification instead of N, and each step is its own paste
* Preview pane: select and copy just a fragment, or ⌘O any item into an editable scratchpad window (a scratch copy, never written back)
* Syntax highlighting, multi-item runbook batches, opt-in notification banners with a Copy button
* Local-only: a Unix socket inside the app sandbox, no network. Upstream Maccy's behavior is unchangedmaccy-put skill (Claude Code):
Teaches the agent to push proactively — the moment it writes destination-shaped text, without asking — and to announce it with a stable transcript marker (→ put in MaCcyP: …). Companion maccy-revise skill corrects items on requestMCP server (bundled in the app):
put / put_batch / list / get / update / delete, per-span sensitive marking, language hints — stdio, works with Claude Code, Claude Desktop, anything that speaks MCP; a plain CLI covers harnesses that don't
Install: notarized zip → drag to /Applications. Claude Code: claude plugin marketplace add harleensahni/MaCcyP, then claude plugin install maccyp@maccyp.https://github.com/harleensahni/MaCcyP — signed + notarized, macOS 14+. Built on the excellent Maccy by Alexey Rodionov, which I've been using for a long time. Even if you're not interested in maccyp, definitely checkout maccy.

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
