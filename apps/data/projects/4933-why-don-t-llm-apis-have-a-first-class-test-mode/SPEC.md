# SPEC.md — Why don't LLM APIs have a first-class test mode?

## Problem

Context: At work, we’re getting ready to stress-test a chatbot for scalability.<p>One fairly obvious issue came up: if our load tests exercise the real OpenAI&#x2F;Claude APIs, a scalability test can quickly turn into a token-spending test.<p>Fair enough. We shouldn’t burn real inference just to test whether our own gateways, queues, WebSockets, streaming paths, retries, etc. can handle load.<p>The proposed solution was to mock all communication between our backend and the LLM provider.<p>Also reasonable.<p>What surprised me was the next step: we have to build and maintain that mocking service ourselves.<p>We can certainly do that. But should every company integrating with LLM APIs have to reinvent this?<p>Stripe solved a similar developer-experience problem years ago. They provide test mode, test data, test helpers, and even stripe-mock. It isn’t intended to perfectly reproduce Stripe’s backend behavior, but that’s okay. For many tests, you just need something API-compatible and predictable.<p>I’d love to see OpenAI, Anthropic, and other LLM providers offer something similar: an official API-compatible test endpoint that doesn’t invoke a model or consume billable tokens.<p>Ideally it could support things like:<p>* deterministic canned responses
* streaming responses
* configurable latency &#x2F; time-to-first-token
* configurable token counts
* tool-call responses
* 429s, 5xx errors and timeouts
* malformed&#x2F;interrupted streams
* rate-limit simulation<p>The goal wouldn’t be to benchmark the LLM provider. You’d still need the real API for that. The goal would be to stress-test everything around the model without paying for thousands or millions of unnecessary inference calls.<p>What’s slightly ironic is that both OpenAI and Anthropic appear to use OpenAPI-based mock servers in their own SDK test suites. But, as far as I can tell, neither exposes that concept as a first-class public service for customers.<p>Am I missing something?<p>For teams running LLM applications at scale, how are you handling this today — homegrown mock server, generic HTTP mocking, record&#x2F;replay, or just putting a budget cap on real API load tests?

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49556909)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-03T20:59:59Z

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
