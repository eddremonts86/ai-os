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

## Tech Stack

The stack below is what *this* plan needs; chosen for the specific problem in the post, not a corpus default:

- **Python** — chosen for this plan.
- **FastAPI** — chosen for this plan.
- **Postgres + Drizzle** — chosen for this plan.
- **LangSmith SDK** — chosen for this plan.
- **Anthropic Claude API (judge)** — chosen for this plan.
- **Fly.io** — chosen for this plan.

Every plan in this batch picks a different stack so the tech-stack facet actually filters. The legacy default (React + TanStack Start + SQLite/Drizzle + Coolify + Docker) is absent on purpose.

## Architecture

One Python service, one Postgres database, one eval SDK (LangSmith or equivalent), one judge agent for the named precision / recall / false-positive rate. The novelty is the eval framework, not the runtime. No queue, no separate admin app, no second deploy target in v1.

## Data Model

Per-plan core entities only. See TASKS.md for the concrete schema.

## Integrations

Named vendor per tech stack list.

## Milestones

M0 (week 1): interview five developers who have evaluated a SQL agent against a live database. Confirm the framework shape.

M1 (weeks 2–4): ship the framework, the 'when the data changes' fallback, and the checklist. Strip out anything that is not on the developer's critical path.

M2 (weeks 5–6): pilot with 5 developers. The success metric is whether they could catch the named failure mode (wrong rows, no error) before the user does.

M3 (week 7): pricing decision only after the pilot. No charge before the framework is verified by a real developer.

## Risks

Technical: the eval pipeline can drift when the live database schema changes. Mitigation: an enforced eval-dataset refresh on every schema change, not on a calendar.

Adoption: the developer is one person. The MVP only exists if other developers have the same SQL-agent-eval question. Mitigation: the M0 problem-confirmation interviews are non-negotiable.

Commercial: pricing without a willingness-to-pay signal is guessing. Mitigation: defer monetization until the pilot proves retention.
