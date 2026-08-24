---
id: "2021"
slug: arrayref-v0310-and-v0311-compromised-on-cratesio
title: Arrayref v0.3.10 and v0.3.11 compromised on crates.io
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49372246"
category: ask-hn
date: "2026-08-20"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Arrayref v0.3.10 and v0.3.11 compromised on crates.io

## Problem

https://crates.io/crates/arrayref has a supply chain attack that runs malicious build script through a transient build-time dependency during `cargo build` with https://crates.io/crates/proc-macro-en/1.0.10/ (now deleted)Some more context: https://github.com/rustsec/advisory-db/issues/3161At the moment I cannot download the payloads anymore for further analysis.

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
