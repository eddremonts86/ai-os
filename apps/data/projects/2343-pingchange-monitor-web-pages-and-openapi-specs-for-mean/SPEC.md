---
id: "2343"
slug: pingchange-monitor-web-pages-and-openapi-specs-for-mean
title: PingChange – monitor web pages and OpenAPI specs for meaningful changes
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49380120"
category: show-hn
date: "2026-08-20"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# PingChange – monitor web pages and OpenAPI specs for meaningful changes

## Problem

I built PingChange after watching the same thing happen over and over: a competitor prices change, a company policy is updated or important web content changes but there is often no reliable way to track it and know when it happens.The tool monitors web pages and API on a schedule and alerts your team when something meaningful changes. The keyword here is meaningful. Most monitoring tools trigger alerts for everything (ads, timestamps, cookie banners etc) and could be noisy or spam in your inbox. With PingChange, you can give it an instruction e.g "alert me when pricing changes" and it analyzes the page content and only notifies you when the changes matches what you're looking for on the page.Here are the main features:- Visual region selection / HTML element selector for tracking specific location on the page.
- Changed diff viewer and screenshot of the pages.
- Geolocation support - Monitor URL's from specific location to detect content from different geographies.
- Anti-bot resolution: It handles pages behind Cloudflare and captchas.
- Changed alerts sent to email, slack, telegram, Zapier, n8n or webhook api.
- Email digest: Combine changes from every monitor into one email so inboxes are not flooded.
- Export changes in RSS, CSV, JSON formats.
- MCP server to connect to Claude, Cursor, ChatGPT.There is a free plan with no credit card required. Your feedback on what is missing or can be improved is welcome.

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
