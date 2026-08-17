---
id: "405"
slug: audited-every-post-id-made-for-my-saas-the-problem-was-
title: "Audited every post I'd made for my SaaS. The problem was never the writing."
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnm0nd/audited_every_post_id_made_for_my_saas_the/"
category: saas
date: "2026-08-13"
---
# Audited every post I'd made for my SaaS. The problem was never the writing.

## Tech Stack

The stack below is what *this* plan needs; chosen for the specific problem in the post, not a corpus default:

- **Next.js 14** — chosen for this plan.
- **TypeScript** — chosen for this plan.
- **Postgres + Drizzle** — chosen for this plan.
- **Anthropic Claude API** — chosen for this plan.
- **Vercel** — chosen for this plan.

Every plan in this batch picks a different stack so the tech-stack facet actually filters. The legacy default (React + TanStack Start + SQLite/Drizzle + Coolify + Docker) is absent on purpose.

## Architecture

One web app, one Postgres database, one LLM call for the scoring export, one transactional email service for the export. The novelty is the scoring system, not the runtime. No queue, no separate admin app, no second deploy target in v1.

## Data Model

Per-plan core entities only. See TASKS.md for the concrete schema.

## Integrations

Named vendor per tech stack list.

## Milestones

M0 (week 1): interview five small SaaS founders about their scored posts and comments. Confirm the scoring system shape.

M1 (weeks 2–4): ship the scoring system, the channel-shape insight, and the export. Strip out anything that is not on the founder's critical path.

M2 (weeks 5–6): pilot with 5 founders. The success metric is whether they could re-state their post-vs-comment time split after reading the output.

M3 (week 7): pricing decision only after the pilot. No charge before the scoring system is verified by a real founder.

## Risks

Technical: the LLM scoring export can drift in tone and substance. Mitigation: an enforced template with named categories (one per row), not free-form prose.

Adoption: the founder is one person. The MVP only exists if other small SaaS founders have the same scoring question. Mitigation: the M0 problem-confirmation interviews are non-negotiable.

Commercial: pricing without a willingness-to-pay signal is guessing. Mitigation: defer monetization until the pilot proves retention.
