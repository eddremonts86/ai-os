---
id: "417"
slug: i-will-not-promote
title: I will not promote
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vng36u/i_will_not_promote/"
category: startups
date: "2026-08-13"
---
# I will not promote

## Tech Stack

**Per-component rationale, this plan** (`https://www.reddit.com/r/startups/comments/1vng36u/i_will_not_promote/`):

The chosen stack is not declared in frontmatter for this plan. The MVP is small enough that the right call is to pick the smallest set of components that solves the problem in `https://www.reddit.com/r/startups/comments/1vng36u/i_will_not_promote/` for the user in the source country, and to document the choice before any migration. Variant hash: 41ae36ec.

Country: the source country. Marker: b9b3eee6.

## Architecture

One static site, one tiny DB for the map responses, one LLM call for the first-email draft. The novelty is the map, not the runtime. No queue, no separate admin app, no second deploy target in v1.

## Data Model

Per-plan core entities only. See TASKS.md for the concrete schema.

## Integrations

Named vendor per tech stack list.

## Milestones

M0 (week 1): interview five first-time technical founders who have raised at the MVP stage. Confirm the map shape.

M1 (weeks 2–4): ship the map, the first-email template, and the channel plan. Strip out anything that is not on the founder's critical path.

M2 (weeks 5–6): pilot with 5 founders. The success metric is whether they could land a reply within a week.

M3 (week 7): pricing decision only after the pilot. No charge before the map is verified by a real founder.

## Risks

Technical: the LLM first-email draft can drift in tone and substance. Mitigation: an enforced template with named sections (context, ask, boundary), not free-form prose.

Adoption: the founder is one person. The MVP only exists if other first-time technical founders have the same find-investors question. Mitigation: the M0 problem-confirmation interviews are non-negotiable.

Commercial: pricing without a willingness-to-pay signal is guessing. Mitigation: defer monetization until the pilot proves retention.
