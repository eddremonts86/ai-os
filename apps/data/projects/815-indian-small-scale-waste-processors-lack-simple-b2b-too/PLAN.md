---
id: "815"
slug: indian-small-scale-waste-processors-lack-simple-b2b-too
title: Indian small-scale waste processors lack simple B2B tools for finding suppliers and controlling copper quality
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/business/2ge6lbk8e1-indian-small-scale-waste-processors-lack"
category: business
date: "2025-12-07"
tags: [Business, Other]
country: India
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Indian small-scale waste processors lack simple B2B tools for finding suppliers and controlling copper quality

## Tech Stack

React with TypeScript for a mobile-first web app, TanStack Start as the Node.js API, SQLite with Drizzle ORM for the supplier and lot records, deployed via Coolify and Docker. Chosen because the user works on a phone in a yard and the data model is small.

## Architecture

A web app with three surfaces: a supplier directory with search by city and material, a lot-intake form that records grade photos and basic tests, and a buyer's view that shows the lot history of each supplier.

## Milestones

- M1 — Supplier directory with manual entry and search by city.
- M2 — Lot intake form with photo capture and a basic copper-grade rubric.
- M3 — Per-supplier history view that shows the grade pattern across deliveries.

## Risks

- Source is thin: scope is derived from the title alone until the original post is read.
- Mobile-first design must be tested on low-end Android devices and intermittent 4G.
- Any "grade" output needs a defensible rubric or it loses credibility with buyers.
