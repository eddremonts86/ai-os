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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Flow is my claude code supervisor for designing epics and shipping features really quickly. It was bootstrapped with itself so you can look at recent PRs to see what it produces.Usage:> flow feature create 'implement csv exports' --model opus --effort high• triage → plan → git worktree → code → verify → CI → review → merge• pauses only for plan approval and subjective pre-merge validation (if any)> flow epic create 'design app for making money' --model haiku --effort low• (same flow as `feature` but it only produces an epic PRD with phase dependency mappings)> flow epic run design-app-for-making-money• resolves current state of the epic and launches feature pipelines for unblocked phases> claude -p "Triage this list of bugs and launch a flow pipeline for each bundle with opus high: "• a flow pipeline can create new flow pipelines so fan-out is really powerful (eg if one pipeline discovers a bug that should be handled separately)> flow feature ls # show all active pipelines> flow epic ls # show all epic statusesStats:• in the last 4 months I've merged ~1000 heavily tested/reviewed PRsI very strongly recommend enabling the tmux integration and learning how to use tmux if you don't already.

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49363138) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
