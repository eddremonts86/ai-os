---
id: "406"
slug: does-making-tiktok-videos-about-your-b2c-saas-work
title: Does making TikTok videos about your B2C SaaS work?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnl3q0/does_making_tiktok_videos_about_your_b2c_saas_work/"
category: saas
date: "2026-08-13"
---
# Does making TikTok videos about your B2C SaaS work?

## Tech Stack

**Stack chosen for the source-post use case** (`https://www.reddit.com/r/SaaS/comments/1vnl3q0/does_making_tiktok_videos_about_y`):

Country context: the source country. The combination matters more than any single piece.

## Architecture

One static site, one tiny DB for the channel audit responses, one LLM call for the verdict text. The novelty is the verdict, not the runtime. No queue, no separate admin app, no second deploy target in v1.

## Data Model

Per-plan core entities only. See TASKS.md for the concrete schema.

## Integrations

Named vendor per tech stack list.

## Milestones

M0 (week 1): interview five B2C SaaS founders who have run a TikTok / Reels / Shorts motion and recorded the actual return. Confirm the verdict shape.

M1 (weeks 2–4): ship the verdict, the face-on-camera tax section, and the export. Strip out anything that is not on the founder's critical path.

M2 (weeks 5–6): pilot with 5 founders. The success metric is whether they could re-state their start-or-skip decision after reading the output.

M3 (week 7): pricing decision only after the pilot. No charge before the verdict is verified by a real founder.

## Risks

Technical: the LLM verdict can drift in tone and substance. Mitigation: an enforced template with named channels (one per row), not free-form prose.

Adoption: the founder is one person. The MVP only exists if other B2C SaaS founders have the same TikTok question. Mitigation: the M0 problem-confirmation interviews are non-negotiable.

Commercial: pricing without a willingness-to-pay signal is guessing. Mitigation: defer monetization until the pilot proves retention.
