---
id: "409"
slug: kick-them-out-or-put-a-paywall
title: Kick them out or put a paywall?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnjo91/kick_them_out_or_put_a_paywall/"
category: saas
date: "2026-08-13"
---
# Kick them out or put a paywall?

## Problem

A fairly large corporation has been using the poster's SaaS platform for over a year and keeps dodging meetings to go into a commercial deal. The corporation is essentially using the product for free. The history: over a year ago, the poster built an AI chat for industrial companies and was desperate to get LOIs to raise money. The deal was mutually beneficial at the time — the corporation got an AI for free, the poster got users to test the product. The platform has evolved a lot since, but the corporation is still just using the chatbot. The question is whether to kick them out or put a paywall in front of them. The post is a question, not a complaint. No country, no name, no ARR was stated.

## Objective

Give a SaaS founder who has a freeloading enterprise customer a decision aid that names the kick-out vs. paywall trade-off, with the named consequences of each path. The job is not to make the call — it is to give the founder a way to make the call with the named consequences in front of them.

## Target Users

Primary: a SaaS founder who has a notable enterprise customer running on a free tier long after the initial LOI deal and is weighing kick-out vs. paywall. Secondary: a head of sales or VP customer success at the same kind of company who is being asked to make the call and wants the named consequences in front of them.

## MVP Scope

In scope for v1:

- A decision aid: kick-out vs. paywall, with the named consequences of each — case-study leverage, churn risk, future LOI leverage, opportunity cost, internal team morale.
- A 'before you make the call' checklist: the named facts the founder should have before they send the email or the contract.
- A named-talk-track template: how to frame the conversation whether the founder kicks out or pays walls.
- A one-page export the founder can drop into a Notion doc or a team thread.

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SaaS/comments/1vnjo91/kick_them_out_or_put_a_paywall/` follows the constraints in `409-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- The source is a question, not a feature request — the deliverable is a decision aid, not a product.
- No country, no customer name, no MRR was stated; the MVP must work for any SaaS founder with a free-tier enterprise customer running long past the LOI.
- The output must not invent a paywall model — name the categories (per-seat, per-usage, per-feature) and let the founder fill in the model.
