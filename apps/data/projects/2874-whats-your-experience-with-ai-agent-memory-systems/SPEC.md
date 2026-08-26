---
id: "2874"
slug: whats-your-experience-with-ai-agent-memory-systems
title: "What's your experience with AI agent memory systems?"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49410850"
category: ask-hn
date: "2026-08-23"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# What's your experience with AI agent memory systems?

## Problem

I've been working on MeshCtx, an open-source AI agent with 17 brain regions and a memory engine that uses FSRS spaced repetition + schema consolidation (episodic→semantic→core) + sleep-phase offline processing.The key innovation is the ARCHIVAL system that actively prunes memories without deleting them - they can be recovered later.Benchmark results:
- LongMemEval EM 54.2% / judge 83.3%
- 16KB budget +8.3pp improvement
- Tool compression -95.5%I'm curious about others' experiences with:
1. Memory consolidation approaches (episodic→semantic→core)
2. Spaced repetition for AI agents
3. Active forgetting/pruning strategiesGitHub: https://github.com/LucyAndLuna2023/meshctxWhat patterns have worked for you?

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
