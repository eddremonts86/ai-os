---
id: "4161"
slug: d5s-an-ai-coworking-space-for-people-and-agents
title: "D5s, an AI coworking space for people and agents"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49511513"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# D5s, an AI coworking space for people and agents

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

D5s turns a startup's Slack and Gmail into a coworking floor where humans set direction and AI coworkers handle the repeatable work. Workspaces scope what each coworker can see and do, so the team can ship operations the same way they ship product.

**One-liner:** A shared workspace where humans set direction and AI coworkers execute repeatable operational work via Slack and Gmail.

## Target Users

Founders and operators of small startups that already coordinate over Slack and Gmail. Adjacent: lean ops teams at scale-ups that want to delegate marketing, finance or invoice workflows to AI agents with scoped access.

## Jobs To Be Done

- When operational work piles up, I want AI coworkers scoped to my workspace so I can hand off repeatable tasks without giving them the keys to the company.
- When I coordinate in Slack and Gmail, I want agents that live in those tools so I do not switch apps.
- When my team grows, I want a workspace model that maps to engineering, GTM and finance so each function gets its own coworker.

## Success Metrics

- Number of early-access teams onboarded through the free plan with credits.
- Share of repeatable operational work (e.g. invoice processing) actually completed by coworkers rather than humans.
- Retention of early-access teams week-over-week.
- Scope-correctness: zero incidents of a coworker acting outside its workspace's permissions.

## Pricing & Monetization

Free early-access plan with credits for the first teams to sign up. Source does not state post-early-access pricing, monetisation model, or paid tiers.

## Competitive Landscape

General-purpose AI agent platforms (AutoGPT-style and SaaS copilots) target individual workflows. D5s's differentiator is the explicit 'coworker in a shared workspace' framing plus tight Slack/Gmail integration and per-workspace access controls, intended for whole startups rather than single users.

## Risks & Open Questions

- Source is founder narrative, not third-party validation; risk of building for the founders' own habits.
- Free-credit early access could distort willingness-to-pay signal.
- Scope-correctness bugs (an agent acting outside its workspace) are the highest-stakes failure mode.
- Slack/Gmail dependency means API changes can break the product.
