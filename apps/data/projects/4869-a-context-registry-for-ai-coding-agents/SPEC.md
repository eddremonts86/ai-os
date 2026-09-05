# SPEC.md — A Context Registry for AI coding agents

## Problem

Hi HN. We built an API context registry to help coding agents (like Claude Code) generate production-ready API integration code without blowing through token limits.<p>We build a lot of API integrations. In our experience, most coding agents write basic client calls fine, but consistently stumble on details that make code shippable, like idempotent retries, rate-limiting and Auth token management.<p>We tried all the existing approaches of injecting context into coding sessions:<p>- Markdown dumps delivered via MCP (think Context7 or Mintlify Docs MCP)
- API behaviour described in prose using AGENTS.md and skills.
- OpenAPI specs<p>However, all of them left the same production-readiness gaps.<p>So we came up with our own approach that combines prose with typed SDK reference code into a &quot;Context Plugin&quot;. You install the plugin into your coding agent and it automatically injects language-specific context whenever the agent works on an API.<p>Across our benchmarks, Context Plugins boosted one-shot production readiness by up to 34%, allowing Sonnet to match or beat baseline Opus on the same integration tasks. You can read more about our experiments here <a href="https:&#x2F;&#x2F;www.apimatic.io&#x2F;blog&#x2F;working-api-call-is-not-production-ready-integration" rel="nofollow">https:&#x2F;&#x2F;www.apimatic.io&#x2F;blog&#x2F;working-api-call-is-not-product...</a><p>We have published Context Plugins for 24 APIs for the community to try out, including Slack, Google Maps, and Notion.<p>We&#x27;d love for you to give them a go and share your feedback on our plugins as well as our evaluation methodology.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49552209)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-03T16:00:26Z

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
