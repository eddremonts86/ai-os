---
id: "4631"
slug: mcdc-coverage-so-coding-agents-could-work-overnight
title: MC/DC coverage so coding agents could work overnight
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49534948"
category: show-hn
date: "2026-09-02"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# MC/DC coverage so coding agents could work overnight

## Problem

Hello HN!Code just became cheaper with AI but review and verification is as hard as it was. Tests are great, but current AI slop needs much more exhaustive testing.I built a test coverage tool for coding agents so they could work in a loop and keep writing tests where it makes sense.Here’s Supercov:- Wraps any JavaScript/TypeScript/Rust test suite (npx supercov -- npm test)- Provides deepest MC/DC code coverage with max perf (written in Rust)- Free and open sourceEasiest way is just to give your agent a prompt: Measure coverage with npx supercov and write one test.Goal is building the deepest code coverage suite for coding agents thats works automagically in any language and any test suite. I feel code verification is the missing piece for software factories to actually work.I’d particularly be interested in feedback on compatibility and if your agent ran into any problems.Contributions and bug reports are very welcome: https://github.com/supercorp-ai/supercov

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
