---
id: "503"
slug: difftrail-reconstruct-git-history-even-if-you-never-com
title: "DiffTrail: Reconstruct Git history even if you never committed it"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SideProject/comments/1vnypso/difftrail_reconstruct_git_history_even_if_you/"
category: sideproject
date: "2026-08-14"
tech: [TypeScript, Node.js (Fastify), Git, PostgreSQL, Resend, Vercel]
---
# DiffTrail: Reconstruct Git history even if you never committed it

## Tech Stack

Chosen for this problem:

- TypeScript
- Node.js (Fastify)
- Git
- PostgreSQL
- Resend
- Vercel

## Architecture

TypeScript orchestrator; Node.js (Fastify) control API; PostgreSQL for reconstructed history; Resend for digest; Vercel.

## Milestones

- Editor autosave reader (VS Code)
- Workspace state reader
- Diff trail reconstruction
- Optional commit-on-detection

## Risks

- Editor compatibility
- Workspace privacy
