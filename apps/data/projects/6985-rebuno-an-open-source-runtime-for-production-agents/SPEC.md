# SPEC.md — Rebuno - An open-source runtime for production agents

## Problem

I have been building Rebuno, an open-source execution runtime for operating AI agents in production. It manages execution state and guardrails across agents built with different frameworks.<p>Agents run as HTTP services. Rebuno dispatches work through signed webhooks and keeps execution state in Postgres. Agents submit tool and model calls to Rebuno as steps before executing them.<p>For each new step, Rebuno evaluates per-agent YAML policies, independently of the model&#x27;s prompt. It can allow the call, deny it, or hold it for human approval. The agent executes permitted calls and reports their outcomes. Policy decisions and step outcomes are both recorded in one append-only event log.<p>After an interruption, the agent starts its handler from the top. Steps with recorded outcomes return those outcomes instead of executing again. A crash can also leave a tool with no recorded outcome. Tools marked safe_to_retry run again, and tools marked at_most_once fail as indeterminate. How the agent handles an indeterminate step is up to its implementation.<p>There are Python and TypeScript SDKs, and the repo includes examples using LangChain, CrewAI, Pydantic AI, Vercel AI SDK, and Mastra.<p>Rebuno is free to self-host and released under the MIT licensed.<p>I&#x27;d be interested in hearing how others are running or operating agents in production.<p>Blog post with diagrams: <a href="https:&#x2F;&#x2F;rebuno.io&#x2F;blog&#x2F;introducing-rebuno" rel="nofollow">https:&#x2F;&#x2F;rebuno.io&#x2F;blog&#x2F;introducing-rebuno</a><p>Getting started: <a href="https:&#x2F;&#x2F;docs.rebuno.io&#x2F;getting-started" rel="nofollow">https:&#x2F;&#x2F;docs.rebuno.io&#x2F;getting-started</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49699591)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-14T16:29:39Z

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
