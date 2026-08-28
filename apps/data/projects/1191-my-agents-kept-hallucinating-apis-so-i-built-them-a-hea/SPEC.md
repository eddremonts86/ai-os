---
id: "1191"
slug: my-agents-kept-hallucinating-apis-so-i-built-them-a-hea
title: "My agents kept hallucinating APIs, so I built them a headless IDE"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49345786"
category: show-hn
date: "2026-08-18"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# My agents kept hallucinating APIs, so I built them a headless IDE

## Problem

I built Context Engine last year mostly out of frustration. Agents impressed me and made me angry at the same time: they kept calling APIs that don't exist, re-implementing APIs already defined in the codebase, and getting stuck in write-compile-rewrite loops. Sometimes they seemed very intelligent and sometimes extremely stupid. But they aren't stupid: take any brilliant engineer, give them a whiteboard, and ask them to implement a new feature in a large codebase they have never seen. And for agents, every session is a project they have never seen.The problem is that agents lack proper tooling. They work with plain text, like human engineers in 1995, in the pre-IDE era, and they face the same problems engineers faced 30 years ago. Where a human engineer just hovers over a symbol or presses F12, an agent spends thousands of tokens to get the same result. So I built the IDE part they were missing, without the editor part they don't need — an IDE headless in the same sense as a headless browser.Initially my goal was to eliminate API hallucinations by giving agents cheap tools that to resolve the APIs instead of guessing about them. Then, to make it even cheaper, I added inlined inlay hints: resolved types and parameter names at call sites, so agents spend their reasoning budget on the task instead of on reconstructing types.But then I realized that there is a more fundamental issue: the codebase is not a set of files, it is a graph of symbols (and dependency symbols are the part of it). If I provide agents the tools to follow the graph, I enable them to cherry-pick only the symbols they consider meaningful for the task they are working on. LSPs provide this capability. And Tree-sitter allowed agents to cherry-pick only the necessary parts of those symbols.Since January I have been using it daily in my current project (math-to-silicon synthesis engine) as an internal tool. Some thoughts (not benchmarks!) after seven months of extensive use:1. I expected fewer mistakes from eliminating API guessing, but the result was better. Agents behave like better engineers: they tend to reuse abstractions already defined in the codebase rather than duplicate them ad hoc, and not only did type and lifetime compile errors almost disappear — they also make fewer logical errors. My assumption is that this comes from reduced context pollution: when agents cherry-pick only the information relevant to the task, their reasoning capability degrades slower.2. Token usage reduction wasn't a goal, but the savings per task turned out substantial.3. The most unusual experience was UX design for machines. Giving agents better tools isn't enough: you have to convince them to use these tools instead their built-in text-oriented tools. The working solution was to describe workflows (codebase exploration, debugging, dependency API discovery, refactoring, reading and editing documentation) as chains of the new tools rather than describing each tool separately.Context Engine runs fully locally, and your code never leaves your machine. One daemon is shared between all your agents and their subagents: Claude Code, Codex, Cursor, or any other agent that supports MCP talks to the same instance, and agents working in the same workspace also share the LSP servers serving it.Context Engine MCP requires an API key, which you can get for free on https://context-engine.app. I do not have plans to make it paid yet but want to reserve the right to do it in the future. Anyway, it is free now and will remain free in the foreseeable future. It is language-agnostic and can work with any language, although it is validated end-to-end for Python, TypeScript/JavaScript, Rust, Go, and Markdown only so far. The known issue is with Java: jdtls is still fighting me.I would love feedback, especially on the tool output design.

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
