---
id: "4892"
slug: instantly-get-the-transcript-from-the-agent-that-wrote
title: Instantly get the transcript from the agent that wrote any line of code
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49550141"
category: show-hn
date: "2026-09-03"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Instantly get the transcript from the agent that wrote any line of code

## Problem

This is basically "git blame but for agent sessions".In the olden days, we would use git blame (or gitlens extension) to see what body of work a certain line range or file was a part of. We would look back at the PR to see why something was done a certain way.While agents can still do this part well, we can now take it a step further: we can surface the entire agent session from when the code was originally committed! You (or rather your agent) can go back and read the entire original transcript from when it was done.This is very helpful for figuring out why something was done wrong. Maybe a missed assumption, maybe just regular slop. Either way it helps a ton to reference the original implementation session.This is an extra capability, you can also use the regular search to pull up old sessions and work.It runs fully locally and has a pretty cool set of performance optimizations if you care to look into what makes it so fast.I built it for myself and didn't look at my own usage levels until this week and realized the search and blame commands are being used over 1k times per day (yes it's a lot, but against 5b tokens per day it's reasonable).

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
