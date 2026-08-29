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

## Phase 0: Scaffold

- [x] Capture Show HN submission at news.ycombinator.com/item?id=49484600
- [x] Public GitHub repo: yevhens-hue/claude-skills-starter-kit (MIT)
- [x] README with the 30-second install (clone + cp -r for Claude Code and Antigravity)
- [ ] Pin the SKILL.md frontmatter schema (name, description trigger phrase, license, metadata.version) and document it in the README
- [ ] Decide folder-naming policy: kebab-case, never rename without a deprecation note

## Phase 1: Core

- [ ] `agent-introspection-debugging/SKILL.md` — structured self-debugging workflow + synthetic failure injection
- [ ] `api-design/SKILL.md` — REST / interface design standards, error codes, idempotent contracts
- [ ] `security-review/SKILL.md` — pre-flight security checklist + OWASP guardrails + input sanitisation
- [ ] `prd-critic/SKILL.md` — PRD review against user outcomes, edge cases, testability
- [ ] Verify each SKILL.md loads on its trigger phrase in Claude Code (no manual user invocation needed)
- [ ] Verify the same install path works under Antigravity (`~/.gemini/config/skills/`)
- [ ] Link to the paid 84-skill pack on Gumroad from the README, clearly labelled as a separate product
- [ ] End-to-end test: clean macOS box → `git clone` → `cp -r` → ask the model to "debug this agent" → confirm the skill loads

## Phase 2: Deploy

- [ ] GitHub Issue template for "request a skill" so the contribution loop is visible
- [ ] Tag a v1.0.0 release once all five skills pass the install verification on both CLIs
- [ ] Post-mortem at week 6: external PRs merged, HN submission points and comments, Gumroad pack conversion proxy
