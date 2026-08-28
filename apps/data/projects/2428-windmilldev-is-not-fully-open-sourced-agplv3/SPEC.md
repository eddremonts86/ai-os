---
id: "2428"
slug: windmilldev-is-not-fully-open-sourced-agplv3
title: "Windmill.dev is not \"fully open-sourced (AGPLv3)\""
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49392365"
category: ask-hn
date: "2026-08-21"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Windmill.dev is not "fully open-sourced (AGPLv3)"

## Problem

I think Windmill.dev (https://github.com/windmill-labs/windmill) is really cool, and fully support their desire to be paid for their work.However, their README says:> “Windmill is fully open-sourced (AGPLv3)…”But their LICENSE says:> ... The files under backend/ are AGPLv3 Licensed, except any snippets of code under the compile flag ‘enterprise’. Those snippets and files are under a proprietary and commercial license. Private and public forks MUST not include the proprietary/commercial code mentioned above.I dove deeper into the code, there are around 300 files in the codebase that contain references to enterprise or private features, so it's not a clearly separated directory that can just be removed.They have 1.1k forks of their repository that I can see on Github, and I doubt all of them took the time to strip the proprietary code to comply with the license.So at this point, it feels like a licensing trap for anyone that clicks the fork button on Github or is attracted by the AGPL licenseDon't get me wrong, I wish more companies made their code open-source if for no other reason other than to be transparent. But calling this mixed source repository "fully open-sourced (AGPLv3)" feels like false advertising that actively leads users to violate the terms unknowingly.Also, even if that line was removed from the readme or fixed, it does not feel right to have: "...Private and public forks MUST not include the proprietary/commercial code mentioned above..." and the Github Fork button right next to each other. It's like a giant violate-the-license button next to the license.

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
