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

## Problem

The repo at github.com/Vedantgitbot/booth describes Booth as a lightweight checkpoint layer for LLM outputs. It sits between an application and an LLM call and decides whether the answer should pass through, be reconsidered, or be flagged as resting on more than one source. The author positioned Booth for the case where an LLM output needs a verification gate before it touches the user — a thin library, not a hosted service. Source post does not describe the verification primitives in detail, only the role of the layer.


---

## Objective

Ship a small, embeddable library that gives an application a verification checkpoint between the LLM call and the caller, so the application can decide whether to trust, re-prompt, or block an output without standing up its own service.


## Target Users

Application developers integrating LLMs into user-facing features who want a thin verification primitive they can drop into the call path. Assumes the reader is comfortable adding a library between the LLM SDK and the rest of their code.


## MVP Scope

- A library with a single entry point that wraps an LLM call.
- A verification policy interface (trust / reconsider / block) so the consuming application can plug its own rules.
- A small set of default rules the library ships with (e.g. confidence thresholds, citation-presence checks) so a user can use Booth out-of-the-box.
- A documented example integrating Booth with one LLM SDK.


## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Source post does not state pricing, hosting, or SaaS posture; the library is presented as lightweight and embeddable.
- The verification logic must remain the consuming application's responsibility; the library only provides the checkpoint primitive.
- No network dependency from the library itself; it runs in-process.
