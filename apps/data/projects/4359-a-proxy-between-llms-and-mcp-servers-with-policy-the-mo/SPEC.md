---
id: "4359"
slug: a-proxy-between-llms-and-mcp-servers-with-policy-the-mo
title: A Proxy between LLMs and MCP servers with policy the model cannot reach
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49520552"
category: show-hn
date: "2026-09-01"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# A Proxy between LLMs and MCP servers with policy the model cannot reach

## Problem

Hi, this is Banu. I am a cofounder at sentelabs.ai.We are developing extensible-mcp as an open-source proxy that sits between LLMs and MCP servers. The idea behind extensible-mcp is that the model shouldn't have to load every available tool, and policy enforcement shouldn't live in anything the model can access.As the agent can be influenced by any input it reads, a prompt cannot be fully trusted, and this layer restricts the agent's capabilities to only what is allowed by a deterministic policy. Also, every loaded tool is both added context and additional attack surface; extensible-mcp lets the model discover capabilities on demand, reducing context overhead and limiting what the model can access at any given time.It's available now as a self-hosted, Apache-2.0 open-source project.
It runs as a stdio MCP server itself, so any MCP client can connect to it like any other server.
104 tests are currently passing, and the example configurations work against the official GitHub MCP server.In future updates, we plan to make human approvals cryptographically verifiable, which proves a real person approved this exact action. And, the policies will be written in Lean, a proof assistant, and translated to Rego for execution, so you can mathematically prove the rules behave as claimed.My co-founder Matthew Fuchs came up with the idea, designed the architecture, and built it. I support the product, design, human-trust and authority side.I wanted to post this here as we need your honest feedback and opinions. I am very curious about what the HN community thinks about it.

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
