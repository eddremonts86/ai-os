---
id: "2305"
slug: qwen38-fetches-weird-urls
title: Qwen3.8 Fetches Weird URLs
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49379079"
category: ask-hn
date: "2026-08-20"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Qwen3.8 Fetches Weird URLs

## Problem

I am working on opencode with the last qwen3.8-27B from unsloth (with dynamic 3.0 quants).while checking documentation for a rust project, instead of fetching the url it had listed in its own reasoning, it tried fetching urls like:https://routify-file-proxy-sg.oss-ap-southeast-1.aliyuncs.com/proxy_temp_file/production/2026-08-20/trace_0baf8c2b17874702866132490e0b56/requestId_97422c0041074091a68367881782d7b7/7c0791038d2f58b3a52c0f07714d3627.html?Expires=1818574288&OSSAccessKeyId=LTAI5t…QVZr&Signature=96y%2B…w%3Dthis happened in the same session, different batches, 16 times in total.It convinced itself there was some rewriting proxy in the webfetch tool.`Expires`, `trace` and `requestId` were consistent for a few requests, but they do change.`AccessKeyId` was always the same, "LTAI5t…QVZr"I did not add the `…` in the signature and access key.Probably training links, but that `Expires` number seems very high...in unix timestamp:1818574288 -- Aug 20271787251180 -- nowJust leaving this here, maybe someone wants to play with it. I don't think anything will come out of it though.

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
