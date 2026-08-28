---
id: "849"
slug: problem-of-marketing-automation-for-saas-products
title: Problem of marketing automation for SaaS products
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: marketing
date: "2025-11-14"
tags: [Marketing, Other]
country: USA
tech: [Node.js API (Fastify), TypeScript, Postgres, BullMQ, Coolify, Docker]
---
# Problem of marketing automation for SaaS products

## Tech Stack

Node.js API (Fastify), TypeScript, Postgres, BullMQ, Coolify, Docker.

## Architecture

YAML-defined journeys are loaded at startup and stored in Postgres. A worker consumes per-user scheduled events and dispatches via the configured channels (SMTP/SES, in-app websocket, webhook). Admin UI is a small Vue SPA.

## Milestones

- M1: YAML journey schema and a runner for email
- M2: in-app message channel and per-user state
- M3: webhook channel and a small admin UI for inspecting state

## Risks

Single-tenant, single-host deploy. Postgres for journey state. Webhook fan-out for social.

- Deliverability of self-sent email is a real risk; document SPF/DKIM setup.
- The line between 'automation' and 'spam' is a product judgment; do not ship a tool that helps the latter.
