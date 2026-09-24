# SPEC.md — Authorize MCP tool calls without giving agents the credentials

## Problem

Hey HN, Adam here.<p>We built a small MCP example around a single problem:<p>How do you let an agent use a tool that needs credentials without giving the credentials to the agent?<p>The demo has two tools. One is open. One is protected.<p>When the agent calls the protected tool, Keydris checks the policy first:<p>ALLOW → run the tool
REJECT → stop<p>The credential stays on the server. The agent never sees it.<p>We do the check through a small middleware on the MCP server called the KIT Reader.<p>Repo: <a href="https:&#x2F;&#x2F;github.com&#x2F;keydrisLabs&#x2F;mcp-auth-keydris-template" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;keydrisLabs&#x2F;mcp-auth-keydris-template</a><p>We&#x27;re early. If you&#x27;re building with MCP, Claude Code or Codex, I&#x27;d love to know how you&#x27;re handling this today and where you think this approach breaks.<p>We support other elements like integrations etc but would love your feedback

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49695295)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-14T11:52:07Z

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
