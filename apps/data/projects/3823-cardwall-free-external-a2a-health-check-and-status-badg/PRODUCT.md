---
id: "3823"
slug: cardwall-free-external-a2a-health-check-and-status-badg
title: Cardwall – free external A2A health check and status badge for agents
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49494495"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [A2A protocol health checks, periodic ping worker, SVG status badges, self-hosted card metadata, agent card wall UI, lightweight read-only probes]
---
# Cardwall – free external A2A health check and status badge for agents

## Value Proposition

A wall of A2A agent cards where each card stays on its owner's machine. Cardwall's pitch is narrow and specific: every agent speaking the A2A protocol can show a card on a shared wall, receive an external health check for free, and embed a status badge that proves the agent is reachable — while the card data itself never moves to a central server. The privacy design is the differentiator: the wall displays agents without owning them.

**One-liner:** Free external A2A health checks and status badges for agents, on a wall whose cards stay on the owners' machines.

## Target Users

| Stakeholder | Why they care |
|---|---|
| A2A agent builders | A public card plus a free external check that their agent is actually reachable. |
| Agent fleets and teams | A wall where the status of every owned agent is visible at a glance. |
| Agent consumers | A way to see which agents are up before connecting. |

The post describes no commercial audience; the wall is tooling for the A2A ecosystem.

## Jobs To Be Done

1. **Functional job** — Publish a card for an A2A agent without handing its data to a central service.
2. **Functional job** — Get an external health check that confirms reachability from outside the owner's network.
3. **Functional job** — Embed a status badge that stays current as checks run.
4. **Emotional job** — Show the agent exists and works without surrendering ownership of its data.

## Success Metrics

- **Checks running:** an external probe fires on schedule against each listed agent.
- **Badge accuracy:** badge state matches the last probe result, with a defined freshness bound.
- **Adoption:** number of agents on the wall — the post names no target, so the metric is directional.
- **Zero central data:** the wall renders card data without storing it server-side (the stated design).

## Pricing & Monetization

The title says free, and the capture states no pricing beyond that. There is no monetization model stated anywhere in the post.

## Competitive Landscape

The post does not name competitors. The product sits in the young category of A2A protocol tooling — agent registries, directories and monitoring tools for agent-to-agent ecosystems — where the differentiating claim is the combination of a free external health check, a badge, and card data staying on the owner's machine.

## Risks & Open Questions

- [ ] The capture is two sentences; how the service reaches an agent on a private machine is unstated and nontrivial.
- [ ] Free external checks can be abused to probe arbitrary endpoints; the service needs scope limits the post does not mention.
- [ ] A wall that is only as fresh as the last check can misreport dead agents as alive, and vice versa.
- [ ] A2A adoption is early; a directory tool is only as useful as the ecosystem that adopts it.
- [ ] No sustainability story: a free service with infrastructure costs has no stated path to staying online.
