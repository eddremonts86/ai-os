---
id: "3756"
slug: datazen-a-local-first-client-for-cross-database-workflo
title: DataZen – a local-first client for cross-database workflows
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49490148"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [TypeScript, Node.js API, SQLite (local metadata) + connection drivers for Postgres / MySQL / SQLite, Coolify + Docker (self-hosted distribution)]
---
# DataZen – a local-first client for cross-database workflows

> Brief derived from the source post. No facts added beyond what the post asserts.

## Value Proposition

Replace the copy-paste loop between database tools. Local-first, single-developer workflow runner that takes a sequence of SQL statements and the parameters between them, so an investigation is one click instead of seven.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Backend engineer | Investigations are a sequence of dependent queries; the client should hold the sequence, not the engineer's clipboard. |
| Compliance-restricted company | Navicat is blocked; DBeaver is allowed but disliked; an alternative built for the compliance posture fits the audit. |
| SRE on call | A workflow is a saved investigation that can be re-run when the next incident hits the same shape. |

## Jobs To Be Done

1. **Functional job** — run a sequence of dependent SQL queries across multiple databases without writing a script.
2. **Emotional job** — feel in control during a production investigation instead of juggling tabs.
3. **Social job** — share a saved workflow with the team so the next person does not redo the same investigation.

## Success Metrics

- **Activation:** % of signups who save at least one workflow within 14 days.
- **Retention:** weekly active engineers; median workflows per engineer.
- **Revenue:** indie-license + team-license pricing; pricing unstated in the post.

## Competitive Landscape

- Navicat: commercial; the compliance posture is the wedge that drove the poster away from it.
- DBeaver: open-source; works but is not opinionated about cross-database workflows.
- Superset: BI tool; too heavy for a developer's investigation flow.
- Custom Python scripts: what engineers do today; the MVP replaces this with a saveable workflow.

## Risks & Open Questions

- Compliance posture varies by company; the MVP must make the local-first claim true and verifiable.
- Connection-pool isolation across databases needs careful concurrency design.
- The parameter-binding DSL is small but easy to over-design; keep it to column-name binding.
