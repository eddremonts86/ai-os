---
id: "3548"
slug: ai-game-playtester
title: AI Game Playtester
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49475316"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# AI Game Playtester

## Problem

Hey everyone! Wanted to show off a little side project I've been working on. A lot of people have been using AI to one-shot games, but they're often quite buggy - glitchy graphics, collisions aren't setup, or regressions in earlier levels. With an AI playtester in the loop, I've been able to one-shot games like Candy Crush or Crossy Road that would previously have bugs like cut-off UIs or stuck retries.The way it works basically goes like this:1/ The playtester starts by reading the code to understand what its parent AI is asking it to play, and to decide what breakpoints, hooks and logging to add
2/ The playtester sets up the scene with the needed environment
3/ The playtester sends a sequence of inputs, then pauses the game
4/ The playtester then uses a vision model to understand the scene, queries the hooks it initially set up, and reads the logs to decide what to do nextAfter doing a few input loops, it then determines if the game is working, the game is broken, or if the test failed.It is a paid offering so I'm not expecting anyone to try it out, but I wanted to share it nonetheless ^^. Lmk if you have other ideas on how you think it can be improved

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
