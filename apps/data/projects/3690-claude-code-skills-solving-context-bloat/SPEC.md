---
id: "3690"
slug: claude-code-skills-solving-context-bloat
title: Claude Code Skills – Solving context bloat
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49484600"
  captured: "2026-08-28"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Markdown (SKILL.md), Bash installer, Claude Code / Antigravity drop-in directory, MIT-licensed repo]
---
# Claude Code Skills – Solving context bloat

## Problem

Claude Code and Antigravity both support a "skills" directory — `~/.claude/skills/` or `~/.gemini/config/skills/` — where each skill is a `SKILL.md` file the model loads into context on demand. Authors who want their agents to follow specific workflows (debugging, security review, PRD critique, API design, etc.) have to write those SKILL.md files by hand, with no curated starting point, and as a result every skill either ships half-finished or duplicates a generic prompt already on the internet. The Show HN submission posts a free, MIT-licensed starter kit with five working skills (`agent-introspection-debugging`, `api-design`, `security-review`, `prd-critic`) that a developer can clone, copy into the local skills directory, and use immediately. The author also points to a paid "Full 84-Skill Pack" on Gumroad at $49, which a HackerNews commenter dismissed as "AI slop" — that pushback is part of the product context because it frames the value the free tier has to demonstrate (it must be visibly higher-quality than the perceived default, or the funnel to the paid pack has no credibility).

## Objective

Ship a curated, MIT-licensed starter kit of SKILL.md files that any developer can clone and copy into their local Claude Code or Antigravity skills directory in under a minute, with at least five skills that each cover a workflow the model would otherwise handle with generic prompting (debugging an AI agent, designing a REST API, running a pre-flight security review, critiquing a PRD). The free tier must stand on its own — the value of the paid 84-skill pack rests on this free tier being obviously load-bearing rather than a teaser.

## Target Users

- **Primary:** solo developers and small-team engineers already using Claude Code or Antigravity who want drop-in, opinionated workflows for repetitive tasks (debugging, security review, API design, PRD critique) without writing each skill from scratch.
- **Secondary:** indie developers and consultants building agentic products who need a known-good template structure they can fork and adapt for their own domain skills.
- **Tertiary:** Claude Code plugin authors who want a reference implementation that demonstrates what a well-shaped SKILL.md looks like (frontmatter, trigger conditions, numbered steps, pitfalls).

## MVP Scope

- Five skills in the starter kit, each as a single `SKILL.md` under `claude-skills-starter-kit/skills/SKILL_NAME/SKILL.md`, MIT licensed:
 - `agent-introspection-debugging` — structured self-debugging workflow and synthetic failure injection for AI systems.
 - `api-design` — REST and interface design standards, error codes, and idempotent contracts.
 - `security-review` — pre-flight security checklists, OWASP guardrails, and input sanitisation.
 - `prd-critic` — automated PRD review against user outcomes, edge cases, and testability.
- A README that documents the 30-second install: `git clone` → `mkdir -p ~/.claude/skills` → `cp -r claude-skills-starter-kit/skills/* ~/.claude/skills/`. The same path works for `~/.gemini/config/skills/`.
- Each SKILL.md follows the project's published frontmatter conventions (name, description with a trigger phrase, license, metadata) so the model can load it without ambiguity.
- A reference link to the paid 84-skill pack on Gumroad, with a clear label that the free starter kit is independent of the paid pack.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- License: MIT for the starter kit (per the source). The free tier must remain MIT-licensed even if the paid tier on Gumroad is sold under different terms.
- No paid-only content may be silently injected into the free SKILL.md files; the free skills must be useful on their own.
- Install path: the only supported install is `git clone` + `cp -r`. No npm publish, no Homebrew formula, no installer wizard in v1.
- The README must distinguish between "Claude Code / CLI" (`~/.claude/skills`) and "Gemini / Antigravity IDE" (`~/.gemini/config/skills`) so users do not paste to the wrong path.
- The skill names and folder layout are part of the contract: changing them breaks the documented `cp -r` install, so they must be stable.
