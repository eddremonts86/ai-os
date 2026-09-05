---
id: "5095"
slug: casefile-git-why-for-ai-assisted-development
title: Casefile – Git why for AI-assisted development
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49564994"
category: show-hn
date: "2026-09-04"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Casefile – Git why for AI-assisted development

## Problem

During my work at Brokk last year we developed a task-slicing system. The idea was to have a bunch of tasks where each task can be implemented and verified in isolation. So I can mentally focus only on one task at a time with checking the evidence it works as expected. Most follow-up tasks are based on their predecessor(s).After my time at Brokk I picked up this idea and developed Casefile. To avoid loading the entire previous session context, the agent creates a task log. So a follow-up task only needs to load the necessary task logs + git state as the base to implement its task. Each log is linked to its commit, so git blame on a line leads back to the decision behind it. Another advantage of this approach is that you can retrieve the intent why a code change was made and which alternative solutions were skipped. You can see the workflow in the open at https://github.com/native-federation/devtools.Last month I extended the system to store the plan and task logs in a non-public Casefile repository because my enterprise customers don't allow work artifacts like these in their repositories.Give it a shot if you think it's useful. I would like to hear your feedback!

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
