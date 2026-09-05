---
id: "5075"
slug: gage-rust-based-tool-to-scan-claude-sessions-for-bugs
title: "Gage – Rust based tool to scan Claude sessions for bugs, other issues"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49566640"
category: show-hn
date: "2026-09-04"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Gage – Rust based tool to scan Claude sessions for bugs, other issues

## Problem

Gage is an open source (Apache 2) CLI + TUI that scans Claude Code session
transcripts and files issues with evidence.Yesterday it found a bug that I had approved. In the original session Claude
flagged the risk. I didn't read carefully, said "go ahead", and it broke a
feature. Nothing in the commit shows this. It's obvious in the session.Sessions contain the code and the reasoning behind it. That makes them a
better source for review than the diff alone.Every issue must cite lines in the session record, so any claim traces to its
source. You can review, fix, or close issues as skipped. Gage integrates with
Claude Code to review and resolve issues from the transcript.Cost: scans run under your Claude login. On a subscription they count against
your plan limits. On usage-based billing they cost about $0.50 to $1.00 per
session. Running it daily, I'm paying roughly $2 per issue resolved. Some are
minor. Some are not.

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
