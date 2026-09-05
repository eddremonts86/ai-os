---
id: "4170"
slug: my-ai-spent-15-on-a-test-order-so-i-built-a-payment-gua
title: "My AI spent $15 on a test order, so I built a payment guardrail"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49511045"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# My AI spent $15 on a test order, so I built a payment guardrail

## Problem

The author of spendshield (github.com/felixpg13-glitch/spendshield) wired an AI agent up to a real payment processor. The agent, running on its own, placed a test order for $15 the author did not intend. The post is the realisation that an AI acting on real money needs a guardrail between it and the charge. spendshield is that guardrail — a payment layer that the agent must talk to before any real money moves. The post does not describe the precise primitives the guardrail exposes, only the role: stop the agent from spending without a human in the loop.


---

## Objective

Ship a payment guardrail that an autonomous AI agent must call before a real charge, so a runaway agent cannot spend money the operator did not approve.


## Target Users

Developers and operators wiring autonomous AI agents into payment processors who want a thin human-in-the-loop gate between the agent and the charge. Assumes the reader has already accepted that an unattended agent needs a brake before it is allowed to move real money.


## MVP Scope

- A small library / service that sits between an AI agent and a payment processor.
- A rule interface that decides whether a charge is allowed, blocked, or held for human approval.
- A human-approval path (e.g. a webhook, an email, a CLI prompt) that releases a held charge.
- Default rules for obvious cases (test mode, low-value charges, known recipients).
- A documented integration with at least one payment processor.


## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Source post does not state pricing, hosting posture, or business model.
- The guardrail must not weaken the payment processor's own safety guarantees; it is an additional gate, not a replacement.
- False negatives (blocking a legitimate charge) are tolerable; false positives (allowing an unintended charge) are the bug the whole library exists to prevent.
