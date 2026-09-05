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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

spendshield gives an AI agent a single place to ask before moving real money: the answer can be trust, hold-for-human, or block. The agent cannot reach the payment processor without going through that gate, which is the simplest way to convert the post's "the AI spent $15" story into a structural guarantee.


## Target Users

Developers and operators wiring autonomous AI agents into payment processors who want a thin human-in-the-loop gate between the agent and the charge. Assumes the reader has already accepted that an unattended agent needs a brake before it is allowed to move real money.

## Jobs To Be Done

- When my AI agent is about to charge a real customer, I want a gate so it cannot charge without my approval.
- When the charge is small or the recipient is known, I want a default rule so I do not have to approve every transaction.
- When the agent misbehaves, I want the guardrail to block the charge and surface the event to me.


## Success Metrics

- Latency overhead of the gate per charge (must stay small).
- Coverage of default rules (test-mode, low-value, known-recipient) shipped out-of-the-box.
- Number of payment processors with documented integrations.


## Pricing & Monetization

Source post does not state pricing or monetisation beyond what is named in the live product page (which is referenced where relevant in the Value Proposition). Treat pricing as unstated until the author publishes a model.

## Competitive Landscape

Closely related work includes spend-cap products, agent-wallet primitives, and payment-processor-level safety features. The captured source post describes the failure mode (an agent spent $15 on a test order) but does not name specific competitors in the source text.


## Risks & Open Questions

- A misconfigured rule can block legitimate revenue; the rule interface has to be ergonomic so operators actually use it.
- The guardrail only protects against future charges; the author already lost $15, which the post does not pretend to recover.
