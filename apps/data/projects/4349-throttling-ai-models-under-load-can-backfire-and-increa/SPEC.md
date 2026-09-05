---
id: "4349"
slug: throttling-ai-models-under-load-can-backfire-and-increa
title: Throttling AI models under load can backfire and increase demand (SIM)
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49521092"
category: show-hn
date: "2026-09-01"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Throttling AI models under load can backfire and increase demand (SIM)

## Problem

OP here: TL-DR: When AI providers silently swap weaker models under high demand, this can cause even more demand as users tend to re-ask. This is even worse for agents. Both of these effects cause even higher load on the data centers. I guess all of us have felt when the models "don't feel quite the same", so this could explain part of it.I modeled this as a fleet scheduling problem using Queueing Theory and Dynamic Programming over a finite horizon. The standard practice of throttling once the number of jobs in server exceeds certain threshold is in fact suboptimal. The optimal policy consists in segmenting the part of the traffic that is retry sensitive, from those that are not. For example, an user doing a basic data parsing might still do well under a weaker model, but a power user will certainly feel the degradation and ask more.Demo: Just a toy instance to illustrate the issue. The user can create their own policies and see how they perform against the industry standard and the optimal one. It is roughly 100 lines of Flask + JS frontend.Paper with proofs: https://arxiv.org/abs/2608.23986For those of you who have worked in inference infra, does this match anything you have seen?

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
