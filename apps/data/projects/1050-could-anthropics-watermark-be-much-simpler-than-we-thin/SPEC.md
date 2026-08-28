---
id: "1050"
slug: could-anthropics-watermark-be-much-simpler-than-we-thin
title: "Could Anthropic's watermark be much simpler than we think?"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49308317"
category: ask-hn
date: "2026-08-15"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Could Anthropic's watermark be much simpler than we think?

## Problem

Anthropic recently said they're working on watermarking Claude output, while also saying it won't interfere with generation quality.I'm wondering if is just hash-fingerprinting.For example, take the generated text and split it into overlapping chunks: "The company reported strong growth..."
 "reported strong growth in revenue..."
 "strong growth in revenue during Q2..."
 ...

Hash each chunk and store the hashes. When text is submitted for detection, do the same thing and count how many chunk hashes are already in the database.Even if someone edits a few words, many overlapping chunks could still match.The search itself isn't really a problem. With 256-bit hashes you're dealing with a 2^256 space, but you only search the hashes you've actually stored. Binary search would search any hash in 256 iterations.This also satisfies the Anthropic requirements: *nothing needs to be changed during token generation*, so there's no quality tradeoff: https://x.com/i/status/2088343978873966687The obvious question is how they handle false-positive rate works at their scale.Could this explain their approach, or is there something I'm missing?

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
