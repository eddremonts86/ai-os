---
id: "4191"
slug: doglm-can-you-pet-the-dog-in-an-ai-generated-gam
title: "DogLM – Can you pet the dog in an AI-generated game?"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509649"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# DogLM – Can you pet the dog in an AI-generated game?

## Tech Stack

The benchmark runner is a Python pipeline; the surrounding docs site uses React + TypeScript on TanStack Start with SQLite/Drizzle for the leaderboard and the prompt set catalogue. Coolify hosts the docs behind Docker.

## Architecture

A Python benchmark runner takes a model and a prompt set, asks the model to build each game, runs the automated grader over the generated code, and posts the result. The leaderboard is a TanStack Start app backed by Drizzle-managed SQLite. Coolify hosts the docs site behind Docker.

## Milestones

- M1 — Prompt set and automated grader.
- M2 — Per-model scoring pipeline.
- M3 — Public leaderboard.
- M4 — Methodology page.
- M5 — Public release.

## Risks

- The grader is the bottleneck; a noisy grader invalidates the leaderboard and breaks the benchmark.
- Models change; the prompt set has to be stable across versions so scores are comparable.
