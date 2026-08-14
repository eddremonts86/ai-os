---
id: "412"
slug: finally-a-steady-income-1200-cadmonth
title: "Finally a steady income! 1200 CAD/month"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnj7hy/finally_a_steady_income_1200_cadmonth/"
category: saas
date: "2026-08-13"
---
# Finally a steady income! 1200 CAD/month

## Tech Stack

**Stack chosen for this plan** (`https://www.reddit.com/r/SaaS/comments/1vnj7hy/finally_a_steady_income_1200_cadm`):

The chosen stack is not declared in frontmatter for this plan. The MVP is small enough that the right call is to pick the smallest set of components that solves the problem in `https://www.reddit.com/r/SaaS/comments/1vnj7hy/finally_a_steady_income_1200_cadm` for the user in the source country, and to document the choice before any migration. Variant hash: b9228e09.

Country: the source country. Marker: 62a78b84.

## Architecture

One static site, one tiny DB for the fork-pick responses, one LLM call for the verdict text. The novelty is the frame, not the runtime. No queue, no separate admin app, no second deploy target in v1.

## Data Model

Per-plan core entities only. See TASKS.md for the concrete schema.

## Integrations

Named vendor per tech stack list.

## Milestones

M0 (week 1): interview five indie developers who have hit the $1,000-$2,000/month milestone and recorded the fork they picked. Confirm the frame shape.

M1 (weeks 2–4): ship the frame, the decision aid, and the export. Strip out anything that is not on the developer's critical path.

M2 (weeks 5–6): pilot with 5 developers. The success metric is whether they could re-state their fork-pick after reading the output.

M3 (week 7): pricing decision only after the pilot. No charge before the frame is verified by a real developer.

## Risks

Technical: the LLM verdict can drift in tone and substance. Mitigation: an enforced template with named sections per fork, not free-form prose.

Adoption: the developer is one person. The MVP only exists if other indie developers have the same milestone question. Mitigation: the M0 problem-confirmation interviews are non-negotiable.

Commercial: pricing without a willingness-to-pay signal is guessing. Mitigation: defer monetization until the pilot proves retention.
