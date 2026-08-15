---
id: "498"
slug: im-building-an-evidence-based-governor-for-coding-agent
title: I’m building an evidence-based governor for coding agents — looking for people to try it
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SideProject/comments/1vnzfc1/im_building_an_evidencebased_governor_for_coding/"
category: sideproject
date: "2026-08-14"
tech: [TypeScript, Node.js (Fastify), PostgreSQL, Redis, Docker, MCP (Model Context Protocol)]
---
# I’m building an evidence-based governor for coding agents — looking for people to try it

## Problem

Source: [reddit.com/r/SideProject/comments/…]([reddit.com/r/SideProject/comments/…]([reddit.com/r/SideProject/comments/…]([reddit.com/r/SideProject/comments/…]([reddit.com/r/SideProject/comments/…](https://www.reddit.com/r/SideProject/comments/1vnzfc1/im_building_an_evidencebased_governor_for_coding/)))))

Original post:

> I’ve been working on MARGINAL, an open-source governance layer for coding agents. The idea is simple: agents are good at taking actions, but not always good at deciding whether the next action is still worth the compute. MARGINAL watches the trajectory and looks for things like repeated actions, weak progress, redundant verification, and low-value continuation. It can run in Shadow Mode first, so it observes and records what it would have done without blocking anything. Current focus is reliability, not just token reduction. A few core pieces: local-first trajectory and evidence tracking deterministic reason codes and hashes for decisions governance overhead measurement replay and benchmark support Shadow Mode before enforcement Earned Enforcement: MARGINAL has to prove it is reliable on a repo before it gets permission to block or redirect the agent automatic fallback to Shadow Mode if confidence degrades I’m also working on the next layer now: counterfactual evaluation and intervention regret. The goal is to answer a harder question than “did MARGINAL stop something?”: Would the agent actually have done better if MARGINAL had stayed out of the way? That’s the part I think matters if this is going to be useful beyond being another loop detector or token limiter. GitHub: https://github.com/SignalLayerLabs/Marginal If you use Codex or another coding agent, I’d really appreciate people trying it on real work and telling me where it helps, where it gets in the way, or where the design is wrong. I’m especially interested in: technical criticism bad cases reproducible failures. submitted by /u/Positive-Captain-709 [link] [comments]

---

What this plan addresses: MARGINAL: an open-source evidence-based governor for coding agents that constrains what an agent is allowed to do.

## Objective

MARGINAL: an open-source evidence-based governor for coding agents that requires agents to cite evidence for each action and respects per-action policies. When I am using an AI coding agent, I want a governor that requires evidence for each action and respects per-action policies, so the agent does not silently go off-script.

## Target Users

- Engineering teams using AI coding agents who need guardrails
- Solo founders worried about an agent going off-script
- Agencies deploying AI-built code for clients

## MVP Scope

- Evidence-based policy: agent must cite evidence for each action
- Per-action allow / deny / require-approval
- Audit log of every agent action
- MCP integration for popular coding agents

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SideProject/comments/1vnzfc1/im_building_an_evidencebas` follows the constraints in `498-.../SPEC.md` and the chosen stack (TypeScript, Node.js (Fastify), PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body mentions MARGINAL explicitly as an evidence-based governor for coding agents
- Plan keeps the governor framing
- Source did not name a price (open-source implied)
