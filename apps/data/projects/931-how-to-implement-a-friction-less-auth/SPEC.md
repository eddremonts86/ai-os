---
id: "931"
slug: how-to-implement-a-friction-less-auth
title: How to implement a friction-less auth
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49350373"
category: ask-hn
date: "2026-08-18"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# How to implement a friction-less auth

## Problem

I'm kinda new to coding and developing a very simple two-player board game and need guidance in how to design the auth system. Right now I have a normal username+password auth wall for a registered users only queue and a guest system for non registered users that mints a guest account when someone not logged in queues. I'm happy with the friction-less this provides but I'm not so happy with anyone being able to spam either my guest creation endpoint or my username+pwd signup.I love sites that offer either functional guests or fast non-email signups, but I don't know how to prevent someone from creating fake accounts and making the matchmaking awful besides rate limiting, but as the expected pool of legitimate players is small, any trivial amount of fake accounts (10s) can severely impact the queues.I know, I know, "0 users" and "just put something out there", but I really enjoy the back-and-forth of the design and implementation, just a bit lost here so any guidance on what to do, but scoped to the small stakes of the project, would be much appreciated.

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
