---
id: "4629"
slug: tooljet-claude-code-and-codex-build-internal-tools-no-c
title: "ToolJet – Claude Code and Codex build internal tools, no codegen"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49535001"
category: show-hn
date: "2026-09-02"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# ToolJet – Claude Code and Codex build internal tools, no codegen

## Problem

Hey HN,Co-founder here. We spent 11 months to build a multi-agent system for generating applications. Then we scrapped it and rebuilt around MCP, letting coding agents do the job instead.Old multi-agent system worked great when we launched in September 2025. It was as good as it got in the internal tooling space at that time. Customers who evaluated multiple products agreed and things went well; and that's how we got into the trap of iterating the same system for almost a year.In the last few months, our customers weren't impressed by this system. The expectations were entirely different. We saw Retool pivot (probably not the right word) into a vibe-coding based approach along with a few lesser known competitors.We didn't and still don't think vibe-coding is right for our users. Less technical people along with highly skilled devs trust us with critical internal tools. Handing them a layer of generated code they can't or don't want to maintain, behind a black box that only responds to prompts, wasn't a solution we could get behind.Meanwhile every feature we shipped meant re-teaching our own agents every other week while Codex and Claude Code kept improving and Grok Build went from horrible to great at the thing we were badly reinventing.So we scrapped everything and exposed our entire platform over MCP instead. Coding agents drive it directly. You read it right, coding agents, but no code is generated.A ToolJet application is a well structured thing with abstractions for pages, components, queries, integrations, events, state management, etc. Coding agents generate the configs for these abstractions and puts together the whole app.A few things fall out of that:- Much less to generate. For a table wired to a query, a button that opens a modal, and a form that updates a record, the model emits no React, no state management, no CSS, no API plumbing. It describes what exists and how it connects.
- We used to need one agent per data source integration. App generation now covers all 100+ data sources.
- Users can use their own coding agent subscriptions and usage limits. API pricing is super expensive anyway. But for folks without a subscription, we built our own tiny harness where users pay API pricing.
- Other MCPs compose with ours. Designs come in from Figma, and apps on other platforms can be migrated.Our category looks like it is splitting in many ways. While the pro-code + prompt-first approach will have its own fans, our decision is to expose our platform and its abstractions to coding agents while visual builder exist to make changes manually when needed.MCP server's repo: https://github.com/ToolJet/tooljet-mcp(Posted ToolJet here in 2021 [https://news.ycombinator.com/item?id=27421408]. 1,000 stars in 8 hours. Fairly different product for a fairly different world now.)

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
