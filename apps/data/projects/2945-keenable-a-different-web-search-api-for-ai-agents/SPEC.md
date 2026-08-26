---
id: "2945"
slug: keenable-a-different-web-search-api-for-ai-agents
title: Keenable – A different web search API for AI agents
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49435555"
category: show-hn
date: "2026-08-25"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Keenable – A different web search API for AI agents

## Problem

Hey HN! We built https://keenable.ai, a different web search API for AI agents.Keenable searches our own 100B+ page index. We are focused on low cost and latency (p95 <250ms from us-east). We don’t believe in benchmaxxing, so we open-sourced our internal benchmarking suite, NEEDLE (available at https://keenableai.github.io/needle): a live benchmark that compares Keenable with other search APIs on fresh agent-like queries.I spent seven years at Amazon as a scientist working on web grounding for Alexa/AGI, and my co-founder Andrey previously led search at Yandex. We started Keenable because agents search differently from humans, and we wanted to build around those patterns directly.The API is available now and we provide a free allowance of 100,000 requests a month.It also exposes a novel SQL-like interface to the web, which is useful for structured extraction and agent workflows.Happy to answer questions about the index, crawl, ranking, latency, or benchmarking.

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
