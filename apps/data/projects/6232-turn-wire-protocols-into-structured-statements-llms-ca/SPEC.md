# SPEC.md — Turn wire protocols into structured statements LLMs can understand

## Problem

Hi HN, we built an extension to Envoy proxy that parses and sends contents of requests to an LLM at runtime.<p>We do that by adding a deterministic SQL parser, gGRPC payload inspection and LLM analysis of the payload before upstream call.<p>Users are proxying headless agents traffic with it so that sec teams can have their prompts blocking harmful actions via network traffic before it leaves the agent.<p>When you tell the LLM analyzing the traffic to block writes, it will spot it across the different protocols by looking at the structured payload we build from parsing the binary protocol.<p>It runs as a UDS upstream, and we&#x27;re exploring bundling it inside envoy to remove the UDS hop.<p>Envoy is incredible, but it has limited support for anything outside http. Basic database query parsing, little policy enforcement on request contents, most of the stuff happens on HTTP and gRPC headers or metadata.<p>Would love to hear any feedback: <a href="https:&#x2F;&#x2F;github.com&#x2F;hoophq&#x2F;hoop&#x2F;tree&#x2F;main&#x2F;sidecar" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;hoophq&#x2F;hoop&#x2F;tree&#x2F;main&#x2F;sidecar</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49646376)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-10T16:25:23Z

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
