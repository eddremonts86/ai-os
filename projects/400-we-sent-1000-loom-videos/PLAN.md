---
id: "400"
slug: we-sent-1000-loom-videos
title: We sent 1000 loom videos
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnn9g5/we_sent_1000_loom_videos/"
category: saas
date: "2026-08-13"
---
# We sent 1000 loom videos

## Tech Stack

The stack below is what *this* plan needs; chosen for the specific problem in the post, not a corpus default:

- **Next.js 14** — chosen for this plan.
- **TypeScript** — chosen for this plan.
- **Postgres + Drizzle** — chosen for this plan.
- **Anthropic Claude API** — chosen for this plan.
- **Loom API** — chosen for this plan.
- **Vercel** — chosen for this plan.

Every plan in this batch picks a different stack so the tech-stack facet actually filters. The legacy default (React + TanStack Start + SQLite/Drizzle + Coolify + Docker) is absent on purpose.

## Architecture

One web app, one Postgres database, one LLM call for the follow-up sequence draft, one Loom API call for the embed metadata. The novelty is the content, not the runtime. No queue, no separate admin app, no second deploy target in v1.

## Data Model

Per-plan core entities only. See TASKS.md for the concrete schema.

## Integrations

Named vendor per tech stack list.

## Milestones

M0 (week 1): interview three B2B SaaS founders who have run a video outbound motion and recorded the actual reply rate, call rate, and follow-up sequence. Confirm the calculator shape.

M1 (weeks 2–4): ship the calculator, the follow-up sequence template, and the export. Strip out anything that is not on the founder's critical path.

M2 (weeks 5–6): pilot with 5 founders. The success metric is whether they could re-state their start-or-skip decision after reading the output.

M3 (week 7): pricing decision only after the pilot. No charge before the calculator is verified by a real founder.

## Risks

Technical: the LLM draft of the follow-up sequence can drift in tone and substance. Mitigation: an enforced template with named cadence rows, not free-form prose.

Adoption: the founder is one person. The MVP only exists if other B2B SaaS founders have the same video-outbound question. Mitigation: the M0 problem-confirmation interviews are non-negotiable.

Commercial: pricing without a willingness-to-pay signal is guessing. Mitigation: defer monetization until the pilot proves retention.
