---
id: "816"
slug: saas-founders-lack-a-platform-for-finding-partners-and-
title: SaaS founders lack a platform for finding partners and organizing joint advertising campaigns with bloggers to reduce costs by 5 times while maintaining the same reach
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/jeh9mn47u1-saas-founders-lack-a-platform-for-findin"
category: marketing
date: "2025-12-07"
tags: [Marketing, Other]
country: USA
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# SaaS founders lack a platform for finding partners and organizing joint advertising campaigns with bloggers to reduce costs by 5 times while maintaining the same reach

## Tech Stack

React with TypeScript for the founder-facing app, TanStack Start as the Node.js API, SQLite with Drizzle ORM for partners, campaigns and spend records, deployed via Coolify and Docker. Chosen because the MVP is a directory + planner that can run cheaply while the supply side grows.

## Architecture

A web app with three surfaces: a partner directory with audience-overlap tags, a campaign planner that splits spend across co-marketers, and a reporting view that shows reach and cost per partner.

## Milestones

- M1 — Partner directory with manual onboarding and audience tags.
- M2 — Joint campaign planner that records the split of spend and the shared placements.
- M3 — Reporting view that attributes reach honestly across the co-marketers.

## Risks

- Source is thin: the cost-reduction claim in the title is uncaptured and unverified.
- Cold-start: matching only works once both sides have profiles and history.
- Any reporting that overstates reach will poison trust between co-marketing partners.
