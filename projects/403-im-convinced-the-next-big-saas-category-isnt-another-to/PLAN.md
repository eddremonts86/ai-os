---
id: "403"
slug: im-convinced-the-next-big-saas-category-isnt-another-to
title: I’m convinced the next big SaaS category isn’t another tool
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnmk32/im_convinced_the_next_big_saas_category_isnt/"
category: saas
date: "2026-08-13"
---
# I’m convinced the next big SaaS category isn’t another tool

## Tech Stack

The stack below is what *this* plan needs; chosen for the specific problem in the post, not a corpus default:

- **Next.js 14** — chosen for this plan.
- **TypeScript** — chosen for this plan.
- **Postgres + Drizzle** — chosen for this plan.
- **Anthropic Claude API** — chosen for this plan.
- **Cloudflare Workers** — chosen for this plan.
- **Resend** — chosen for this plan.

Every plan in this batch picks a different stack so the tech-stack facet actually filters. The legacy default (React + TanStack Start + SQLite/Drizzle + Coolify + Docker) is absent on purpose.

## Architecture

One web app, one Postgres database, one LLM call for the prioritisation draft, one transactional email service for the export. The novelty is the prioritisation layer, not the runtime. No queue, no separate admin app, no second deploy target in v1.

## Data Model

Per-plan core entities only. See TASKS.md for the concrete schema.

## Integrations

Named vendor per tech stack list.

## Milestones

M0 (week 1): interview five SaaS founders about the 'too many tools' pain and the thesis. Confirm the prioritisation surface shape.

M1 (weeks 2–4): ship the prioritisation surface, the confidence label, and the export. Strip out anything that is not on the founder's critical path.

M2 (weeks 5–6): pilot with 5 founders. The success metric is whether they could re-state their weekly plan after reading the output.

M3 (week 7): pricing decision only after the pilot. No charge before the prioritisation is verified by a real founder.

## Risks

Technical: the LLM draft of the recommendations can drift in tone and substance. Mitigation: an enforced template with named sections per recommendation, with a confidence label on every row.

Adoption: the founder is one person. The MVP only exists if other SaaS founders have the same 'too many tools' pain. Mitigation: the M0 problem-confirmation interviews are non-negotiable.

Commercial: pricing without a willingness-to-pay signal is guessing. Mitigation: defer monetization until the pilot proves retention.
