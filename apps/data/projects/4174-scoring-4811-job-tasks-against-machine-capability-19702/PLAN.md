---
id: "4174"
slug: scoring-4811-job-tasks-against-machine-capability-19702
title: "Scoring 4,811 job tasks against machine capability, 1970–2041"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49510775"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# Scoring 4,811 job tasks against machine capability, 1970–2041

## Tech Stack

The site uses React + TypeScript on TanStack Start with SQLite/Drizzle for the job catalogue and per-task scores. The dataset is the source-of-truth; the UI is a thin presentation layer over it. Coolify hosts the site behind Docker.

## Architecture

A TanStack Start app serves the Mirror experience; the job catalogue and per-task capability scores live in a Drizzle-managed SQLite store. The methodology page is a static page linked from every mirror. The share link is a per-job route that re-hydrates the same data. Coolify hosts the site behind Docker.

## Milestones

- M1 — Job catalogue with the 4,811 tasks.
- M2 — Mirror experience that picks a job and shows its per-task breakdown.
- M3 — Timeline view with 1970–2041 scoring.
- M4 — Methodology page and share links.
- M5 — Public release.

## Risks

- Capability scores are model outputs, not measurements; the methodology page has to be honest about that or the numbers mislead.
- 4,811 tasks is a lot to keep current; the corpus has to be updated as the underlying models move.
