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

## Tech Stack

- **Web app:** Next.js + TypeScript + Tailwind CSS.
- **Decision-tree builder:** a custom React flow editor (React Flow).
- **Guided-experience widget:** a JS bundle that any business can drop on their site.
- **AI layer:** Anthropic Claude, called only for AI-assist nodes (not the deterministic path).
- **Storage:** Supabase (auth, the decision trees, the leads, the per-engagement token-cost cap).
- **Payments:** Stripe.

## Architecture

Web app + a per-tenant widget bundle. The decision tree runs in the browser; AI is called only on AI-assist nodes; the lead is captured at the end with the full context.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + a single-tree demo with one question and one branch. End of week 1.
2. **M1 — Decision-tree builder + guided-experience widget.** End of week 4.
3. **M2 — Per-vertical templates (solar, personal loans, health insurance).** End of week 6.
4. **M3 — Token-cost cap + AI-assist nodes.** End of week 8.
5. **M4 — Lead inbox + Stripe paywall.** End of week 10.

## Risks

- **AI inference cost** — must be bounded per guided experience; the token-cost cap is the safety net.
- **Per-vertical templates** — generic tree builders are commodity; the templates are the moat.
