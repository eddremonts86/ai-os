---
id: "452"
slug: expense-split-app-idea
title: Expense split app idea
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnxl6p/expense_split_app_idea/"
category: saas
date: "2026-08-14"
tech: [Next.js, TypeScript, Node.js (Hono), PostgreSQL, Stripe Connect, Resend, Vercel]
---
# Expense split app idea

## Problem

Source: https://www.reddit.com/r/SaaS/comments/1vnxl6p/expense_split_app_idea/

Original post:

> I know some of you might be saying “this already exists”. I have a niche, but lmk if it already exists. Problem - Our soccer group wants to split rental fees. - Currently the club manager uses zelle/venmo or cash to collect. - Problem is people don’t pay on time, and it’s a pain to track if the payment is for this game or the last. - The manager doesn’t have time to track every single payment and has probably absorbed too much cost. Ideas - I want to automate the payment capture process. - That way an individual who hasn’t paid for X games will be blocked from RSVP. - And the manager has a piece of mind that he is no longer in negative balance. Challenges - Peer-to-peer (P2P) like venmo, zelle, etc. doesn’t have api or webhooks to help with my use case. - Payment provider platforms like Stripe has solid API but requires complex onboarding and tax headache. - And apparently Stripe doesnt support P2P either. - I’ve looked into Moov (they require $500/mo minimum). Questions Has anyone else been in the same boat? I’m sure there gotta be a solution out there somehow. I dont want to make myself become the MoR and deal with all the taxes thing. I just want to provide an app for manager to collect reimbursed fees. submitted by /u/imnotavibecoder [link] [comments]

---

What this plan addresses: An expense-split + RSVP-gating app for amateur sports clubs and small recurring groups, designed around the manager's pain.

## Objective

An expense-split + RSVP-gating app for amateur sports clubs that uses Stripe Connect so the manager never becomes the merchant of record. When I am a club manager collecting recurring fees, I want an app that automates payment + RSVP without making me the MoR, so I stop absorbing the cost of unpaid members.

## Target Users

- Amateur sports club managers collecting recurring fees (soccer, basketball, volleyball)
- Small recurring groups (book clubs, climbing groups) with non-paying members
- Treasurers who are tired of absorbing unpaid balances

## MVP Scope

- Manager sets up a recurring fee + RSVP rule ("blocked after 2 unpaid games")
- Member pays via Stripe; manager never becomes the MoR
- Receipts issued automatically; manager's personal balance is never at risk
- Simple SMS / email reminders for unpaid members

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SaaS/comments/1vnxl6p/expense_split_app_idea/` follows the constraints in `452-.../SPEC.md` and the chosen stack (Next.js, TypeScript, Node.js (Hono)). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body explicitly says peer-to-peer apps (Venmo, Zelle) lack APIs; Stripe requires onboarding the manager as MoR
- Plan addresses the MoR problem with Stripe Connect
- Source did not name a country, fee amount, or group size
