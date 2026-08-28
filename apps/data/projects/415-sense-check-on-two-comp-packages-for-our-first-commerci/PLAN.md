---
id: "415"
slug: sense-check-on-two-comp-packages-for-our-first-commerci
title: Sense check on two comp packages for our first commercial hire - equity vs cash split - I will not promote
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vnj580/sense_check_on_two_comp_packages_for_our_first/"
category: startups
date: "2026-08-13"
---
# Sense check on two comp packages for our first commercial hire - equity vs cash split - I will not promote

## Tech Stack

**Stack chosen for this plan** (`https://www.reddit.com/r/startups/comments/1vnj580/sense_check_on_two_comp_packa`):

The chosen stack is not declared in frontmatter for this plan. The MVP is small enough that the right call is to pick the smallest set of components that solves the problem in `https://www.reddit.com/r/startups/comments/1vnj580/sense_check_on_two_comp_packa` for the user in the source country, and to document the choice before any migration. Variant hash: 42e7aaa8.

Country: the source country. Marker: 8b48137a.

## Architecture

One static site, one tiny DB for the framework responses, one LLM call for the verdict text. The novelty is the framework, not the runtime. No queue, no separate admin app, no second deploy target in v1.

## Data Model

Per-plan core entities only. See TASKS.md for the concrete schema.

## Integrations

Named vendor per tech stack list.

## Milestones

M0 (week 1): interview five small B2B founders who have made their first senior commercial hire. Confirm the framework shape.

M1 (weeks 2–4): ship the framework, the side-by-side sketch, and the export. Strip out anything that is not on the founder's critical path.

M2 (weeks 5–6): pilot with 5 founders. The success metric is whether they could re-state their comp-pick after reading the output.

M3 (week 7): pricing decision only after the pilot. No charge before the framework is verified by a real founder.

## Risks

Technical: the LLM verdict can drift in tone and substance. Mitigation: an enforced template with named sections per option, not free-form prose.

Adoption: the founder is one person. The MVP only exists if other small B2B founders have the same first-hire question. Mitigation: the M0 problem-confirmation interviews are non-negotiable.

Commercial: pricing without a willingness-to-pay signal is guessing. Mitigation: defer monetization until the pilot proves retention.
