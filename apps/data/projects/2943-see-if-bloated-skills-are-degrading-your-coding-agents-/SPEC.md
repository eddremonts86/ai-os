---
id: "2943"
slug: see-if-bloated-skills-are-degrading-your-coding-agents-
title: "See if bloated 'skills' are degrading your coding agent's performance"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49435609"
category: show-hn
date: "2026-08-25"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# See if bloated 'skills' are degrading your coding agent's performance

## Problem

I read the 'Skills: Attention is all you have' paper from earlier this month and it struck a chord with me. They researched 50k agent skills and found that a ton of them have all these instructions to try to force invocation, as a result of which they all compete for attention and degrade the performance and usefulness.It's kind of a tragedy of the commons situation because if you develop a skill, of course you want to tell the agent to "BE SURE TO INVOKE THIS WHEN USER MENTIONS X" or whatever, but then all the skills add the same language and the agent doesn't know what to do.I built a skill grader to grade Agent skills based on the paper's methodology. Paste Github repo and see score.My own skill got a C, by the way, so I'm improving it by reducing keywords and description bloat, etc.I hope we can get to a place where users all reject the bloated skill trend... it just never made sense intuitively to have thousands of words of context loaded to do simple things.. cough G stack...

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
