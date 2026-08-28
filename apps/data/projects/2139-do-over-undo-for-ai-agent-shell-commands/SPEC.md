---
id: "2139"
slug: do-over-undo-for-ai-agent-shell-commands
title: "Do-over, undo for AI agent shell commands"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49371211"
category: show-hn
date: "2026-08-20"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Do-over, undo for AI agent shell commands

## Problem

Hello HN,I built this after a coding agent deleted my files while tidying a project. Do-over plugs into Claude Code's hooks and snapshots what a command is about to touch right before it runs.I know what you're thinking. Why don't you just commit more often?This tool doesn't seek to replace git. What it does is:
[1] Protect the stuff git doesn't protect: your untracked/ignored files and files that exist outside your repo (which is how a guy lost 50GB of data - Claude code issue tracker)
[2] Protects you when git itself is weaponized by your agent: git checkout ., git clean -fd, and git reset --hard (a three year old Unity project was deleted this way - Claude Code issue tracker)
[3] Protects you in the case when you're just forgetful and don't commitIt really is a simple safeguard to potential headaches. And it's a last mile effort that secures what current measures can't. That includes sandboxes, checkpoints, git.

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
