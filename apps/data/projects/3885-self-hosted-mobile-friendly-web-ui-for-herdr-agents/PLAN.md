---
id: "3885"
slug: self-hosted-mobile-friendly-web-ui-for-herdr-agents
title: Self-hosted mobile-friendly web UI for Herdr agents
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49497870"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Self-hosted web server, Mobile-friendly UI, Real terminal streaming, Push notifications, File transfer, Agent monitoring API]
---
# Self-hosted mobile-friendly web UI for Herdr agents

## Tech Stack

- **Self-hosted web server:** the UI is deployed on the user's own infrastructure.
- **Mobile-friendly UI:** designed for phone screens first.
- **Real terminal streaming:** agent terminal sessions reach the browser.
- **Push notifications:** agent activity lands on the user's phone.
- **File transfer:** files move between the user and agents.
- **Agent monitoring API:** the interface consumes Herdr's agent state.

## Architecture

- **Web layer:** the self-hosted mobile-friendly UI served on the user's box.
- **Agent layer:** Herdr agents exposing state, terminals and file endpoints.
- **Realtime layer:** terminal streaming and notifications between browser and agents.
- **Transfer layer:** file uploads and downloads routed to the right agent.

## Milestones

1. **M0 — Monitoring.** The UI lists Herdr agents and their state from a phone.

2. **M1 — Notifications.** Agent activity pushes to the mobile interface.

3. **M2 — Terminals.** Real terminal sessions open in the browser.

4. **M3 — Files.** Users send files to agents; self-hosted deployment is documented.

## Risks

- **Mobile terminal UX:** full terminal use from a phone is the hardest interaction in the scope.
- **Security surface:** self-hosted terminal access needs auth and transport hardening out of the box.
- **Herdr coupling:** API changes in Herdr break the UI; the capture says nothing about versioning.
- **Thin evidence:** everything about fit and usability beyond the four named interactions is unknown.
