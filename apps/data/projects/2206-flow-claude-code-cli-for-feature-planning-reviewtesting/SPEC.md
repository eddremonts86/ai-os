---
id: "2206"
slug: flow-claude-code-cli-for-feature-planning-reviewtesting
title: Flow – Claude Code CLI for feature planning → review/testing → merge
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49363138"
category: show-hn
date: "2026-08-19"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Flow – Claude Code CLI for feature planning → review/testing → merge

## Problem

Flow is my claude code supervisor for designing epics and shipping features really quickly. It was bootstrapped with itself so you can look at recent PRs to see what it produces.Usage:> flow feature create 'implement csv exports' --model opus --effort high• triage → plan → git worktree → code → verify → CI → review → merge• pauses only for plan approval and subjective pre-merge validation (if any)> flow epic create 'design app for making money' --model haiku --effort low• (same flow as `feature` but it only produces an epic PRD with phase dependency mappings)> flow epic run design-app-for-making-money• resolves current state of the epic and launches feature pipelines for unblocked phases> claude -p "Triage this list of bugs and launch a flow pipeline for each bundle with opus high: "• a flow pipeline can create new flow pipelines so fan-out is really powerful (eg if one pipeline discovers a bug that should be handled separately)> flow feature ls # show all active pipelines> flow epic ls # show all epic statusesStats:• in the last 4 months I've merged ~1000 heavily tested/reviewed PRsI very strongly recommend enabling the tmux integration and learning how to use tmux if you don't already.

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
