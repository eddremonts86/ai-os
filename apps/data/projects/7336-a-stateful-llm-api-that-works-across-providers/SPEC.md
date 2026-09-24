# SPEC.md — A Stateful LLM API that works across providers

## Problem

For the last year we&#x27;ve been building AI workspaces. With every new product, we found ourselves rebuilding the same context layer and infrastructure. We tried existing solutions, but we&#x27;d either have to lock into one provider or have to manage the storage infrastructure.<p>What we wanted was an API that&#x27;s stateful and isn&#x27;t tied to a specific provider. So that we didn&#x27;t have to think about compaction, differing schemas, or running the infrastructure ourselves.<p>Since we&#x27;d already built most of the constituent parts, we’ve decided to release Twigg.<p>The API is deliberately simple. You create a chat and get back an ID. When you have a new prompt or tool result, you send that plus the ID. There&#x27;s no need to store or manage context yourself. It appends the new prompt and assembles the history for you. To switch models, you change one field in the next request.<p>The dashboard covers most of what you&#x27;d want to configure: tool schemas, system prompts, context window limits and retention settings.<p>We&#x27;d like to hear from anyone who has run into the same problems. How are you hosting your context right now, and what would make you not want to hand it to a third party?

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49727072)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-16T13:53:49Z

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
