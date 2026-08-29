---
id: "3719"
slug: agentbridge-let-one-ai-think-while-another-ai-writes-th
title: AgentBridge – Let one AI think while another AI writes the code
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49488074"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Open Source, MCP, Agents, Developer Tools]
tech: [Rust, MCP (Model Context Protocol), OpenCode, Gemini, Claude]
---
# AgentBridge – Let one AI think while another AI writes the code

## Tech Stack

- **Frontend:** React + TypeScript
- **Backend:** Node.js API (TanStack Start)
- **DB:** SQLite with Drizzle ORM
- **Deployment:** Coolify + Docker

## Architecture

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   Client    │────▶│   API       │────▶│   DB        │
└─────────────┘     └─────────────┘     └─────────────┘
```

## Milestones

1. **M0:** Project setup + SPEC.md + DESIGN.md approved
2. **M1:** Scaffold + auth
3. **M2:** Core feature
4. **M3:** Testing + deployment

## Risks

- Dependency on external APIs
- Ambiguous scope without further detail
