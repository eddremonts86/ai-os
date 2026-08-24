---
id: "2227"
slug: codex-cli-compiled-to-wasm-running-in-the-browser
title: Codex CLI compiled to WASM running in the browser
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49362139"
category: show-hn
date: "2026-08-19"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Codex CLI compiled to WASM running in the browser

## Problem

Hi HN! As part of our ongoing work on BrowserPod, an in-browser WebAssembly sandbox, we have significantly expanded what the Rust WebAssembly target can achieve.Our approach proved so robust that we could get the whole Codex CLI (~1.25M lines of Rust, excluding dependencies) to run in the browser, with extremely minimal modifications.Now, Codex CLI by itself could not do much, but BrowserPod provides a full environment with standard Linux command line tools, bash, git, Node.js and Python, with more yet to come. All of these are compiled to WebAssembly and run concurrently on top of BrowserPod kernel.To learn more about our work on Rust and BrowserPod in general: https://labs.leaningtech.com/blog/browserpod-rust

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
