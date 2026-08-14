---
id: "421"
slug: how-are-you-evaluating-agents-that-write-sql-against-li
title: "How are you evaluating agents that write SQL against live databases?[I will not promote]"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vmu0dh/how_are_you_evaluating_agents_that_write_sql/"
category: startups
date: "2026-08-12"
---
# How are you evaluating agents that write SQL against live databases?[I will not promote]

## Problem

The poster has been digging into agent evaluation for setups where the agent writes and runs SQL against a live database (Snowflake, BigQuery, etc.) and shows results to users. The failure mode that seems underserved: the query executes fine and returns real rows just the wrong ones. Wrong join, wrong filter, stale understanding of the schema. Nothing errors, the output looks plausible, but it's wrong. Static eval sets with prewritten 'golden' answers don't hold up here, because the correct answer changes as the data changes. Interestingly, LangSmith has a cookbook recipe for exactly this, storing labels... The post is asking how others are evaluating these agents. No country, no specific stack, no version was stated.

## Objective

Give a developer or AI engineer who is evaluating a SQL agent against a live database a named-evaluation framework — the named eval dataset shape, the named eval metric, the named eval cadence, the named fallback when the data changes. The job is not to build the eval pipeline — it is to give the developer a named framework so the eval pipeline is right in a week, not a quarter.

## Target Users

Primary: a developer or AI engineer who is evaluating a SQL agent against a live database (Snowflake, BigQuery, Postgres, etc.) and wants the named-evaluation framework. Secondary: a head of engineering or staff ML engineer at the same kind of company who is being asked to set the eval bar and wants the named thresholds in front of them.

## MVP Scope

In scope for v1:

- A 'live-database SQL-agent eval' framework: the named eval dataset shape (live rows, labelled correctness, judge agent, golden-set fallback), the named eval metric (named precision, named recall, named false-positive rate), the named eval cadence.
- A 'when the data changes' fallback: the named process for re-evaluating as the database evolves, the named staleness threshold.
- A 'before you ship the next agent' checklist: the named preconditions (eval coverage, named judge agreement, named fallback path).
- A one-page export the developer can drop into a Notion doc or a team thread.

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/startups/comments/1vmu0dh/how_are_you_evaluating_agents` follows the constraints in `421-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- The source is a question, not a feature request — the deliverable is a framework, not a product.
- No country, no specific stack, no version was stated; the MVP must work for any developer evaluating a SQL agent against a live database.
- The output must not invent a metric — name the named categories (precision, recall, false-positive rate) and let the developer fill in the threshold.
