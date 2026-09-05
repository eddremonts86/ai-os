# SPEC.md — Building AI agents client-side JavaScript

## Problem

Hey HN, most agent systems default to server-side Python inside containers and chain frameworks. I wanted to see how far we could push agent in the browser with vanilla JavaScript <a href="https:&#x2F;&#x2F;buttercup.sh" rel="nofollow">https:&#x2F;&#x2F;buttercup.sh</a><p>The reason this is interesting is because agent loops in the browser keeps infrastructure costs low. No need for proxy or API calls. And ollama&#x2F;vLLM can be used for 100% offline. Also WebLLM for embedded. We need to consider CORS, API keys for remote models, access to visual state, and handling remote tool calls. I am working on a guide with references in vanilla JS. This is a short-lived guide starting mid-September with weekly topics.<p>Draft topics starting mid-September:<p>In-Browser Loops: Function calling, and deterministic multi-turn loops running purely in the browser runtime.
Vision (Multimodal): Capturing viewport screenshots using browser APIs.
Remote Agent Access &amp; Transports: Connecting the in-browser agent to remote agents.
Multi-Agent Coordination: Lightweight client-side agent, specialist delegation, and running concurrent sub-agents without locking the browser UI thread.<p>Everything is open source, zero-install, and runnable directly in the browser. Would love feedback from the HN community on agents running in browsers.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49557409)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-03T21:34:31Z

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
