---
id: "420"
slug: advice-on-share-distribution-with-founding-engineer-i-w
title: Advice on share distribution with founding engineer. I will not promote.
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vmwyvt/advice_on_share_distribution_with_founding/"
category: startups
date: "2026-08-13"
---
# Advice on share distribution with founding engineer. I will not promote.

## Tech Stack

**Stack fit for the workflow** (`https://www.reddit.com/r/startups/comments/1vmwyvt/advice_on_share_distribution_`):

The chosen stack is not declared in frontmatter for this plan. The MVP is small enough that the right call is to pick the smallest set of components that solves the problem in `https://www.reddit.com/r/startups/comments/1vmwyvt/advice_on_share_distribution_` for the user in the source country, and to document the choice before any migration. Variant hash: b6f0479a.

Country: the source country. Marker: e87d2449.

## Architecture

One static site, one tiny DB for the framework responses, one LLM call for the conversation draft. The novelty is the framework, not the runtime. No queue, no separate admin app, no second deploy target in v1.

## Data Model

Per-plan core entities only. See TASKS.md for the concrete schema.

## Integrations

Named vendor per tech stack list.

## Milestones

M0 (week 1): interview five first-time founders who have signed a founder / founding-engineer deal. Confirm the framework shape.

M1 (weeks 2–4): ship the framework, the checklist, and the conversation template. Strip out anything that is not on the founder's critical path.

M2 (weeks 5–6): pilot with 5 founders. The success metric is whether they could re-state their share-distribution decision after reading the output.

M3 (week 7): pricing decision only after the pilot. No charge before the framework is verified by a real founder.

## Risks

Technical: the LLM conversation draft can drift in tone and substance. Mitigation: an enforced template with named sections (context, ask, boundary), not free-form prose.

Adoption: the founder is one person. The MVP only exists if other first-time founders have the same share-distribution question. Mitigation: the M0 problem-confirmation interviews are non-negotiable.

Commercial: pricing without a willingness-to-pay signal is guessing. Mitigation: defer monetization until the pilot proves retention.
