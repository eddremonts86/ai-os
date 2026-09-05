# SPEC.md — MCP Tool Definition Quality Score (TDQS) Spec

## Problem

Hey everyone,<p>You may know me because of my Open-Source work like awesome-mcp-servers, FastMCP (node.js), ViteMCP, mcp-proxy, mcp-remote, and a few other projects in the MCP ecosystem, including Glama.<p>I was lucky enough to be present when MCP was first announced. That let me to contribute to the foundations of this new protocol and everything that has evolved around it. It also let me to be at the center of a lot of feedback, and by far the biggest complaint about the MCP ecosystem has been the inconsistent quality. Quality here means a lot of things, but server JSON definition is a big part of it. Bad tool definitions mean that tools are not selected when they should be, they are when they shouldn&#x27;t, they are improperly invoked, etc.<p>TDQS is an open-source specification (<a href="https:&#x2F;&#x2F;github.com&#x2F;glama-ai&#x2F;tool-definition-quality-score" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;glama-ai&#x2F;tool-definition-quality-score</a>) for evaluating the quality of the MCP server definitions. It&#x27;s not a complete solution to the quality problem, but it is a research based rubric that increases clarity over what tools are available, what are their behaviors&#x2F;purpose, and when&#x2F;how they are supposed to be used.<p>TDQS is what Glama uses to score 15,000+ Open-Source and remote MCPs. And <a href="https:&#x2F;&#x2F;tdqs.dev" rel="nofollow">https:&#x2F;&#x2F;tdqs.dev</a> is a free website to promote the spec and increase the adoption through better documentation and easy to use playground&#x2F;CLI&#x2F;API&#x2F;SDKs.<p>Would love your feedback and participation in improving the quality of the MCP ecosystem.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49553343)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-03T17:12:00Z

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
