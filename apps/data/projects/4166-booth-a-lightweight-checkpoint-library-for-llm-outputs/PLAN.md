---
id: "4166"
slug: booth-a-lightweight-checkpoint-library-for-llm-outputs
title: "Booth, A lightweight checkpoint library for LLM outputs"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49511295"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# Booth, A lightweight checkpoint library for LLM outputs

## Tech Stack

Booth itself is the embeddable library; the surrounding docs site uses React + TypeScript on TanStack Start with SQLite/Drizzle for the example-app data. Coolify hosts the docs behind Docker.

## Architecture

The library is a single-package TypeScript module exposing the checkpoint primitive; the consuming app passes its verification policy and the library runs it after each LLM call. The docs site is a TanStack Start app that walks through the integration; example apps in the repo exercise each default rule against a real LLM SDK. Coolify hosts the docs behind Docker.

## Milestones

- M1 — Library exports the checkpoint primitive and a verification-policy interface.
- M2 — Default rules ship with the library (citation, confidence, schema).
- M3 — Documented integration with one LLM SDK.
- M4 — Example app demonstrates each default rule.
- M5 — Public release.

## Risks

- Verification policy is application-specific; if the default rules are too generic, real users will need to write their own.
- "Lightweight" is a marketing claim that must hold in benchmarks; an in-process library with too many dependencies breaks that promise.
