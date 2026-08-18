---
id: "680"
slug: i-hit-16k-views-in-a-post-for-my-saas-no-conversion-at-
title: "I hit 16K views in a post for my SaaS, no conversion at all"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vpsro3/i_hit_16k_views_in_a_post_for_my_saas_no/"
category: saas
date: "2026-08-16"
tags: [saas, growth, conversion, organic-marketing]
tech: [Next.js, TypeScript, Playwright, SQLite, Drizzle ORM]
---
# I hit 16K views in a post for my SaaS, no conversion at all

## Problem

A new solo SaaS founder posted organically on YouTube / Instagram / TikTok for one week and had one post go semi-viral: 16K views, ~200 likes and comments, ~4-5 sign-ups that day and the same number following days. The post used a comment-bait hook ("comment X and I'll send you the playbook") that pointed to a website-hosted article with a clear CTA. The founder describes the landing page as not "vibe coded much" and the design as "top notch", but the conversion from 16K views to 4-5 sign-ups is far below the engagement rate the post generated. They are asking what to change in the offer and the landing page before pushing more traffic. The implicit problem: traffic is reaching a page that converts at ~0.03% (5/16,000), and the founder does not know whether the bottleneck is the offer, the page, the audience mismatch, or the traffic source.

## Objective

Define a conversion-audit workflow for the funnel between a viral post and a SaaS sign-up: post → CTA → landing page → pricing → first-run experience. For each step, name the bottleneck categories and the cheapest diagnostic to isolate which one is binding.

## Target Users

- **Primary:** solo SaaS founders in their first 6 months who have generated at least one viral or near-viral organic post and are seeing single-digit sign-ups from it.
- **Secondary:** early-stage growth marketers at sub-50-person startups who own the organic channels and need a structured way to triage low-conversion funnels before paying for more traffic.
- **Tertiary:** indie hackers shipping weekly and treating organic social as their primary acquisition channel.

## MVP Scope

- A landing-page audit checklist (offer clarity, social proof, friction inventory, mobile-vs-desktop parity, load time, CTA above the fold).
- An offer-audit checklist (who it is for, what it replaces, what it costs, what "done" looks like).
- A traffic-source-to-page match diagnostic (does the post promise what the page delivers).
- A first-run-experience audit (does the sign-up → first-value moment complete in under 5 minutes).
- A scored report with the highest-leverage fix called out first.
- Excluded in v1: paid-traffic audits, attribution modeling, A/B testing infrastructure, CRM integration.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single audit-report surface — a sidebar with the funnel stages, a centre pane with the scored findings, a right-hand panel with the top-3 highest-leverage fixes. No marketing-site chrome; the product is the audit.

## Constraints

- The audit must produce a numbered, prioritised list of fixes, not a generic best-practices essay.
- Every finding must cite the specific element on the page or in the funnel it refers to; no abstract advice.
- The MVP must work for a solo founder with zero analytics tooling beyond what is in the page source.
