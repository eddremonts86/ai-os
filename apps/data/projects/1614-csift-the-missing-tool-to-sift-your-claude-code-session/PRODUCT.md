---
id: "1614"
slug: csift-the-missing-tool-to-sift-your-claude-code-session
title: Csift – the missing tool to sift your Claude Code sessions
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49356290"
category: show-hn
date: "2026-08-19"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Csift – the missing tool to sift your Claude Code sessions

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I built csift to address all my complaints about Claude's handling of its own session files. Claude Code sessions are plain-text JSONL with everything, but they never document the structure anywhere. Every time, Claude has to craft an ad hoc tool to guess, and SKILL.md isn't enough to cover everything.This is what happened in the night that made it a real tool: Claude deleted project files, froze, and said sorry at midnight. I didn't Ralph loop it, and I asked it to recover from its own JSONL and continue. I thought it would be easy, until it stopped again in the middle of rewriting them, since they're scattered across subagents, with its 5hr limit burnt out. This wasn't the first time after I used --dangerously-skip-permissions. And I created the tool that could put the file back together byte-exact.Now csift recovers deleted files and plans, reconstructs turns, matches plans to sessions, does typed search over 25 record labels, extracts pasted images, and maps the subagent topology tree.It's purely local, read-only to sessions, and has no telemetry. And I decided to use pure regex, no embeddings, and it requires no daemon. It's done in Rust with mmap, a SIMD scan, and rayon, so it's fast.I'd rather not waste my time hand-writing a tool to pick up Claude's slack, so Claude Code wrote this project, and I reviewed it. It passed mutation tests and achieved 94.9% coverage, so I'm happy to share it. I intended it to lack human-readable documentation except for the README.md, so human engineers shouldn't spend time polishing it by hand. Let your Claude do the work. cargo install csift
 npx skills add wdhwg001/csift

Enjoy and let me know what you think.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49356290) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
