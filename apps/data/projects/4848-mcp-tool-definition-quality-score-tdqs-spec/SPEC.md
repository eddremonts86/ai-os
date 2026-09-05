---
id: "4848"
slug: mcp-tool-definition-quality-score-tdqs-spec
title: MCP Tool Definition Quality Score (TDQS) Spec
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49553343"
category: show-hn
date: "2026-09-03"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# MCP Tool Definition Quality Score (TDQS) Spec

## Problem

Hey everyone,You may know me because of my Open-Source work like awesome-mcp-servers, FastMCP (node.js), ViteMCP, mcp-proxy, mcp-remote, and a few other projects in the MCP ecosystem, including Glama.I was lucky enough to be present when MCP was first announced. That let me to contribute to the foundations of this new protocol and everything that has evolved around it. It also let me to be at the center of a lot of feedback, and by far the biggest complaint about the MCP ecosystem has been the inconsistent quality. Quality here means a lot of things, but server JSON definition is a big part of it. Bad tool definitions mean that tools are not selected when they should be, they are when they shouldn't, they are improperly invoked, etc.TDQS is an open-source specification (https://github.com/glama-ai/tool-definition-quality-score) for evaluating the quality of the MCP server definitions. It's not a complete solution to the quality problem, but it is a research based rubric that increases clarity over what tools are available, what are their behaviors/purpose, and when/how they are supposed to be used.TDQS is what Glama uses to score 15,000+ Open-Source and remote MCPs. And https://tdqs.dev is a free website to promote the spec and increase the adoption through better documentation and easy to use playground/CLI/API/SDKs.Would love your feedback and participation in improving the quality of the MCP ecosystem.

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
