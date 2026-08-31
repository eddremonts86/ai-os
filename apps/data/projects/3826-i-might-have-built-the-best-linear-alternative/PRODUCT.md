---
id: "3826"
slug: i-might-have-built-the-best-linear-alternative
title: I might have built the best Linear alternative
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49494058"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Self-hosted tracker server, SQL database, agent-facing board API, model key passthrough, AGPL-3.0 open-source license, board workspace UI]
---
# I might have built the best Linear alternative

## Value Proposition

The open-source tracker where humans and AI agents share one board. It's a Plan's pitch is ownership: your server, your database, your model keys — no seats, no lock-in, AGPL-3.0. The poster's own framing is that this might be the best Linear alternative; what is stated rather than claimed is the shape of the product: a self-hosted board that both humans and agents work, running on the user's infrastructure with the user's credentials.

**One-liner:** A self-hosted, AGPL-3.0 tracker where humans and AI agents share one board — your server, your database, your model keys, no seats.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Teams comparing to Linear | Self-hosted control and no seat-based pricing. |
| AI-agent teams | A board their agents can read and write natively. |
| Privacy-minded operators | Data and model keys stay on infrastructure they own. |

The post targets teams that run AI agents and care about ownership; it names no commercial segment beyond that.

## Jobs To Be Done

1. **Functional job** — Track work on a board shared by humans and agents without per-seat billing.
2. **Functional job** — Self-host the tracker on the team's own server and database.
3. **Functional job** — Let agents work the board with the team's own model keys.
4. **Emotional job** — Escape lock-in: AGPL source the team can keep running regardless of any vendor.

## Success Metrics

- **Shared-board parity:** humans and agents can both create, assign and complete work on the same board.
- **Self-hosting:** a single-server install runs on the user's own database.
- **Zero seats:** no seat counter gates usage — the metric is that the feature does not exist.
- **Adoption:** open-source traction (stars, self-hosters) — the post names no targets, so this is directional.

## Pricing & Monetization

The capture states the model by negation: no seats, no lock-in, open source under AGPL-3.0. No paid tier or price is named.

## Competitive Landscape

The post names Linear by way of the title's claim — the poster says he might have built the best alternative to it. Beyond that, no competitor is named; the product sits in the project-management and issue-tracking category, where the claimed differentiators are agent-human board sharing, self-hosting and the AGPL-3.0 license.

## Risks & Open Questions

- [ ] "Best Linear alternative" is an unverified self-claim; the capture gives no comparison evidence.
- [ ] AGPL-3.0 deters some enterprises from adoption, which may conflict with the Linear-alternative ambition.
- [ ] Agent access depends on the user's model keys; cost and model choice become the user's problem.
- [ ] Self-hosting means the maker cannot observe usage, iterate on data or offer SaaS-style support.
- [ ] The capture names no features beyond the shared board; parity with Linear is a long road.
