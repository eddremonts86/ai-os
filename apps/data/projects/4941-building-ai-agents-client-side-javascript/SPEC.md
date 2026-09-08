---
id: "4941"
slug: building-ai-agents-client-side-javascript
title: Building AI agents client-side JavaScript
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49557409"
category: show-hn
date: "2026-09-03"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Building AI agents client-side JavaScript

## Problem

Hey HN, most agent systems default to server-side Python inside containers and chain frameworks. I wanted to see how far we could push agent in the browser with vanilla JavaScript https://buttercup.shThe reason this is interesting is because agent loops in the browser keeps infrastructure costs low. No need for proxy or API calls. And ollama/vLLM can be used for 100% offline. Also WebLLM for embedded. We need to consider CORS, API keys for remote models, access to visual state, and handling remote tool calls. I am working on a guide with references in vanilla JS. This is a short-lived guide starting mid-September with weekly topics.Draft topics starting mid-September:In-Browser Loops: Function calling, and deterministic multi-turn loops running purely in the browser runtime.
Vision (Multimodal): Capturing viewport screenshots using browser APIs.
Remote Agent Access & Transports: Connecting the in-browser agent to remote agents.
Multi-Agent Coordination: Lightweight client-side agent, specialist delegation, and running concurrent sub-agents without locking the browser UI thread.Everything is open source, zero-install, and runnable directly in the browser. Would love feedback from the HN community on agents running in browsers.

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
