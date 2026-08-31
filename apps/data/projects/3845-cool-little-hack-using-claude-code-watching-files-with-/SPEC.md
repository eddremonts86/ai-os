---
id: "3845"
slug: cool-little-hack-using-claude-code-watching-files-with-
title: Cool little hack using Claude Code watching files with tail -f
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49499700"
category: ask-hn
date: "2026-08-30"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Cool little hack using Claude Code watching files with tail -f

## Problem

Claude Code will watch a file using tail -f and notice any change to the file waking up. Read cache tokens are 0.1x (10%) the cost of normal tokens so we want to use them. Every time a sub agent starts it has a fresh cache losing that benefit.Start a few chats with model and effort. Create a folder not tracked by git and put a .md document for each chat. Let the chat know to watch its own file for changes. Then start an orchestrator telling it which chats are watching which files. It will coordinate work between the chats like starting a sub agent but each will have that cheap read cache already set.

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
