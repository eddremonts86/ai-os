---
id: "4378"
slug: watn-type-a-question-in-your-shell-get-a-command-back
title: "Watn – type a question in your shell, get a command back"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49518777"
category: show-hn
date: "2026-09-01"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Watn – type a question in your shell, get a command back

## Problem

When trying to figure out some complex shell command (What's the actual incantation of the git command, find or ffmpeg for my usecase?),
i used to use https://github.com/kagisearch/ask for some time, which seems to be unmaintained.
Also it tied to openrouter and some predefined model list.
So i set out to build a better version.In the end, the new implementation added some new (maybe unique) features, like pressing CTRL-W in a shell prompt
and having the text being replaced by some proper command to be executed with enter.Here is a quick glimpse of what it looks like the terminal: $ find the top 5 largest files ever committed in this git repository (-> hit CTRL-W <-)
 $ git rev-list --objects --all | git cat-file --batch-check='%(objecttype) %(objectsize) %(rest)' | sed -n 's/^blob //p' | sort -rn | head -n 5

I'm curious to hear feedback and maybe someone else does find it useful as well.

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
