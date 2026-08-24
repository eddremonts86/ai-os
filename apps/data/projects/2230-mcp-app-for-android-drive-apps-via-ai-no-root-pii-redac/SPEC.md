---
id: "2230"
slug: mcp-app-for-android-drive-apps-via-ai-no-root-pii-redac
title: "MCP app for Android, drive apps via AI (no root, PII redacted locally)"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49362047"
category: show-hn
date: "2026-08-19"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# MCP app for Android, drive apps via AI (no root, PII redacted locally)

## Problem

Hi HN, author here.Android Remote Control MCP is an MCP server that runs directly on your Android phone (no root, no ADB, no computer in the middle) and lets an AI agent drive real apps the way a human would: it reads the screen through the accessibility tree, taps, types, scrolls, optionally also screenshots.I spent a lot of time optimizing tool usage and token consumption, and making it work not only via local harnesses but also via Claude.ai / Claude Desktop and chatgpt.com (if you have the proper account, the app acts as its own OAuth server, you approve connections with a code on the phone).The newest part is Privacy Mode, and it exists because after an earlier release someone told me in plain terms they'd never use it because, rightfully, they didn't want the LLM provider to see everything on their screen!
So now a combination of a small local model plus deterministic detectors identify personal information (emails, phone numbers, credit cards, IBANs, national IDs, English names, etc.) and redact it on-device before anything leaves the phone, with a benchmarked detection rate of about 87% (the benchmark is in the repo; non-English names, are the current weak spot but I am working on it).Why did I build it? I want my agents to be able to use my phone to do searches, book things for me and do sometimes boring stuff ... without sharing all my data with service providers and without having to run a local LLM!Tradeoffs: the service declares itself as an accessibility app so it can read apps which also makes it impossible to distribute this app on the Google Play store, hence it's distributed via GitHub at the moment (there's a standard build and a FOSS build without Google Play Services which soon will be published on F-Droid).Also, because I care about prompt injection as much as privacy, the data returned to the agent is prefixed with a message, which uses quite some strong wording, to make it clear that the content is supplied by third party sources and is an untrusted input! Mitigates the potential attacks a lot.Is it perfect? Nope, there's plenty to improve, especially around apps coverage but even small models (like Haiku) can drive the phone and handle unseen situations if you give them enough detail!What I am working on next? Three major things:
- a free reverse tunnel, encrypted end to end, with Let's Encrypt certificates to be able to use the app with Claude.ai / Claude Desktop / Chatgpt.com and such for free and with much more privacy than using ngrok or cloudflare (which don't provide e2e encryption but only encryption to the edge, so they see everything)
- a skills database for the apps, so your agent can work out what to do much faster
- a custom model to improve the privacy standing, especially for non-English namesAnd, additionally, a new guided setup and a revised UI to make it easier to start to use the app!

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
