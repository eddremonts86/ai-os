---
tags: ["saas", "lead-generation", "ai", "b2b"]
tech: ["Next.js", "TypeScript", "React Flow", "Anthropic Claude", "Supabase", "Stripe"]
id: "557"
slug: ive-been-building-this-for-the-last-8-months
title: I’ve been building this for the last 8 months.
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo5zyk/ive_been_building_this_for_the_last_8_months/"
category: saas
date: "2026-08-14"
---
# I've been building this for the last 8 months — indiatrusty

## Problem

A founder has been building indiatrusty for 8 months. The product idea: instead of websites only collecting leads, they should help people make better decisions first. The system combines decision logic, calculations, and AI only where needed, so it can keep token / API cost low while still giving personalised recommendations. It can work for many consultation-heavy businesses: financial products, insurance, agriculture inputs, solar installation, electronics, real estate, machinery, healthcare services, education, B2B products. The customer gets guided step by step, understands the best option for their situation, and the business receives a much more qualified lead with useful context.

## Objective

Define the MVP scope for indiatrusty as a decision-support engine that wraps each business's consultation flow with guided questions, deterministic logic where possible, and AI only where needed. The MVP has to demonstrate the round-trip: pick a business vertical, define the decision tree, deploy a guided experience, capture the qualified lead.

## Target Users

- **Primary:** consultation-heavy businesses in India (financial products, insurance, solar installation) that currently lose leads because their website is a static contact form.
- **Secondary:** B2B businesses with a sales process that needs qualification before a human takes over.
- **Tertiary:** education and training businesses that need to match prospects to the right course.

## MVP Scope

- Decision-tree builder: drag-and-drop nodes (question, calculation, branch, AI assist).
- Guided-experience widget: a JS embed that any business can drop on their site.
- Lead capture at the end of the guided flow, with the full decision context attached.
- Token-cost cap per guided experience (AI used only where the decision tree needs it).
- Per-vertical templates: solar installation, personal loans, health insurance.
- Free tier: 1 guided experience, 100 leads/month. Pro at $49/month: 10 experiences, 5,000 leads.
- Excluded in v1: white-label mobile apps, multi-language, voice assistants.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single decision-engine surface — the tree builder on the left, the guided-experience preview in the centre, the lead inbox on the right. No marketing-site chrome; the product is the tree.

## Constraints

- AI inference must be the exception, not the rule; the decision tree is the primary path.
- Token cost per guided experience must be bounded; runaway AI usage will eat the founder's margin.
- Per-vertical templates must be opinionated; a generic tree builder is not the differentiator.
