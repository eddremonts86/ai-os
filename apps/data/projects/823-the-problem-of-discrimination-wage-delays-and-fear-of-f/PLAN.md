---
id: "823"
slug: the-problem-of-discrimination-wage-delays-and-fear-of-f
title: "The problem of discrimination, wage delays, and fear of firing/deportation among immigrant construction workers in the USA"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ydplsur631-the-problem-of-discrimination-wage-delay"
category: other
date: "2025-12-01"
tags: [Immigration, Career, Legal, Other]
country: USA
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# The problem of discrimination, wage delays, and fear of firing/deportation among immigrant construction workers in the USA

## Tech Stack

React with TypeScript for the mobile-first logbook, TanStack Start as the Node.js API, SQLite with Drizzle ORM for the user's local-only log, deployed via Coolify and Docker. Chosen because the user works on a phone on a job site and the data model is personal.

## Architecture

A web app with three surfaces: a logbook where the worker records hours, wages owed and incidents on their own device first, a vetted legal-aid directory filtered by language and case type, and a one-tap export that produces a PDF a lawyer can read.

## Milestones

- M1 — Local logbook for hours worked and wages owed, with offline-first storage on the device.
- M2 — Vetted legal-aid directory filtered by language and immigration-sensitive cases.
- M3 — PDF export that produces a clean, dated record a lawyer or agency can read.

## Risks

- Source is thin: scope is derived from the title alone until the original post is read.
- Privacy is existential: a leaked record can put the user in physical danger.
- Vetted legal-aid supply is uneven across US states; the directory must be honest about coverage.
