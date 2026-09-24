# SPEC.md — AgentDrive – persistent, versioned file storage for AI agents

## Problem

We’re opening the private beta for AgentDrive, a persistent file&#x2F;workspace layer for AI agents.<p>AgentDrive gives agents:<p>- Versioned artifacts and folders
- Hosted MCP access for coding agents
- Direct upload sessions for larger files
- Share links and controlled public publishing
- Workspace-scoped authorization and auditability
- Many supported file formats such as MD, HTML, JSON, images, videos, and even spreadsheets<p>The MCP surface is intentionally narrow and reviewed rather than exposing the entire storage API.<p>It’s a private beta, so some features are deliberately out of scope for now.<p>See more details: <a href="https:&#x2F;&#x2F;tokencanopy.com&#x2F;products&#x2F;agentdrive" rel="nofollow">https:&#x2F;&#x2F;tokencanopy.com&#x2F;products&#x2F;agentdrive</a><p>Try the beta: <a href="https:&#x2F;&#x2F;app.tokencanopy.com&#x2F;drive&#x2F;" rel="nofollow">https:&#x2F;&#x2F;app.tokencanopy.com&#x2F;drive&#x2F;</a><p>For MCP clients:<p><pre><code>   claude mcp add --transport http --scope user agentdrive https:&#x2F;&#x2F;drive.mcp.tokencanopy.com&#x2F;mcp
   claude mcp login agentdrive

   codex mcp add agentdrive --url https:&#x2F;&#x2F;drive.mcp.tokencanopy.com&#x2F;mcp
   codex mcp login agentdrive
</code></pre>
A public API&#x2F;SDK integration experience is on the roadmap so that you can use AgentDrive in your product, but it is not available as a beta user interface today.<p>We’d especially appreciate feedback on:<p>1. Was connecting and using AgentDrive through MCP clear?
2. Which tools or storage primitives are missing?
3. What would be the first workflow you ask your agents do with AgentDrive?<p>Open source repo is also on the roadmap so that you can host it on your own infrastructure! Sign up at tokencanopy.com for more future updates.<p>Any feedback or feature requests can be sent to support@team.tokencanopy.com. You can reach out to me directly at josh@tokencanopy.com<p>I&#x27;d love to personally connect with more founders and developers who are building in the coding agent infra space: <a href="https:&#x2F;&#x2F;github.com&#x2F;jiashuoz" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;jiashuoz</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49699287)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-14T16:09:02Z

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
