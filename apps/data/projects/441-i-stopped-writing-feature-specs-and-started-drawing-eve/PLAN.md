---
id: "441"
slug: i-stopped-writing-feature-specs-and-started-drawing-eve
title: I stopped writing feature specs and started drawing every feature as a flowchart first. Way less wasted code.
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo051p/i_stopped_writing_feature_specs_and_started/"
category: saas
date: "2026-08-14"
tech: [Next.js, TypeScript, Mermaid.js, PostgreSQL, Resend, Vercel]
---
# I stopped writing feature specs and started drawing every feature as a flowchart first. Way less wasted code.

## Tech Stack

Chosen for this problem:

- Next.js
- TypeScript
- Mermaid.js
- PostgreSQL
- Resend
- Vercel

## Architecture

Next.js; Mermaid.js for diagrams; Postgres for spec + diagram + version snapshots; Resend for share notifications; Vercel.

## Milestones

- Editor with Mermaid canvas + Markdown side panel
- Versioned snapshots + diff
- Public share link (read-only)
- Stable node IDs for rename-safe linking

## Risks

- Editor performance with large diagrams
- Versioned snapshot storage growth
