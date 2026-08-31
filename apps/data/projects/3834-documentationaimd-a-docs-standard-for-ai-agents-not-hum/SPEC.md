---
id: "3834"
slug: documentationaimd-a-docs-standard-for-ai-agents-not-hum
title: "Documentation.ai.md – a docs standard for AI agents, not humans"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49493041"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Markdown-based documentation standard, llms.txt-complementary convention, machine-actionable doc schema, example docs, CC BY 4.0 license, community contribution workflow]
---
# Documentation.ai.md – a docs standard for AI agents, not humans

## Problem

The capture is a URL-only Show HN: the post body is just a link to github.com/iwasoftcom/ai-docs-standard, and the product claim is carried by the title — "Documentation.ai.md – a docs standard for AI agents, not humans". The repo itself states the shape: an open standard for documentation.ai.md, "machine-first docs your users' AI agents can act on", complementary to llms.txt, licensed CC BY 4.0, with a manifesto, examples and a contribution guide. The pitch is documentation written for the agents that read it rather than for human readers alone.

## Objective

Define and publish an open, machine-first documentation standard — documentation.ai.md — that AI agents can act on, positioned as complementary to llms.txt, so maintainers can ship docs that both their users and their users' agents can use.

## Target Users

- Library and SaaS maintainers whose users run AI agents against their docs.
- Agent developers who need docs they can execute against, not just read.
- Docs tooling authors building on llms.txt-adjacent conventions.

## MVP Scope

- The standard itself: a spec for documentation.ai.md.
- Examples showing conformant docs.
- A manifesto stating the machine-first position and the llms.txt relationship.
- A CC BY 4.0 license and a contribution guide for community input.

## Constraints

- The capture is URL-only; all specifics come from the repo at authoring time (it was new: 4 commits, no stars).
- The llms.txt complementarity is the repo's own framing, not an established industry fact.
- A standard's value is adoption; a spec with no adopters is documentation of intent.
- CC BY 4.0 governs the standard's text; what adopters ship under it is their choice.

## Design Direction

See `DESIGN.md` for this project's design tokens.
