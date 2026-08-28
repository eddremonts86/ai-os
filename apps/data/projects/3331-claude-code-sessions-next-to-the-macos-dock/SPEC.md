---
id: "3331"
slug: claude-code-sessions-next-to-the-macos-dock
title: Claude Code sessions next to the macOS dock
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49462982"
category: show-hn
date: "2026-08-27"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Claude Code sessions next to the macOS dock

## Problem

Ever since I started orchestrating multiple agent sessions in Claude Code, it's always been a challenge to keep track of which sessions are ongoing, need my input and are complete. Sometimes, there are 5+ agents running at the same time. I usually keep a single terminal window with multiple tabs and an agent view tab.One thing I usually do is go do something else while my agents are working, like scrolling on X, reading articles and stuff. When I do that, i had no way to see what was happening in the agent sessions. I had to switch back to the terminal window to see the sessions state. sometimes i got carried away and 5 agents needed input for a long time.since we're all in a rant to be fast and break things, i wanted a way to have my sessions state always visible. so i created Port.i looked at the macOS dock and the empty space to its left, and I thought that's it.port is a tiny window that shows claude code sessions state. it fills the blank space to the left of the macOS dock and tracks its height so that it never interferes with anything. it persists across all desktops.we're using a unused space to show information. now whenever i'm doing something else, i get a view and a notification if a session needs my input or it's complete.it's a tiny project, there are probably other workarounds, so feedback is important. i've built this for the way that I work and that I would like to keep track of my sessions. hearing from you guys is what would make me actually keep building it for further improvements.

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
