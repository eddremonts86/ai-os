---
id: "4519"
slug: hn-match-maker-matching-who-wants-to-be-hired-with-whos
title: "HN Match Maker – Matching \"Who Wants to Be Hired?\" With \"Who's Hiring?\""
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49528057"
category: show-hn
date: "2026-09-01"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# HN Match Maker – Matching "Who Wants to Be Hired?" With "Who's Hiring?"

## Problem

Hi!Every month the "Who Wants to Be Hired?" and "Who's Hiring?" Threads come through I would think to myself, "there should be a match maker for these two threads".So I had abacus.ai whip one up. The methodology is pretty simple, data is extracted from posts using an LLM, score matches based on salary, domain experience, remote/onsite, etc., and then eliminate incompatible postings, like 'looking for remote work' and 'onsite only'. The result is two views: jobs-by-user and user-by-jobs.If you've submitted a post to this month's 'Who Wants to Be Hired?", you can find your matching job listings at https://hnmatchmaker.com/user/:user_name, for example https://hnmatchmaker.com/user/G4Vi---Some observations when looking at the matches pair up right now:Poke around, let me know what you think!Ultimately, I hope this is actually helpful to some folks.

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
