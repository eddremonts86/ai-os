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

## Value Proposition

A Claude Skills Starter Kit with 20 free production-ready MIT-licensed domain skills for Claude Code, Antigravity, and AI agents, covering AI agents, RAG and search, AI search / GEO, engineering, security, architecture, testing, integrations, product, prompts, and UI/UX. Each skill is a drop-in folder the user copies to `~/.claude/skills/` (Claude Code) or `~/.gemini/config/skills/` (Antigravity / Gemini), and the agent auto-loads the matching skill when the user asks the matching task — TDD, API design, AEO, multi-agent graphs, and the rest.

The kit ships with a sponsor link (GitHub Sponsors) and a Gumroad upsell to the full 198-skill production suite at $49. The 20 skills cover the surface area the README names; the full suite covers the depth.

**One-liner:** A 20-skill drop-in kit for Claude Code and Antigravity that auto-loads the right skill per task, with MIT licensing and a sponsor + Gumroad upsell to a 198-skill production suite.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Claude Code developers | Want the agent to load the right skill per task. |
| Antigravity IDE users | Want the same skill-loading behaviour. |
| Open-source contributors | Want a drop-in skills folder that turns the agent into a senior engineer. |
| Gumroad upsell users | Want the full 198-skill production suite at $49. |
| Sponsors | Want to support the maintainer via GitHub Sponsors. |

## Jobs To Be Done

1. **Functional job** — Install the 20 skills into `~/.claude/skills/` (Claude Code) or `~/.gemini/config/skills/` (Antigravity) and have the agent auto-load the matching skill per task.
2. **Functional job** — Use the agent for TDD, API design, AEO, multi-agent graphs, and the rest without prompting the agent to load a skill.
3. **Functional job** — Upgrade to the full 198-skill production suite via the Gumroad link.
4. **Functional job** — Sponsor the maintainer via GitHub Sponsors.
5. **Emotional job** — Stop the feeling that the agent is doing the task without a domain skill behind it.
6. **Social job** — Be the developer whose agent is a senior engineer / architect / product manager because the matching skill loads on demand.

## Success Metrics

- **Install-path success rate** — share of `cp -r claude-skills-starter-kit/skills/* ~/.claude/skills/` (or `~/.gemini/config/skills/`) installs that succeed. A failed install is a setup failure.
- **Auto-load trigger rate** — share of matching user tasks where the agent auto-loads the matching skill. A task the agent does not auto-load is a coverage gap.
- **Per-skill coverage** — share of the 20 skills the agent can load on demand. A skill missing from the load surface is a coverage gap.
- **MIT-license verification** — share of the 20 skills and the kit that ship under MIT. A license the user cannot verify is a license-drift failure.
- **Gumroad upsell click rate** — share of users that click the Gumroad link to the full 198-skill production suite. The metric is the upsell funnel.
- **GitHub Sponsors click rate** — share of users that click the GitHub Sponsors link. The metric is the sponsorship funnel.
- **Per-category coverage** — share of the eleven named categories the user can reach via a per-skill table entry. A category the user cannot reach is a coverage gap.

## Pricing & Monetization

The 20-skill kit is MIT-licensed and free. The full 198-skill production suite is $49 on Gumroad. The sponsor link is GitHub Sponsors. The plan does not invent a different price, a different distribution, or a different sponsorship platform. Any future monetization has to be measured against the install-path success rate and the auto-load trigger rate, because those are the metrics the source ties to the kit's value proposition.

## Competitive Landscape

- **Single-skill repositories (the names the source does not provide)** — ship one skill per repo; the source's pitch is the 20-skill breadth in one kit.
- **Claude Code's built-in skills (the names the source does not provide)** — ship with the agent; the source's pitch is the depth of the 20 categories.
- **Vendor-locked skill platforms (the names the source does not provide)** — require a subscription; the source's pitch is the MIT licensing and the Gumroad upsell.
- **Custom in-house skill folders** — work for a specific team; the source's pitch is the drop-in install path and the README's per-skill table.

The post names no specific incumbent, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the install path works across Claude Code versions. The source names the install path; the open question is whether a future Claude Code release changes the skills directory location.
- [ ] Validate the auto-load trigger is consistent across the 20 skills. The source is explicit that the agent auto-loads the matching skill; the open question is whether the trigger is per-skill (the README's one-line description) or per-category (the eleven named categories).
- [ ] Define the policy on a skill the user wants to disable. The kit is a drop-in folder; the open question is whether the user can disable a single skill without removing the folder, or whether the user has to remove the folder entirely.
- [ ] Confirm the Gumroad upsell is the right distribution. The source names the Gumroad link; the open question is whether a future version adds a different distribution (a license key, a private package) and how the Gumroad link is preserved.
- [ ] Decide the policy on a future skill addition. The source ships 20 skills; the open question is whether the kit adds a 21st skill and how the 20-skill launch set is preserved.
- [ ] Establish a documented escalation path when the Antigravity IDE install path breaks. The source names `~/.gemini/config/skills/`; the open question is whether a future Antigravity release changes the path.
- [ ] Define the policy on a per-category expansion. The source names eleven categories; the open question is whether the kit adds a twelfth category and how the eleven-category launch set is preserved.
