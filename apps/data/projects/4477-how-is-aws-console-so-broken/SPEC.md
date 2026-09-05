---
id: "4477"
slug: how-is-aws-console-so-broken
title: How is AWS console so broken?
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49531472"
category: ask-hn
date: "2026-09-02"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# How is AWS console so broken?

## Problem

A small rant, after painful user experience. I admit I visited it after a while spending on GCP space, but the console looks like it is either not maintained at all, or individual teams just throwing stuff at it and causing a mess.My simple workflow - I want to copy millions of objects from one bucket in us-east-1 to us-west-11. I can kick off the replication rule. but oh wait, there is no monitoring, unless you select it in edit rules. Even then, the experience is broken and I have now no idea if anything is happening in the background.2. There is batch operation. It doesn't work. If I select source region for aws console, I can't see destination region bucket to execute copy batch. Vice-a-versa, if I select destination region, I can't select any buckets from the source region.I can perhaps use a CLI, which is a long list of instructions to follow and execute without pulling my hair out.I asked claude code to just figure out out to create a job and execute it and tell me the state. It didn't even hesitate.

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
