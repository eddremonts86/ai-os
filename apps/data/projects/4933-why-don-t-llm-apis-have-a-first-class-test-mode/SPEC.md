---
id: "4933"
slug: why-don-t-llm-apis-have-a-first-class-test-mode
title: "Why don't LLM APIs have a first-class test mode?"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49556909"
category: ask-hn
date: "2026-09-03"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Why don't LLM APIs have a first-class test mode?

## Problem

Context: At work, we’re getting ready to stress-test a chatbot for scalability.One fairly obvious issue came up: if our load tests exercise the real OpenAI/Claude APIs, a scalability test can quickly turn into a token-spending test.Fair enough. We shouldn’t burn real inference just to test whether our own gateways, queues, WebSockets, streaming paths, retries, etc. can handle load.The proposed solution was to mock all communication between our backend and the LLM provider.Also reasonable.What surprised me was the next step: we have to build and maintain that mocking service ourselves.We can certainly do that. But should every company integrating with LLM APIs have to reinvent this?Stripe solved a similar developer-experience problem years ago. They provide test mode, test data, test helpers, and even stripe-mock. It isn’t intended to perfectly reproduce Stripe’s backend behavior, but that’s okay. For many tests, you just need something API-compatible and predictable.I’d love to see OpenAI, Anthropic, and other LLM providers offer something similar: an official API-compatible test endpoint that doesn’t invoke a model or consume billable tokens.Ideally it could support things like:* deterministic canned responses
* streaming responses
* configurable latency / time-to-first-token
* configurable token counts
* tool-call responses
* 429s, 5xx errors and timeouts
* malformed/interrupted streams
* rate-limit simulationThe goal wouldn’t be to benchmark the LLM provider. You’d still need the real API for that. The goal would be to stress-test everything around the model without paying for thousands or millions of unnecessary inference calls.What’s slightly ironic is that both OpenAI and Anthropic appear to use OpenAPI-based mock servers in their own SDK test suites. But, as far as I can tell, neither exposes that concept as a first-class public service for customers.Am I missing something?For teams running LLM applications at scale, how are you handling this today — homegrown mock server, generic HTTP mocking, record/replay, or just putting a budget cap on real API load tests?

---

## Objective

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
