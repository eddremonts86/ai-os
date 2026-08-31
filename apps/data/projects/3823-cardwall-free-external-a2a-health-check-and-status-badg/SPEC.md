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

## Problem

The capture is two sentences: "A wall of A2A agent cards. Each card stays on its own owner's machine." Combined with the title — free external A2A health check and status badge for agents — the announcement is a wall where each agent speaking the A2A (agent-to-agent) protocol gets a card, the service performs a health check from outside and offers a status badge, free of charge, while the card's data stays on the owner's machine rather than on a central server. Nothing beyond that is stated in the post.

## Objective

Give A2A agents a public presence: a card on a shared wall, a free health check performed from outside the owner's network, and an embeddable status badge — without taking custody of agent data, which by the capture's design stays on the owner's machine.

## Target Users

- Developers exposing agents over the A2A protocol who want to show they are alive and reachable.
- Teams publishing several agents and wanting a glanceable wall of their fleet's status.
- Consumers of A2A agents who want to see which agents are up before connecting.

## MVP Scope

- A wall page listing A2A agent cards with name, description and endpoint.
- External health checks that probe each agent's endpoint on a schedule.
- A status badge (up/down) that owners can embed elsewhere.
- Card data sourced from the owner's machine, not stored centrally.

## Constraints

- The capture is two sentences plus a title; everything beyond it — schedule, protocol details, UI — is inference.
- Privacy is the stated design point: cards stay on the owner's machine, so the service must work without central data collection.
- Free is in the title: the health check and badge are offered at no cost.
- Health checks must be lightweight, read-only probes, or the free service becomes an abuse vector.

## Design Direction

See `DESIGN.md` for this project's design tokens.
