---
id: "2584"
slug: a-ruby-ide-running-on-a-microcontroller
title: A Ruby IDE running on a microcontroller
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49399476"
category: show-hn
date: "2026-08-22"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# A Ruby IDE running on a microcontroller

## Problem

I built AREA512, software that lets you write, compile, and run Ruby code entirely on the M5Stack Cardputer.https://github.com/engneer-hamachan/area512One part I put a lot of effort into is the on-device IDE.It has a Vim-like editor with:- Syntax highlighting
- Auto-indentation
- Code completion
- Type checkingThe code completion and type checking aren't implemented using a simple dictionary or predefined list of symbols.Instead, they're powered by picoruby-ti, a type inference engine I developed separately with the goal of making it portable enough to run on PCs, microcontrollers, and web browsers:https://github.com/engneer-hamachan/picoruby-tiI haven't seen many IDEs this feature-rich running entirely on a microcontroller.One of my goals with this project is to preserve some of the spirit of 1980s home computer culture — when the computer you used was also the computer you programmed.I'd love to hear your feedback, especially if you have ideas for features that would be fun or interesting to add.Thanks for reading!

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
