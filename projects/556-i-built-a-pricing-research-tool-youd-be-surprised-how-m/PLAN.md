---
tags: ["saas", "pricing", "research", "b2b"]
tech: ["Next.js", "TypeScript", "Supabase", "Resend", "Stripe"]
id: "556"
slug: i-built-a-pricing-research-tool-youd-be-surprised-how-m
title: "I built a pricing research tool, you'd be surprised how many people initially set their pricing just based on a competitor"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo6270/i_built_a_pricing_research_tool_youd_be_surprised/"
category: saas
date: "2026-08-14"
---
# I built a pricing research tool, you'd be surprised how many founders don't actually research their first price

## Tech Stack

- **Web app:** Next.js + TypeScript + Tailwind CSS.
- **Survey delivery:** the founder's own domain via Resend or SES; the tool never sends from its own domain.
- **Storage:** Supabase (auth, per-engagement user list, survey responses, decision log).
- **Model engine:** a TypeScript implementation of Van Westendorp + a revenue-impact simulator.
- **Decision log export:** a signed JSON + PDF per engagement.
- **Payments:** Stripe.

## Architecture

Web app + Supabase + a model engine. The survey is delivered via the founder's own email provider; the responses land in the per-engagement Supabase workspace; the model engine produces the revenue-impact output; the decision log is exported with a per-engagement signature.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + a single-engagement survey demo. End of week 1.
2. **M1 — Survey delivery + per-engagement data isolation.** Resend / SES integration. End of week 3.
3. **M2 — Van Westendorp model + revenue-impact simulator.** End of week 5.
4. **M3 — Decision log export + signing.** End of week 7.
5. **M4 — Stripe paywall + Pro tier.** End of week 9.

## Risks

- **Data isolation** — one founder's user list must never leak to another; per-engagement Postgres schemas or row-level security are mandatory.
- **Survey deliverability** — the tool is not a sender; deliverability is the founder's responsibility, the tool is the analyst.
