---
id: "2585"
slug: forst-migrate-typescript-back-ends-to-go-incrementally
title: Forst – migrate TypeScript back ends to Go incrementally
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49399425"
category: show-hn
date: "2026-08-22"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Forst – migrate TypeScript back ends to Go incrementally

## Problem

Over the past ~1.5 years I've been working on this programming language called Forst with the primary goal of replacing TypeScript on the backend.I'd seen many times that running JavaScript on the backend often leads to memory spikes, especially when handling larger data structures, and other inefficiencies due to over-usage of the heap and being restricted to one core by default. So I wanted more efficient native code to replace it but also figured that it's often simply too risky and time consuming to rewrite entire codebases in Go, Rust, or others.This idea led the design. By now, Forst is interoperable with Node, so you can call Forst code from Node via IPC or an HTTP sidecar, and even call existing TS code from Go if you're running a Node process as a child process of your Forst host process. These features enable an incremental migration of parts of your codebase rather than having to go all-in immediately.It started out as a transpiler that emits Go code with support for structural typing in a way closer to TypeScript, i.e. allowing anonymous objects to be passed to functions and just matched on required properties. Overall however both the syntax and the semantics of the language are designed to be as close to Go as possible, both to avoid Go's developing features from interfering with the design and to prevent Forst from becoming an exotic language that no one wants to risk using in production.Other features include: - import any Go code directly, to profit from its massive ecosystem
 - an `ensure` keyword that promotes early returns
 - a first-class `error` keyword that makes errors explicit, nominal structs that are shared between ecosystems
 - a first-class dependency injection feature called *Providers* via `with` and `use` keywords
 - constraints on types (refinement types) you can define yourself using *type guards* that look like Go functions

You can also check the docs and the roadmap for more details.There is a VSCode extension with a built-in LSP so you get syntax highlighting and IntelliSense on hover.(Disclaimer: The compiler has pretty much been vibe-coded but I'd say it is quite well tested at this point.)Let me know what you think, I'm very curious about your feedback! Would love to hear about any new ideas, problems you encounter with it or even fundamental concerns you have that I haven't considered.

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
