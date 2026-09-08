---
id: "4869"
slug: a-context-registry-for-ai-coding-agents
title: A Context Registry for AI coding agents
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49552209"
category: show-hn
date: "2026-09-03"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# A Context Registry for AI coding agents

## Problem

Hi HN. We built an API context registry to help coding agents (like Claude Code) generate production-ready API integration code without blowing through token limits.We build a lot of API integrations. In our experience, most coding agents write basic client calls fine, but consistently stumble on details that make code shippable, like idempotent retries, rate-limiting and Auth token management.We tried all the existing approaches of injecting context into coding sessions:- Markdown dumps delivered via MCP (think Context7 or Mintlify Docs MCP)
- API behaviour described in prose using AGENTS.md and skills.
- OpenAPI specsHowever, all of them left the same production-readiness gaps.So we came up with our own approach that combines prose with typed SDK reference code into a "Context Plugin". You install the plugin into your coding agent and it automatically injects language-specific context whenever the agent works on an API.Across our benchmarks, Context Plugins boosted one-shot production readiness by up to 34%, allowing Sonnet to match or beat baseline Opus on the same integration tasks. You can read more about our experiments here https://www.apimatic.io/blog/working-api-call-is-not-product...We have published Context Plugins for 24 APIs for the community to try out, including Slack, Google Maps, and Notion.We'd love for you to give them a go and share your feedback on our plugins as well as our evaluation methodology.

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
