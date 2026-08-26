---
id: "3035"
slug: declaude
title: Declaude
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49443296"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Declaude

## Problem

I had to develop a course related to quantum chemistry and unfortunately, Claude just kept writing it in its own very annoying claude-speak. It actually cost our team a lot of time and tokens to wrestle it to just speak like a normal human.We used skills, as well as initial prompts and subagents to make sure that all of the tics were gone, but there was one too many times where it just wouldn't fix itself despite telling it in the prior prompt!I made speak-english based off of https://github.com/gvzdv/claudish-to-english/commits/main/ and it runs a qwen model on my gcp servers.It can convert documents or respond in-line in sessions with claude and I anticipate building a solution for prime-agent.

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
