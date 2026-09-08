---
id: "4195"
slug: jit-skill-architecture-for-ai-agents-without-context-de
title: JIT Skill Architecture for AI Agents (Without Context Decay)
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509511"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# JIT Skill Architecture for AI Agents (Without Context Decay)

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4195-jit-skill-architecture-for-ai-agents-without-context-de/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the `skills/` folder with the 20 MIT-licensed skill folders (agent-introspection-debugging, langchain-agent-patterns, multi-agent-crew-patterns, openai-agents-sdk, signal-based-ai-agent, pgvector-hybrid-search, enterprise-rag-knowledge-systems, geo-aeo-agent-optimization, airops-programmatic-content-engine, tdd-workflow, code-review-and-quality, security-and-hardening, security-review, api-design, eval-harness, mcp-server-patterns, prd-critic, product-spec-generator, prompt-engineer, ui-ux-pro-max).
- [ ] Write the per-skill README table that maps each skill to a category (AI Agents, RAG & Search, AI Search (GEO), Engineering, Security, Architecture, Testing & Evals, Integrations, Product, Prompts, UI/UX Design) and a one-line description.
- [ ] Wire the Claude Code install path: `mkdir -p ~/.claude/skills` then `cp -r claude-skills-starter-kit/skills/* ~/.claude/skills/`.
- [ ] Wire the Antigravity / Gemini install path: `mkdir -p ~/.gemini/config/skills` then `cp -r claude-skills-starter-kit/skills/* ~/.gemini/config/skills/`.
- [ ] Add the GitHub Sponsors link in the README.
- [ ] Add the Gumroad upsell link to the full 198-skill production suite at $49.
- [ ] Add the MIT LICENSE file on the kit and verify each skill ships under MIT.
- [ ] Run an end-to-end test: a Claude Code user clones the repo, runs the Claude Code install path, asks Claude to write tests and design an API, sees the matching skill auto-load (tdd-workflow, api-design); an Antigravity user clones the repo, runs the Antigravity install path, sees the matching skill auto-load.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Publish the kit on GitHub with the per-skill README table, the install paths, the sponsor link, and the Gumroad upsell
- [ ] Document the auto-load trigger per skill in the README so the user knows what the agent will load when the user asks the matching task
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-31_
