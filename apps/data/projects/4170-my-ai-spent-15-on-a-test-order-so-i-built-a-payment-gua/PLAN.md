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

## Tech Stack

spendshield is a small service and SDK pair; the surrounding docs site uses React + TypeScript on TanStack Start with SQLite/Drizzle for the rule / audit log. Coolify hosts the docs behind Docker.

## Architecture

A TanStack Start app serves the docs and the rule-configuration UI; the actual guardrail is a service the agent calls before any payment-processor call. A Drizzle-managed SQLite store keeps the audit log and the default rules; the human-approval path can be a webhook, an email, or a CLI prompt. Coolify hosts the docs behind Docker.

## Milestones

- M1 — Guardrail service exposes the "ask before charge" primitive.
- M2 — Default rules ship with the library (test mode, low-value, known recipients).
- M3 — Human-approval path works (webhook + email).
- M4 — Documented integration with at least one payment processor.
- M5 — Public release.

## Risks

- A misconfigured rule can block legitimate revenue; the rule interface has to be ergonomic so operators actually use it.
- The guardrail only protects against future charges; the author already lost $15, which the post does not pretend to recover.
