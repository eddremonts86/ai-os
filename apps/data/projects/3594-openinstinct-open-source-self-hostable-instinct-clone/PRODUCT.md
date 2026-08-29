---
id: "3594"
slug: openinstinct-open-source-self-hostable-instinct-clone
title: "OpenInstinct – open-source, self-hostable Instinct clone"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49479314"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Eve (agent framework), Linq (iMessage), Kernel (browser use / credential injection), Postgres, Vercel AI Gateway, Google Workspace connector]
---
# OpenInstinct – open-source, self-hostable Instinct clone

## Value Proposition

OpenInstinct is an open-source, self-hostable clone of Instinct built around a personal vault that holds cards, logins, and personal information, and an agent runtime that uses that vault to execute complex tasks on the user's behalf. The headline jobs are the three the post names verbatim: buy theatre tickets for the nearest showing of "the odyssey" on Saturday, find and order the best golf grip trainer, and read the user's email to surface subscriptions that are not being used and could be cancelled.

The product exists because the authors like Instinct but are worried about the data footprint they are handing to the vendor. Self-hosting the system means vault contents, conversation history, and task memory live on infrastructure the operator controls rather than on the vendor's.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Privacy-conscious Instinct fans | Want the task-on-my-behalf UX without sending personal data to a third-party vendor. |
| Power users with many subscriptions and accounts | Have enough cards, logins, and recurring charges that an autonomous agent is useful, not theoretical. |
| Self-host operators | Need a single-host install they can audit; the post explicitly invites this posture. |
| Open-source contributors | Invited by the post to participate; the project is beta and community work is welcome. |

## Jobs To Be Done

1. **Functional job** — Run the three concrete tasks the post names (theatre tickets, golf grip trainer, subscription cleanup) and any task of similar shape, using credentials and personal context stored in the vault.
2. **Emotional job** — Reclaim the feeling of control over personal data that Instinct's hosted model puts in the vendor's hands.
3. **Social job** — Demonstrate that a self-hostable agent stack (Eve + Linq + Kernel + Postgres + Vercel AI Gateway) can match the UX of a hosted product without the data trade-off.

## Success Metrics

- Reproducibility of the three post example tasks on a clean self-host install — theatre tickets, golf grip trainer, subscription cleanup — within the agent's normal runtime.
- Number of contributors and external pull requests after the beta is announced (the post explicitly invites community contributions).
- Self-host install completions, measured by the project's published install path.
- Coverage of connectors beyond Google Workspace that the community ships.

## Pricing & Monetization

The post says nothing about pricing, hosted tiers, or any paid offering. The release is open source, self-hosted, and in beta. Absent beats invented.

## Competitive Landscape

- **Instinct** — the product being cloned. The post positions OpenInstinct as the self-hostable answer for users who like Instinct's behavior but are worried about its data footprint.
- **Self-hostable agent stacks (n8n, LangGraph self-hosted, Open Interpreter with local tools)** — overlap on the agent-on-your-own-hardware pattern; the post does not compare OpenInstinct to them directly.
- **iMessage automation tools (Linq itself, plus BlueBubbles, Matrix bridges)** — overlap on the Linq-driven iMessage surface; OpenInstinct uses Linq as one channel into the agent, not as a standalone product.

## Risks & Open Questions

- The project is beta software; the post says "I wouldn't use it in production," which limits who will trust it with real money or real subscriptions until it stabilizes.
- Browser-use via Kernel with credential injection is a high-stakes surface: a leaked vault entry is worse than a leaked password manager entry because it can be used in-context by an autonomous agent.
- Lock-in to the author's chosen stack (Eve / Linq / Kernel / Postgres / Vercel AI Gateway) means contributors who want to swap a piece take on the integration cost.
- The Vercel AI Gateway is a managed dependency in a self-host story; the project's stance on falling back to a local model gateway is not stated in the post.
- iMessage via Linq ties the product to a single messaging platform and to a third-party service for that channel.

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49479314) · **Category:** show-hn · **Tags:** Show HN, Product, Problem
