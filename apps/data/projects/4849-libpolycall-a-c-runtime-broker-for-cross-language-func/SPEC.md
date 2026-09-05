---
id: "4849"
slug: libpolycall-a-c-runtime-broker-for-cross-language-func
title: LibPolyCall – a C runtime broker for cross-language function calls
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49553255"
category: show-hn
date: "2026-09-03"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# LibPolyCall – a C runtime broker for cross-language function calls

## Problem

LibPolyCall is an open-source C runtime for connecting programs across language boundaries without requiring each language pair to implement its own integration layer.The architecture is program-first rather than binding-first, with a stable C ABI, FFI bindings, Polycallfile/Polycallrc configuration, runtime state management, and telemetry.I’ve recently completed the Windows build path producing both libpolycall.dll and libpolycall.a, and I’m working toward using the same runtime across Python, Node.js, Java, Go, and other language environments.I’d particularly appreciate feedback on the ABI design, runtime architecture, configuration model, and approach to cross-language dynamic loading.

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
