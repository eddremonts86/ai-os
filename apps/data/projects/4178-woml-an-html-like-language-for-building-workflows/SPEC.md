---
id: "4178"
slug: woml-an-html-like-language-for-building-workflows
title: "WOML – an HTML-like language for building workflows"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49510333"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# WOML – an HTML-like language for building workflows

## Problem

WOML (Workflow Orchestration Markup Language, woml.org) is an HTML-inspired language and self-hosted runtime for durable workflow automation. The tagline is "If you can read HTML, you can use WOML to automate anything, literally anything." A WOML document is workflow structure (declarative, HTML-like) plus JavaScript wherever real logic is needed; the runtime is open and the CLI installs via curl, npm, bun, or pnpm. WOML is positioned as an executable format for durable workflow applications with reliable execution, deployment, inspection, control, and recovery built in.


---

## Objective

Ship an open, HTML-like language and self-hosted runtime for durable workflow automation, so a developer who already knows HTML can write workflows that are executable, durable, and inspectable.


## Target Users

Developers building automation workflows who already know HTML and JavaScript and want a language that looks like markup, not a YAML dialect. Assumes the reader is comfortable installing a CLI and running a self-hosted runtime.


## MVP Scope

- A WOML language spec with the HTML-inspired element/attribute syntax.
- A self-hosted runtime that executes WOML documents durably (retries, idempotency, recovery).
- A CLI to install (curl / npm / bun / pnpm) and run WOML workflows locally.
- JavaScript escape hatches for real logic.
- An inspector surface to walk through a running workflow.


## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Source post does not state pricing or hosting posture; the project is positioned as open.
- The HTML-inspired syntax has to be a real subset of HTML, not just a YAML dialect that resembles it.
- Durability (retries, idempotency, recovery) is a stated feature; the runtime has to deliver that, not just claim it.
