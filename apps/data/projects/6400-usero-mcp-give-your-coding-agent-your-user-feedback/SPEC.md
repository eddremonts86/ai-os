# SPEC.md — Usero MCP, give your coding agent your user feedback

## Problem

Usero is a feedback tool: widget, email, Slack and app reviews into one clustered inbox. I recently put an MCP server in front of it at <a href="https:&#x2F;&#x2F;usero.io&#x2F;mcp" rel="nofollow">https:&#x2F;&#x2F;usero.io&#x2F;mcp</a>, which has been really useful in my own workflow.<p>To-date there are 36 tools (signup, clients, feedback, clusters, forms and theming, user tests, AI test runs). E.g. `list_clusters` returns clusters biggest first with up to three verbatim user quotes each. `request_ai_pr` has Usero write and open the pull request server-side on the connected repo.<p>I used to hate MCP because of the bloat it gave your context, but since 2.1 Claude Code defers MCP tools, so the model sees tool names only until it loads one.<p>Here&#x27;s a full example transcript, with all tool calls: <a href="https:&#x2F;&#x2F;usero.io&#x2F;blog&#x2F;feedback-mcp-server#full-transcript" rel="nofollow">https:&#x2F;&#x2F;usero.io&#x2F;blog&#x2F;feedback-mcp-server#full-transcript</a><p>Pricing: free tier is $0 with 5 AI PRs a month, Pro is $39 for 50, Team is $89 for 200. MCP is on every tier. Blog post: <a href="https:&#x2F;&#x2F;usero.io&#x2F;blog&#x2F;feedback-mcp-server" rel="nofollow">https:&#x2F;&#x2F;usero.io&#x2F;blog&#x2F;feedback-mcp-server</a>.<p>I&#x27;m building this because I think as building features gets easier, it becomes even more important for startups to listen to their users and focus on high-quality product decisions. My goal is making those product decisions as easy as possible, helping companies be UserObsessed.<p>I&#x27;d love to hear your thoughts.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49658898)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-11T14:18:52Z

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
