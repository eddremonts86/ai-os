---
id: "2910"
slug: i-gave-my-job-search-data-an-mcp-interface
title: Ackd — AI Job Search Workspace with MCP integration
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49334815"
  captured: "2026-08-17"
category: productivity
date: "2026-08-17"
tags: [Show HN, Product, Problem, Productivity, AI]
country: USA
tech: [SvelteKit, Postgres, MCP, OpenAI, Anthropic Claude]
---
# Ackd — AI Job Search Workspace with MCP integration

## Problem

Job applicants applying at volume (the founder targets tech applicants specifically) lose track of which resume version went to which role, when a follow-up is due, and which sources are actually generating callbacks. Spreadsheets and Notion require manual scaffolding; they do not understand the shape of a job application. Generic job-board tools track clicks, not applicant context, and AI assistants have no persistent memory of the applicant's actual pipeline when they are asked for follow-up advice or resume feedback.

The founder's product positions itself around that gap: a structured tracker that builds an application record from a pasted link, attaches every resume version, follow-up, interview, and outcome to that record, and exposes the same data through an MCP server so AI tools (Claude, Cursor, others) can read and write the user's real pipeline instead of offering generic job-search advice.

## Objective

Ship a beta-grade workspace where a tech applicant can paste any job link, get a structured application record in seconds, track follow-ups and outcomes against source/resume, and connect an MCP-compatible AI tool that reads from and writes to the same data the user sees in the app.

## Target Users

- Primary: tech applicants applying to 5+ roles per week who already use AI tools (Claude, Cursor, ChatGPT) for resume drafting or interview prep and want those tools grounded in their real pipeline instead of generic advice.
- Secondary: career coaches and outplacement firms who want a shared, structured pipeline view per candidate without rebuilding a Notion schema for each client.

## MVP Scope

- Paste-a-link ingestion: a public job-posting URL (Greenhouse, Lever, Workday, Ashby, most career pages) creates an editable record with role, company, location, and description; LinkedIn Easy Apply and Indeed are added manually until supported.
- Application record fields: status, source, resume version, cover letter, follow-ups, interviews, contacts, notes, and outcome analytics broken down by source and resume.
- Follow-up reminders driven by the application's stage history and last-action date.
- Response analytics: reply rate, callback rate, and time-to-reply segmented by source (referral, LinkedIn, cold board) and resume version.
- AI features (in beta): company briefings, follow-up drafts, interview prep, resume feedback. AI uses the saved context; the tracker works without AI.
- MCP server: lets any MCP client (Claude, Cursor) read and write the applicant's tracker — AI tools work from the user's real applications.
- Auth: sign-in to a per-user workspace; no team sharing in v1.
- Free during beta with no credit card required (per the product page).

## Design Direction

Design direction for the MVP at `https://ackd.app` follows the constraints in `2910-.../SPEC.md` and the chosen stack (SvelteKit, Postgres). The product page already uses a paper-textured dark-mode hero with a Hermes agent chat mock as the visual centerpiece. Brand reads as "structured-notebook" rather than "job board": warm off-black surfaces, a single accent for primary actions, and density tuned for power-users who are tracking dozens of applications at once.

**Color** — primary on near-black surface (#010607 dark), warm off-white text, single accent for action surfaces. Light mode uses #f9f7f2 paper background.

**Type** — Figtree for body, Archivo for display headings, JetBrains Mono for tabular data (counts, fit scores, pay bands).

**Density** — tight for tables and analytics; generous for the briefing and detail views where copy is meant to be read.

## Constraints

- Privacy by default: applicant data is not shared or used to train models; users can export or delete from Settings at any time.
- MCP surface must work with stock MCP clients (Claude, Cursor, OpenCode) without custom wrappers.
- AI features are off by default and never run unless the user opts in; the core tracker must be fully usable without any AI call.
- Job-board integrations are scoped to the boards the founder explicitly names (Greenhouse, Lever, Workday, Ashby); adding more is a deliberate decision, not a scrape-on-demand.
- Pricing during beta is free; the post does not state what comes after beta, so WTP for the eventual paid tier is not asserted.
