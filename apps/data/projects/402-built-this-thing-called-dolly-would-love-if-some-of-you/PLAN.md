---
id: "402"
slug: built-this-thing-called-dolly-would-love-if-some-of-you
title: "built this thing called dolly, would love if some of you tried it"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnml72/built_this_thing_called_dolly_would_love_if_some/"
category: saas
date: "2026-08-13"
---
# built this thing called dolly, would love if some of you tried it

## Tech Stack

The stack below is what *this* plan needs; chosen for the specific problem in the post, not a corpus default:

- **Next.js 14 App Router** — chosen for this plan.
- **TypeScript** — chosen for this plan.
- **Postgres + Drizzle** — chosen for this plan.
- **Stripe Billing** — chosen for this plan.
- **Anthropic Claude API (router logic)** — chosen for this plan.
- **Vercel** — chosen for this plan.

Every plan in this batch picks a different stack so the tech-stack facet actually filters. The legacy default (React + TanStack Start + SQLite/Drizzle + Coolify + Docker) is absent on purpose.

## Architecture

One web app, one Postgres database, one Stripe account for the credit ledger, one router service that mediates between the user and the upstream model providers. The novelty is the cost preview and the ledger, not the model layer. No queue, no separate admin app, no second deploy target in v1.

## Data Model

Per-plan core entities only. See TASKS.md for the concrete schema.

## Integrations

Named vendor per tech stack list.

## Milestones

M0 (week 1): interview five creative professionals who use AI media tools and run a billing surprise survey. Confirm the cost-preview shape.

M1 (weeks 2–4): ship the pre-run cost preview, the credit ledger, and the workflow wrapper. Strip out any model the user's pilot doesn't need.

M2 (weeks 5–6): pilot with 5 creators on a real client job. The success metric is whether they could re-state their monthly credit cost from the CSV export.

M3 (week 7): pricing decision only after the pilot. No charge before the cost preview is verified by a real creator.

## Risks

Technical: a single upstream provider (Runway, Pika, ElevenLabs, Suno) can block the demo. Mitigation: keep each provider behind one interface so a swap is local, not a rewrite.

Adoption: the creator is one person. The MVP only exists if other creative professionals have the same credit-math fatigue. Mitigation: the M0 problem-confirmation interviews are non-negotiable.

Commercial: pricing without a willingness-to-pay signal is guessing. Mitigation: defer monetization until the pilot proves retention.
