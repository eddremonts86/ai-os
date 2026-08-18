---
id: "676"
slug: launched-my-saas-keepme
title: Launched my SaaS - KEEPME
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vptxt6/launched_my_saas_keepme/"
category: saas
date: "2026-08-16"
tags: [saas, consumer, ai, content-saver]
tech: [Next.js, TypeScript, SwiftUI, Supabase, Anthropic Claude, AWS, Stripe]
---
# Launched my SaaS - KEEPME

> Product brief for the personal content-saver app described in the source post.

## Value Proposition

A knowledge worker can save links and videos "to themselves" and retrieve them later without maintaining a tagging system; the AI generates the tags and the search uses them.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Knowledge workers | Save links and videos throughout the week; cannot find them later. |
| Students and researchers | Build a personal library of source material across courses. |
| Creators | Want a private swipe file of references. |

## Jobs To Be Done

1. **Functional job** — Save a link or video and find it later.
2. **Emotional job** — Stop feeling guilty about a bloated browser bookmarks folder.
3. **Social job** — None in v1.

## Success Metrics

- **Activation:** first save within 7 days of install.
- **Retention:** at least 3 saves/week per active user after month 1.
- **Conversion:** ≥ 5% free-to-paid conversion within 90 days.

## Pricing & Monetization

Free tier: 100 credits on signup. Paid at $7.99/month or $59/year: 1,000 credits/month. Credit packs available one-off.

## Competitive Landscape

- **Pocket / Instapaper** — read-later, weaker on retrieval search.
- **Raindrop.io** — bookmarks with tagging, no AI.
- **Notion databases** — flexible, but require manual tagging.

## Risks & Open Questions

- [ ] The AWS-credit window is the make-or-break constraint; a paid plan must convert before the window closes.
- [ ] The AI layer's per-user cost must be bounded; calling inference on every save is not viable.
