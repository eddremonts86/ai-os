---
id: "814"
slug: first-physical-product-problem-on-problemhunt-in-norway
title: "First physical product problem on ProblemHunt: In Norway, you can't enter a building wearing shoes with spikes or roll in a bicycle with winter tires — no convenient protective pads exist"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/hardware/0xut3v4y21-first-physical-product-problem-on-proble"
category: hardware
date: "2025-12-10"
tags: [Hardware, Other]
country: Norway
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# First physical product problem on ProblemHunt: In Norway, you can't enter a building wearing shoes with spikes or roll in a bicycle with winter tires — no convenient protective pads exist

## Tech Stack

This is a physical-product problem. The MVP is a manufactured pad plus a small React and TypeScript web app for sizing help, ordering and replacement reminders. The app uses TanStack Start as the Node.js API, SQLite with Drizzle ORM for orders, and is deployed via Coolify and Docker.

## Architecture

A small e-commerce surface: a product page with sizing guidance for spiked shoes and studded tires, a checkout, and a reminders system for replacement. Manufacturing and supply are out of scope for this document.

## Milestones

- M1 — Validate the form-factor with three users: cyclist, ice-fisher, postal worker.
- M2 — First prototype batch of pads in two materials.
- M3 — Web shop with sizing guide and replacement reminders.

## Risks

- Source is thin: scope is derived from the title alone until the original post is read.
- Manufacturing margin in Norway may be thin if volumes stay low.
- Hardware MVPs need a different validation path than software ones; the web piece is a fraction of the work.
