# SPEC.md — Remarc – better contextual feedback for AI agents

## Problem

Like any side project, Remarc started with my own problem: there was no good way to give AI coding agents contextual feedback on their own output.
There are plenty of tools for collaborating with humans, but surprisingly few for collaborating with AI. Chat was not cutting it for the feedback I wanted to give:<p>This thing in the implementation plan? Change it to that. What did you mean here? See this button? Here is a screenshot. I circled it because it is missing a hover state. This sentence in the third paragraph? Rephrase it.<p>If you are an opinionated builder, this gets clunky quickly. You either dictate paragraphs of messy feedback or resolve every detail one by one. AI is good at parsing mess, but garbage in, garbage out still applies.<p>I could get products to 90% quickly. The last 10% of feedback and polish was the bottleneck. So I built Remarc.<p>Remarc lets you select text in any Mac app, capture and annotate a screenshot, or comment on a web element. Each comment keeps its original context, status, and session. A connected agent can read the session, work through it, update statuses, and leave resolution summaries over MCP.<p>Think of it like leaving comments on a google doc vs sending a long rambling feedback note via Slack - the more granular you get with your feedback, the more it benefits from structure &amp; better context.<p>Remarc is free and open source, with no account, subscription, or telemetry.<p><a href="https:&#x2F;&#x2F;remarc.app&#x2F;" rel="nofollow">https:&#x2F;&#x2F;remarc.app&#x2F;</a>
<a href="https:&#x2F;&#x2F;github.com&#x2F;metedata&#x2F;Remarc" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;metedata&#x2F;Remarc</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49615660)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-08T19:31:40Z

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
