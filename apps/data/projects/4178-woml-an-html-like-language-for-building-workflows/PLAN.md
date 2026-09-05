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

## Tech Stack

The runtime is the language + executor; the surrounding docs site uses React + TypeScript on TanStack Start with SQLite/Drizzle for the inspector's state and the example workflow catalogue. Coolify hosts the docs site behind Docker.

## Architecture

The runtime parses a WOML document, instantiates the workflow as a state machine, and runs it durably against a state store. The inspector is a TanStack Start app that reads the state store and renders the workflow as a navigable document; the example catalogue is a Drizzle-managed SQLite store. Coolify hosts the docs site behind Docker.

## Milestones

- M1 — WOML language spec and parser.
- M2 — Self-hosted runtime with durable retries.
- M3 — CLI installs via curl / npm / bun / pnpm.
- M4 — Inspector UI for a running workflow.
- M5 — Public release.

## Risks

- "HTML-like" is a marketing claim; if the syntax drifts from HTML conventions, developers will not pick it up the way the tagline promises.
- Durability is hard to retrofit; the runtime has to be designed for it from the start or the project will silently lose state on restart.
