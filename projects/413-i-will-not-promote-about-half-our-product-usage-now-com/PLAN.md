---
id: "413"
slug: i-will-not-promote-about-half-our-product-usage-now-com
title: "I will not promote: About half our product usage now comes through the API, and we almost missed what that meant"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vnm3el/i_will_not_promote_about_half_our_product_usage/"
category: startups
date: "2026-08-13"
---
# I will not promote: About half our product usage now comes through the API, and we almost missed what that meant

## Tech Stack

The stack below is what *this* plan needs; chosen for the specific problem in the post, not a corpus default:

- **Next.js 14** — chosen for this plan.
- **TypeScript** — chosen for this plan.
- **Postgres + Drizzle** — chosen for this plan.
- **Anthropic Claude API** — chosen for this plan.
- **MCP server** — chosen for this plan.
- **Vercel** — chosen for this plan.

Every plan in this batch picks a different stack so the tech-stack facet actually filters. The legacy default (React + TanStack Start + SQLite/Drizzle + Coolify + Docker) is absent on purpose.

## Architecture

One web app, one Postgres database, one LLM call for the implication-map draft, one MCP server for the audit query. The novelty is the framework, not the runtime. No queue, no separate admin app, no second deploy target in v1.

## Data Model

Per-plan core entities only. See TASKS.md for the concrete schema.

## Integrations

Named vendor per tech stack list.

## Milestones

M0 (week 1): interview five SaaS founders who have noticed the API-usage migration. Confirm the framework shape.

M1 (weeks 2–4): ship the framework, the audit, and the export. Strip out anything that is not on the founder's critical path.

M2 (weeks 5–6): pilot with 5 founders. The success metric is whether they could re-state their agent-first design decision after reading the output.

M3 (week 7): pricing decision only after the pilot. No charge before the framework is verified by a real founder.

## Risks

Technical: the LLM implication-map draft can drift in tone and substance. Mitigation: an enforced template with named sections per implication, not free-form prose.

Adoption: the founder is one person. The MVP only exists if other SaaS founders have the same API-usage-migration question. Mitigation: the M0 problem-confirmation interviews are non-negotiable.

Commercial: pricing without a willingness-to-pay signal is guessing. Mitigation: defer monetization until the pilot proves retention.
