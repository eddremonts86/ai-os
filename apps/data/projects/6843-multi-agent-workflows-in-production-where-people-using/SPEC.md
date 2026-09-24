# SPEC.md — Multi-agent workflows in production; Where people using 1000s of agents?

## Problem

I feel like most AI workflows can be solved pretty effectively by a single capable LLM or with upto 5 subagents however, many engineering teams are focused on multi-agent architectures at huge scales.<p>Curious to understand exactly when it becomes worth it &#x2F; what production use cases there are for large multi-agent swarms: I’m trying to understand exactly where that value lies.<p>If you are run agent swarms in production: what is the main use case &#x2F; need and what is your biggest pain point right now (state sync, token costs, cascading failures, latency)?<p>[As context: I am a founder at Acyclic Labs (YC F26) and we are building infra to scale agents. Looking to map out when the swarms are actually justified and when they are wasteful!]

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49689454)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-13T22:37:42Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
