---
id: "401"
slug: how-did-you-get-your-first-real-users-when-nobody-knew-
title: How did you get your first real users when nobody knew your product existed?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnml9h/how_did_you_get_your_first_real_users_when_nobody/"
category: saas
date: "2026-08-13"
---
# How did you get your first real users when nobody knew your product existed?

## Tech Stack

**Stack fit** — for the workflow described at `https://www.reddit.com/r/SaaS/comments/1vnml9h/how_did_you_get_your_first_real_u` in the source country, this is the minimal set:

If a future iteration swaps any of these, the swap must be justified in PLAN.md, not silently.

## Architecture

One static site, one tiny DB for the channel-audit responses, one LLM call for the verdict text. The novelty is the content, not the runtime. No queue, no separate admin app, no second deploy target in v1.

## Data Model

Per-plan core entities only. See TASKS.md for the concrete schema.

## Integrations

Named vendor per tech stack list.

## Milestones

M0 (week 1): interview five solo developers of comparable tools about the channel that actually delivered their first 50-100 users. Confirm the catalog shape.

M1 (weeks 2–4): ship the catalog, the audit, and the export. Strip out anything that is not on the developer's critical path.

M2 (weeks 5–6): pilot with 10 developers. The success metric is whether they could re-state their channel-pick after reading the output.

M3 (week 7): pricing decision only after the pilot. No charge before the catalog is verified by a real developer.

## Risks

Technical: the LLM verdict can drift in tone and substance. Mitigation: an enforced template with named channels (one per row), not free-form prose.

Adoption: the developer is one person. The MVP only exists if other solo developers have the same discovery-to-50 question. Mitigation: the M0 problem-confirmation interviews are non-negotiable.

Commercial: pricing without a willingness-to-pay signal is guessing. Mitigation: defer monetization until the pilot proves retention.
