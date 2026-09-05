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

## Tech Stack

- **20 MIT-licensed skill folders** in `skills/`, each with a category and a one-line description.
- **A drop-in install path** to `~/.claude/skills/` (Claude Code) or `~/.gemini/config/skills/` (Antigravity / Gemini).
- **A per-skill table in the README** with the category and a one-line description per skill.
- **The install commands**: `mkdir -p ~/.claude/skills` then `cp -r claude-skills-starter-kit/skills/* ~/.claude/skills/` (Claude Code) or `cp -r claude-skills-starter-kit/skills/* ~/.gemini/config/skills/` (Antigravity / Gemini).
- **The sponsor link** to GitHub Sponsors.
- **The Gumroad upsell** to the full 198-skill production suite at $49.
- **MIT license** on the kit and the skills.

## Architecture

The architecture has one folder (`skills/`), one README, and one install path per agent. The folder is the unit of trust the user sees; the README is the unit of navigation; the install path is the unit of onboarding.

The `skills/` folder holds the 20 MIT-licensed skill folders. Each skill folder is a drop-in domain skill the agent auto-loads when the user asks the matching task. The README's per-skill table maps the skill to a category and a one-line description. The install path copies the folder to the user's skills directory.

The Claude Code install path is `mkdir -p ~/.claude/skills` then `cp -r claude-skills-starter-kit/skills/* ~/.claude/skills/`. The Antigravity / Gemini install path is `mkdir -p ~/.gemini/config/skills` then `cp -r claude-skills-starter-kit/skills/* ~/.gemini/config/skills/`. A divergence from the source's exact commands is a setup failure.

The sponsor link to GitHub Sponsors is in the README. The Gumroad upsell to the full 198-skill production suite at $49 is in the README. The plan does not invent a different sponsorship platform, a different price, or a different distribution.

## Milestones

1. **M1 — `skills/` folder with the 20 skills** — the 20 MIT-licensed skill folders, each with a category and a one-line description.
2. **M2 — Per-skill README table** — the table that maps each skill to a category and a one-line description; the unit of navigation the user reads.
3. **M3 — Claude Code install path** — the `mkdir -p ~/.claude/skills` then `cp -r` commands the source names.
4. **M4 — Antigravity / Gemini install path** — the `mkdir -p ~/.gemini/config/skills` then `cp -r` commands the source names.
5. **M5 — Sponsor link** — the GitHub Sponsors link in the README.
6. **M6 — Gumroad upsell** — the link to the full 198-skill production suite at $49.
7. **M7 — MIT license** — the LICENSE file on the kit and the skills.

## Risks

- **Install-path regression** — a future Claude Code or Antigravity release changes the skills directory location. Mitigation: the install-path success rate is a metric; the README documents the install path; a regression is surfaced with a "your agent version changed the path" warning.
- **Auto-load trigger drift** — a future agent release changes the auto-load trigger. Mitigation: the auto-load trigger rate is a metric; the per-skill README description is the trigger; a drift is surfaced visibly.
- **Skill disable gap** — the user wants to disable a single skill without removing the folder. Mitigation: the disable policy is documented; the user can rename the skill folder or add a per-skill toggle the agent respects.
- **Gumroad upsell drift** — the Gumroad link changes or the price changes. Mitigation: the upsell link is the source of truth; a price change is reflected in the README; the upsell funnel is the unit of measurement.
- **Future skill addition** — the kit adds a 21st skill. Mitigation: the 20-skill launch set is documented; the 21st skill is a follow-up that does not displace the 20-skill README table.
- **Future category expansion** — the kit adds a twelfth category. Mitigation: the eleven-category launch set is documented; the twelfth category is a follow-up that does not displace the eleven-category table.
- **License drift** — a contributor adds a skill under a non-MIT license. Mitigation: the MIT license is documented; the per-skill license is verified in CI; a non-MIT skill is refused.
