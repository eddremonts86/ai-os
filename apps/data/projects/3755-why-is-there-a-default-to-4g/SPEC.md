---
id: "3755"
slug: why-is-there-a-default-to-4g
title: Why is there a Default to 4G?
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49488850"
category: ask-hn
date: "2026-08-29"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Why is there a Default to 4G?

## Problem

There is a toggle within the iOS Mobile data settings that allows you to select 4G or 5G.4G that is at one bar of reception can be inferior, in some regards, for example when making calls, than 3G which may profer a stronger signal in a particular location.Both Apple, and my mobile network deny removing the toggle to select 3G as a forced choice. It is frustrating, as the algos will latch on to a poorer 4G signal in preference to a good 3G or even GPRS etc signal.Sometimes, all I want the iPhone to do is to actually make a call.Does anyone in HN know who may be responsible for this elimination of an iPhone user's choice?

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
