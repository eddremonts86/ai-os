---
id: "3130"
slug: how-much-of-hacker-news-is-ai
title: How much of Hacker News is AI?
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49449648"
  captured: "2026-08-26"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Analytics, AI, Media]
tech: [Python, SQLite, Hugo, Cloudflare Pages, HN Algolia API]
---
# How much of Hacker News is AI?

## Problem

Hacker News is full of "AI" stories but nobody has a clean number for it. The site counts titles that contain the standalone word "AI" — case-sensitive and word-bounded — and offers a toggle for a wider vocabulary that includes "artificial intelligence", "LLM", "GPT", and vendor or model names. The poster's stats: 14.4% of new HN titles this year against 10.9% in 2025, with the wider vocabulary at 21.9% and 16.1% respectively; first month above 1% was Oct 2016, above 5% in Feb 2023, above 10% in May 2025; the quietest month in five years was Jan 2022 at 0.8%, the peak Feb 2026 at 15.9%; 13.6% on weekdays against 12.4% at weekends; Show HN runs highest at 19.8% this year. As of the post, today is at 15% on the standard filter and 19% on the extended.

## Objective

Keep the live counter and chart running, with the standard and extended vocabularies both available, so that any reader can read today's percentage and see the trend since HN's earliest days without having to take the poster's word for it.

## Target Users

- HN readers curious whether "AI fatigue" is real or imagined, who want a daily number rather than a vibes-based claim.
- Tech writers and analysts who want a citable trend and a chart they can embed.
- Researchers tracking topic drift on HN over multi-year windows.

## MVP Scope

- A daily job that pulls every HN story title for the prior day (via the official Algolia HN search API) and records it in a local SQLite.
- A scorer that checks each title against the standard word-bound ("AI") and extended vocabularies ("artificial intelligence", "LLM", "GPT", model and vendor names).
- A static page (Hugo) that renders today's percentage on both filters, plus the all-time monthly series as a chart.
- An "as of" timestamp on every figure so nobody quotes a stale number as today's.
- A category breakdown (Show HN, Ask HN, top stories, etc.) using HN's existing taxonomy.
- Out of scope: real-time per-minute counters, sentiment analysis, comment-thread scraping.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The scorer must be deterministic: same input titles, same output percentage, forever. The post is explicit about case-sensitivity and word boundaries; that contract must not drift.
- Numbers are facts, not estimates; missing data is shown as a gap, never interpolated.
- The chart's data must be downloadable as a CSV so analysts can re-derive figures without trusting the page.
- The "OpenAI does not match, AI-powered does" rule from the post is part of the contract; any change is a breaking change to the series and must be flagged.
