---
id: "4160"
slug: rta-smriti-local-first-project-memory-for-coding-agents
title: Rta-Smriti – local-first project memory for coding agents
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49511544"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Rta-Smriti – local-first project memory for coding agents

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A sovereign local project-memory and evidence layer that any MCP-capable coding agent can query before doing work, so each new agent session starts with the project's prior decisions, repo conventions, and captured evidence instead of asking the developer to re-explain everything — with an explicit evidence boundary that keeps captured text untrusted until promoted.

## Target Users

AI-assisted developers and small engineering teams using Codex, Claude Code, Cursor, or any MCP-capable agent who repeatedly lose project decisions and context across sessions. Secondary reader: agent-harness authors who want a portable memory backend.

## Jobs To Be Done

When a developer opens a new coding-agent session on a project they have worked on before, the agent should be able to read the project's local memory (identity, decisions, conflicts, change impact) before doing work, instead of starting from a blank context and asking the developer to re-explain the project.

## Success Metrics

Whether the package passes the v1.0.4-alpha verification ledger (Windows/macOS/Linux matrix across Python 3.11/3.12/3.13, plus acceptance tests on a disposable Git repo); coverage on independent reviews (featured on The Next New Thing GitHub roundup per the README); install footprint (the README claims no Node needed for the runtime user because built static files ship inside the Python package). No quantitative baseline is set.

## Pricing & Monetization

MIT-licensed per the repo; no paid tier is described in the source.

## Competitive Landscape

Adjacent local-memory layers exist (per-project CLAUDE.md / AGENTS.md files, .cursorrules, project-specific RAG corpora). The product differentiates on being a structured, evidence-aware, opt-in capture layer with an MCP surface rather than a flat text file or a hosted RAG service. No direct competitor comparison appears in the post.

## Risks & Open Questions

Local-first means every install is its own evidence store; consistency across machines is the developer's problem unless they wire their own sync, which the source does not claim to solve. A second risk is that "captured text is untrusted until promoted" is a discipline, not an enforcement, and any integration that skips the promotion step will silently leak untrusted claims into the agent's context.