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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

WOML turns durable workflow automation into a markup language a web developer can read on sight. The runtime is self-hosted, the CLI installs with the same package managers a developer already uses, and JavaScript escapes handle the real logic the markup cannot express.


## Target Users

Developers building automation workflows who already know HTML and JavaScript and want a language that looks like markup, not a YAML dialect. Assumes the reader is comfortable installing a CLI and running a self-hosted runtime.

## Jobs To Be Done

- When I automate a business process, I want a markup language so my workflow reads like an HTML document, not a YAML file.
- When my workflow fails, I want durable retries so I do not have to write that layer myself.
- When I inspect a running workflow, I want a UI to step through the state so I can see where it is stuck.


## Success Metrics

- Number of WOML elements / attributes supported.
- Number of installation paths documented (curl / npm / bun / pnpm).
- Latency overhead of the runtime vs. the equivalent hand-written code.


## Pricing & Monetization

Source post does not state pricing or monetisation beyond what is named in the live product page (which is referenced where relevant in the Value Proposition). Treat pricing as unstated until the author publishes a model.

## Competitive Landscape

Closely related work includes other workflow DSLs and durable-execution runtimes (Temporal, Inngest, Prefect). The captured source post positions WOML around HTML-inspired syntax for developers who already know markup, but does not enumerate specific competitors by name.


## Risks & Open Questions

- "HTML-like" is a marketing claim; if the syntax drifts from HTML conventions, developers will not pick it up the way the tagline promises.
- Durability is hard to retrofit; the runtime has to be designed for it from the start or the project will silently lose state on restart.
