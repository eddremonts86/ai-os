# SPEC.md — A Proxy between LLMs and MCP servers with policy the model cannot reach

## Problem

Hi, this is Banu. I am a cofounder at sentelabs.ai.<p>We are developing extensible-mcp as an open-source proxy that sits between LLMs and MCP servers. The idea behind extensible-mcp is that the model shouldn&#x27;t have to load every available tool, and policy enforcement shouldn&#x27;t live in anything the model can access.<p>As the agent can be influenced by any input it reads, a prompt cannot be fully trusted, and this layer restricts the agent&#x27;s capabilities to only what is allowed by a deterministic policy. Also, every loaded tool is both added context and additional attack surface; extensible-mcp lets the model discover capabilities on demand, reducing context overhead and limiting what the model can access at any given time.<p>It&#x27;s available now as a self-hosted, Apache-2.0 open-source project. 
It runs as a stdio MCP server itself, so any MCP client can connect to it like any other server. 
104 tests are currently passing, and the example configurations work against the official GitHub MCP server.<p>In future updates, we plan to make human approvals cryptographically verifiable, which proves a real person approved this exact action. And, the policies will be written in Lean, a proof assistant, and translated to Rego for execution, so you can mathematically prove the rules behave as claimed.<p>My co-founder Matthew Fuchs came up with the idea, designed the architecture, and built it. I support the product, design, human-trust and authority side.<p>I wanted to post this here as we need your honest feedback and opinions. I am very curious about what the HN community thinks about it.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49520552)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-01T11:32:41Z

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
