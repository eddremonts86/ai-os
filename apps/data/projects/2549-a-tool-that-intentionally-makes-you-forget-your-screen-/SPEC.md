---
id: "2549"
slug: a-tool-that-intentionally-makes-you-forget-your-screen-
title: A tool that intentionally makes you forget your Screen Time passcode
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49403441"
category: show-hn
date: "2026-08-22"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# A tool that intentionally makes you forget your Screen Time passcode

## Problem

iOS Screen Time is a fantastic app blocker because it's built into the OS, unlike third party apps that can simply be uninstalled.The only problem is that it uses a 4 digit passcode. If I set the passcode myself, I can always override my app limits by tapping ignore limit and entering the screetime passcode.So I built WaitToUnlock.com. It's a simple website that generates a random ScreenTime passcode and guides you through entering it in a deliberately confusing way (for example: "enter 3, enter 7 + 2, delete it, now enter 5..."), making it very difficult to remember the final code.The passcode is then securely stored away. If you need it back, you can request it, but you have to wait at least 6 hours before it's revealed.That way, you can still get your passcode back if you really need it, but it removes the ability to override the app limits the moment the temptation strikes.

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
