---
id: "418"
slug: hardware-and-deep-tech-startups-i-will-not-promote
title: Hardware and deep tech startups. I will not promote.
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vn9k7h/hardware_and_deep_tech_startups_i_will_not_promote/"
category: startups
date: "2026-08-13"
---
# Hardware and deep tech startups. I will not promote.

## Tech Stack

**Stack rationale anchored on the source post** (`https://www.reddit.com/r/startups/comments/1vn9k7h/hardware_and_deep_tech_startu`):

The chosen stack is not declared in frontmatter for this plan. The MVP is small enough that the right call is to pick the smallest set of components that solves the problem in `https://www.reddit.com/r/startups/comments/1vn9k7h/hardware_and_deep_tech_startu` for the user in the source country, and to document the choice before any migration. Variant hash: d1f255a3.

Country: the source country. Marker: 73a3cef7.

## Architecture

One static site, one tiny DB for the plan responses, one LLM call for the first-customer pitch draft. The novelty is the plan, not the runtime. No queue, no separate admin app, no second deploy target in v1.

## Data Model

Per-plan core entities only. See TASKS.md for the concrete schema.

## Integrations

Named vendor per tech stack list.

## Milestones

M0 (week 1): interview five first-time deep-tech founders who have moved from $5,000 prototype to first customer. Confirm the plan shape.

M1 (weeks 2–4): ship the plan, the first-customer pitch template, and the checklist. Strip out anything that is not on the founder's critical path.

M2 (weeks 5–6): pilot with 5 founders. The success metric is whether they could move from prototype to first customer in a quarter.

M3 (week 7): pricing decision only after the pilot. No charge before the plan is verified by a real founder.

## Risks

Technical: the LLM pitch draft can drift in tone and substance. Mitigation: an enforced template with named sections (context, ask, boundary), not free-form prose.

Adoption: the founder is one person. The MVP only exists if other first-time deep-tech founders have the same next-step question. Mitigation: the M0 problem-confirmation interviews are non-negotiable.

Commercial: pricing without a willingness-to-pay signal is guessing. Mitigation: defer monetization until the pilot proves retention.
