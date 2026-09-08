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

## Problem

When the user asks Claude Code, Antigravity, or another AI agent to write tests, design an API, optimize for AEO, or build a multi-agent graph, the agent has to load the matching skill into its context. A skill is a drop-in domain skill file; the Claude Skills Starter Kit ships 20 free production-ready skills covering AI agents (LangChain LCEL, multi-agent handoffs, signal-based agents), RAG and search (pgvector hybrid search, COGS metering), AI search / GEO (answer-first formatting, schema.org JSON-LD), engineering (TDD, code review, security), security (OWASP, secrets protection), architecture (RESTful & GraphQL, error codes), testing (eval-driven development), integrations (MCP TypeScript/Python servers), product (PRD review, PRD generation), prompts (zero-shot CoT, system prompt caching), and UI/UX (design tokens, component specs).

The source is the GitHub repository for `yevhens-hue/claude-skills-starter-kit`. The repo is MIT-licensed, with the 20 skills listed in a table that names the category and a one-line description per skill. The install path is `git clone` then `cp -r claude-skills-starter-kit/skills/* ~/.claude/skills/` (for Claude Code) or `cp -r claude-skills-starter-kit/skills/* ~/.gemini/config/skills/` (for Gemini / Antigravity IDE). A full production suite of 198 skills is offered on Gumroad for $49.

The source names the actor (a developer using Claude Code or Antigravity who wants the agent to load the right skill for each task), the pain (the user has to prompt the agent to load a skill, or the agent has no skill to load), and the missing thing (20 free production-ready domain skills that the agent auto-loads when the user asks the matching task). It does not name a specific agent framework beyond Claude Code and Antigravity, a specific skill-loading trigger, or a specific version compatibility matrix.

## Objective

Build the Claude Skills Starter Kit: 20 free MIT-licensed domain skills for Claude Code, Antigravity, and AI agents, covering AI agents, RAG and search, AI search / GEO, engineering, security, architecture, testing, integrations, product, prompts, and UI/UX, with a one-line install path and a sponsor / Gumroad upsell to a 198-skill full suite.

## Target Users

- Developers using Claude Code who want the agent to load the right domain skill when the user asks the matching task.
- Developers using Antigravity IDE (or Gemini CLI) who want the same skill-loading behaviour.
- Open-source contributors who want a drop-in skills folder that turns the agent into a senior engineer / architect / product manager.
- Users who want to upgrade to the full 198-skill production suite via the Gumroad link.
- Developers who sponsor the maintainer via GitHub Sponsors and want a way to support ongoing development.

## MVP Scope

- 20 production-ready domain skills in `skills/`, each as a drop-in folder the user copies to `~/.claude/skills/` (Claude Code) or `~/.gemini/config/skills/` (Antigravity IDE).
- A category per skill: AI Agents, RAG & Search, AI Search (GEO), Engineering, Security, Architecture, Testing & Evals, Integrations, Product, Prompts, UI/UX Design.
- The 20 skills: agent-introspection-debugging, langchain-agent-patterns, multi-agent-crew-patterns, openai-agents-sdk, signal-based-ai-agent, pgvector-hybrid-search, enterprise-rag-knowledge-systems, geo-aeo-agent-optimization, airops-programmatic-content-engine, tdd-workflow, code-review-and-quality, security-and-hardening, security-review, api-design, eval-harness, mcp-server-patterns, prd-critic, product-spec-generator, prompt-engineer, ui-ux-pro-max.
- MIT license on the kit and the skills.
- A README with a per-skill table, the install commands (`mkdir -p ~/.claude/skills` then `cp -r claude-skills-starter-kit/skills/* ~/.claude/skills/`), and the sponsor / Gumroad upsell.
- A Gumroad link to the full 198-skill production suite at $49.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The 20 skills ship at launch. The plan does not invent a 21st skill.
- The install path is `cp -r claude-skills-starter-kit/skills/* ~/.claude/skills/` for Claude Code and `cp -r claude-skills-starter-kit/skills/* ~/.gemini/config/skills/` for Antigravity / Gemini. A divergence is an install-path failure.
- The license is MIT. The plan does not invent a different license.
- The full-suite upsell is the Gumroad link at $49. The plan does not invent a different price or a different distribution.
- The categories are the eleven the source names (AI Agents, RAG & Search, AI Search (GEO), Engineering, Security, Architecture, Testing & Evals, Integrations, Product, Prompts, UI/UX Design). The plan does not invent a twelfth category.
- The skills are drop-in domain skill files; the agent auto-loads them when the user asks the matching task. The plan does not invent a different loading mechanism.
- The sponsor link is GitHub Sponsors. The plan does not invent a different sponsorship platform.
- The README's per-skill table is the unit of trust the user sees. A skill missing from the table is a coverage gap.
