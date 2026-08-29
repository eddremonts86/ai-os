---
id: "769"
slug: a-3-year-search-for-a-simple-tool-to-track-both-persona
title: A 3-year search for a simple tool to track both personal and business finances in one place. Nothing fits.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/finance/mc8mvksu31-a-3-year-search-for-a-simple-tool-to-tra"
category: finance
date: "2026-01-29"
tags: [Finance, Freelance, Other]
country: USA
tech: [Next.js (App Router), TypeScript, Postgres, Drizzle ORM, Plaid, Stripe, Plausible]
---
# A 3-year search for a simple tool to track both personal and business finances in one place. Nothing fits.

## Problem

The poster has spent a 3-year search for a simple tool that tracks both personal and business finances in one place and has not found anything that fits. The ProblemHunt capture is the title plus the country USA and the tags Finance, Freelance and Other; nothing further — so the actor is someone with both personal and business finances, the time-on-the-problem is three years (the only quantitative claim, kept as the poster wrote it), and the missing piece is a tool that fits a single user holding two financial contexts rather than splitting them across apps.

The implied problem is that personal finance apps and small-business finance apps are different products with different schemas, different views, and different assumptions about who the user is. A freelancer or a side-hustler who tracks their own checking account and the business account for their LLC ends up with two apps and two mental models; the seam between them — which entity a transaction belongs to, how the personal-to-business transfer is categorised, where taxes are reconciled — becomes the user's permanent background work. A 3-year search is itself data: the poster has presumably tried a personal-finance tool, found it cannot model the business side, then tried a business-finance tool, found it cannot model the personal side, and concluded that neither fits.

Beyond that title the source names no profession, no specific app tried, no transaction volume, and no income level. The plan reasons from the actor (a person holding both personal and business finances), the duration (3-year search), and the missing piece (a single tool that fits both), without inventing a persona's profession, a tool list, or a transaction count.

## Objective

Ship a single finance tool that holds personal and business finances in one store, presents them in one view per user, and eliminates the cross-tool categorisation work that a freelancer or side-hustler currently does manually. One sign-in, one transaction feed with a per-transaction personal-or-business flag, one report per tax year that reconciles the personal-to-business boundary the user has actually drawn.

## Target Users

- A person who has held both personal and business finances in separate apps for a long time and whose cross-tool work is what the post describes as unfitted.
- A freelancer or independent contractor whose income and expenses span personal and business accounts and who has to reconcile the boundary at tax time.
- A small side-hustler whose business is not yet large enough to warrant dedicated bookkeeping software but whose one-business-many-transactions reality is unsupported in personal-finance apps.
- A spouse or family member who is a light user of the personal side but who needs to see household cash flow in the same surface as the user.
- A new business owner who is willing to set up books in one tool from day one, rather than migrating from a personal app later.

## MVP Scope

- One sign-in covering both personal and business finances; a single transaction feed with a per-transaction personal-or-business flag and a category.
- A bank-linking layer that connects US bank and credit-card accounts through a single aggregator, with the personal-or-business flag defaulting from the connected account.
- A personal-or-business boundary that the user can override per transaction, with overrides remembered against the merchant or counterparty.
- A reports view that shows personal cash flow and business cash flow side-by-side, with the personal-to-business transfer surfaced as a transfer, not as two unrelated transactions.
- A tax-year view that summarises business income and deductible expenses along Schedule C categories, so the user can hand a single page to a preparer.
- A monthly-budget view that operates on personal-side transactions, separate from a business-cash-flow view that operates on business-side transactions, so the user does not have to maintain two budgets in their head.
- A light receipts surface that attaches an image to a transaction and surfaces it in both the personal and business views according to the transaction's flag.
- A import path for the most common bank and credit-card CSV exports, so a user whose aggregator cannot reach a bank can still get their history in.
- A export of every transaction as a CSV at any time, without a paid tier.
- A simple rules engine that re-categorises a transaction based on the user's history, so the user does not re-tag the same merchant every month.

## Design Direction

See DESIGN.md for this project's design tokens.

## Constraints

- The capture is one sentence plus the country USA and three tags; nothing beyond that is invented here, including specific apps tried, profession, or transaction volume.
- The poster has spent 3 years searching, which implies they have rejected mainstream personal-finance apps and mainstream small-business bookkeeping tools; the MVP has to address why each fails, not just sit between them.
- Personal-vs-business classification is the user's call, never the platform's; defaults that quietly classify one as the other are exactly the cross-tool work the post names.
- US tax reporting (Schedule C categories in particular) is a real structural requirement for the freelancer use-case the tags imply; the architecture must support it from day one rather than bolting it on later.
- Privacy and security expectations are those of a banking app, not a productivity app; the bank-linking layer has to be PCI-aware and the read-only access has to be visible to the user at all times.
- The 3-year search implies the user has built opinions about what does not work; the MVP must avoid the same anti-patterns the user has already seen, which the post does not enumerate but the design has to be self-evident.
- A free tier has to be meaningful, because the user has a long memory of paid tools that did not deliver and a free tier is the lowest-risk re-entry point.
