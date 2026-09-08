---
id: "4167"
slug: turn-repeated-coding-agent-corrections-into-rulesskills
title: Turn repeated coding-agent corrections into rules/skills
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49511274"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# Turn repeated coding-agent corrections into rules/skills

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

Blume is the rules-maintenance layer your coding agents are missing: it watches your sessions, clusters the corrections you keep making, and proposes small diffs to your rules and skills — only when the pattern crosses a threshold — so your agents stop drifting without burying you in bloat.

**One-liner:** A local watcher that proposes rule and skill updates only after coding-agent corrections repeat enough times.

## Target Users

Developers using Claude Code, Codex or Cursor daily. Early adopters are solo builders and small teams who already write rules/skills for their agents and want them to stay current.

## Jobs To Be Done

- When I keep correcting my agent on the same thing, I want Blume to spot the pattern and propose a rule or skill update so I do not have to remember.
- When an update is proposed, I want a small reviewable diff so I stay the editor-in-chief.
- When my rules would otherwise rot, I want Blume to maintain them locally so I do not have to send my sessions to a third party.

## Success Metrics

- Number of rule/skill updates proposed, accepted and dismissed.
- After acceptance, reduction in corrections or tokens spent re-explaining the same thing (the gap the team explicitly calls out).
- Local-only posture: zero outbound transfer of session content.
- Time saved per week vs. hand-maintained rules.

## Pricing & Monetization

Free to use today; the only 'cost' is local token spend on signal extraction and on the improvements themselves. Source flags optional cloud agents and team features as a future monetisation path; no pricing is stated.

## Competitive Landscape

Adjacent to ad-hoc 'best practices' guides for Claude Code/Cursor and to session-recording tools (e.g. agents that summarise what happened). Blume's differentiator is the cluster-and-threshold loop that turns repeated corrections into reviewable rule diffs without bloat, and the explicit local-only posture.

## Risks & Open Questions

- The biggest known gap is the lack of measurement of whether an accepted change actually helped; mitigation is to ship a before/after counter and tie it to recurrence rates.
- Local-only posture is a strong claim; mitigation is to keep all signal-extraction code auditable on the user's machine.
- Threshold tuning is subjective; mitigation is to expose the threshold and let users adjust it.
- Monetisation is undefined for the free tier; mitigation is to keep the free path usable while validating the cloud/team upsell.
