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

## Problem

A US-based poster describes a marketing automation problem for SaaS products. The poster names no specific SaaS, channel, or tool. The pain is the repetitive, manual work of running lifecycle email, in-app prompts, and social posts across a small SaaS without paying for an enterprise platform.

---

## Objective

Give a small US SaaS team a marketing automation stack they can actually configure and maintain without a dedicated ops person.

## Target Users

Founders and small marketing teams at US-based SaaS companies (typically under 20 employees) who want lifecycle automation without an enterprise contract.

## MVP Scope

A configuration-as-code tool that defines lifecycle journeys in YAML (trigger, delay, channel, content) and runs them across email (SMTP or SES), in-app messages, and a webhook for posting to social. State per user is persisted so journeys resume across sessions.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

No invented pricing. All third-party APIs must have free or near-free tiers at small scale. The tool itself is open-source and self-hosted.
