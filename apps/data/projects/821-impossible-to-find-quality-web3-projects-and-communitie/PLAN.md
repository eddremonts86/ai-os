---
id: "821"
slug: impossible-to-find-quality-web3-projects-and-communitie
title: Impossible to find quality Web3 projects and communities due to information noise and fraud
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/finance/1yr4ejpc51-impossible-to-find-quality-web3-projects"
category: finance
date: "2025-12-01"
tags: [Finance, Other]
country: Netherlands
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Impossible to find quality Web3 projects and communities due to information noise and fraud

## Tech Stack

React with TypeScript for the directory, TanStack Start as the Node.js API, SQLite with Drizzle ORM for projects, scores and on-chain snapshots, deployed via Coolify and Docker. Chosen because the MVP is a curated directory whose data model is small and whose integrity matters more than scale.

## Architecture

A web app with three surfaces: a project directory with the rubric visible per entry, a contributor flow that proposes new entries with evidence, and a moderation queue where each entry's score and signals are reviewed before publishing.

## Milestones

- M1 — Rubric design (developer activity, audit status, on-chain footprint, community health) and an editor for adding entries.
- M2 — Public directory with the rubric visible per entry.
- M3 — Contributor flow with evidence requirements and a moderation queue.

## Risks

- Source is thin: scope is derived from the title alone until the original post is read.
- Scoring is reputationally risky; published scores invite pressure from listed projects.
- Any financial-promotion language must respect MiCA and the EU's general rules.
