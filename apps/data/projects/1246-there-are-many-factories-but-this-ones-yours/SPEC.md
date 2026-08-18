---
id: "1246"
slug: there-are-many-factories-but-this-ones-yours
title: "There are many factories, but this one's *yours"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49342987"
category: show-hn
date: "2026-08-18"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# There are many factories, but this one's *yours

## Problem

# There are many factories, but this one's yoursAll coding harnesses and code factories have a few major flaws:

1. You don't get to pick the workflow - someone else decides the workflow for you
2. It's often unclear when the human is needed - is the agent done, or do you need to verify?
3. You're limited to prose and all it's downsides - nested logic and complex compesition is pretty much out of the question
4. We end up relying heavily on agents calling mcp's or cli's for things that should be deterministic calls## You don't get to pick the workflowWhy should the guys at vercel, linear, factory, anthropic, or openai decide what workflow is best for you?Penguin flips that:YOU decide what workflow is best.Three concepts:
Workflows - what's run
Adapters - a way to connect to the outside world
Messages - async or sync sent between workflows and adaptersWith these three primitives, you can build incredibly complex workflows including, but not limited to, software factories.## It's often unclear when the human is neededWith Penguin, you can write deterministic pauses in workflow ("New messages from slack, would you like to pause implementing or read them after?")When an agent stops it's either because the agent needs human input or because it is done. When done, the workflow moves on to the next step until a human is needed. There is clear separation between an agent finishing and human input needed.## You're limited to prose and all it's downsidesIf you want a workflow that runs another workflow that runs another workflow that runs several agents and it runs all those workflows in peralell, you just can't do that with prose very easily. Code is much more clearThe workflows and adapters all are written in TypeScript making it incredibly straightforward to build a new workflow or adapter.## We end up relying heavily on agents calling mcp's or cli's for things that should be deterministic callsWhen you implement a github issue, jira ticket, or review a PR, you are ALWAYS going to pull the info from those sources, and you can do this with a script. There's no need for the agent to use an MCP.## Final notesYou can build a workflow that has steps, blockers, and all, without ever even calling an agent.You can make workflows that respond to all kinds of triggers: Slack, GitHub, Jira, User, a webhook, anything you can bulid an adapter forPenguin is the ultimately composable workflow builderInstall with: `npm install -g @mikaelweiss/penguin`
https://github.com/mikaelweiss/penguinStill early beta, but I've already started using Penguin at work as well as to build Penquin!

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
