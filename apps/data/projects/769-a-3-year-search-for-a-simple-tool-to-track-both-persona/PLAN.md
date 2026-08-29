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

## Tech Stack

- **Next.js (App Router)** for the web app, chosen because the transaction feed is a long list with filters, the reports view is a multi-pane layout, and the App Router handles both with server components for the read-heavy surfaces.
- **TypeScript** end-to-end, because the personal/business classification and the rule-based override logic are easier to keep correct in a typed schema.
- **Postgres** as the primary store, because the personal/business entity model is relational and the per-merchant override logic needs queryable history.
- **Drizzle ORM** as the data layer, because the schema includes per-transaction flags, per-merchant rules, and per-budget overrides that benefit from typed query builders.
- **Plaid** for US bank and credit-card linking, because Plaid is the broadest US bank aggregator and the platform's coverage depends on it.
- **Stripe** for the subscription billing surface, because the source names no billing preference and Stripe is the cheapest pragmatic US-billing choice for a B2C finance tool.
- **Plausible** for product analytics, chosen because the source capture is one paragraph and the platform does not need to ingest user financial events into an analytics vendor; product analytics stays meta-only.

## Architecture

The user signs in once and sees one workspace. The workspace has two surfaces — a personal budget view and a business cash-flow view — and one shared transaction feed underneath. The transaction feed is the core: every transaction has a flag (personal, business, transfer), a category, and a counterparty, and overrides on the flag or category are remembered against the counterparty for future transactions. The override logic is the structural difference between this tool and the two-app split the post describes: a flag set once is applied automatically to new transactions from that counterparty, and the user never has to re-tag them.

Bank links run through Plaid on a daily refresh, and the per-merchant rule engine runs on every refresh, so a recurring transaction from a business counterparty is flagged as business every month without re-tagging. A manual CSV import path is wired for banks Plaid cannot reach; the import runs through the same flagging and categorisation logic so the user does not get a different experience depending on the source. A receipts surface stores an uploaded image attached to a transaction, and the attachment is surfaced on whichever side (personal or business) the transaction's flag points to.

The tax-year view is the closing argument for the freelancer use-case the tags imply. The reports engine groups business-flagged transactions along Schedule C categories, producing a one-page summary the user can hand to a preparer. The summary is structured by a US-tax-knowledgeable rule set, not invented by the engineering team; the rule set is reviewed at launch against an enrolled accountant's feedback.

Privacy is treated as a banking-app expectation. Bank credentials are held by Plaid, not by the platform; the platform holds transaction metadata and the user's own categorisations, and the export surface is plain CSV at any time without a paid tier.

## Milestones

1. **M1 — Sign-in and one workspace** — Single sign-in for personal and business; one workspace; one transaction feed underneath.
2. **M2 — Bank linking** — Plaid integration for US banks and credit cards with daily refresh.
3. **M3 — Flag and override model** — Per-transaction personal/business flag with counterparty-remembered overrides; a rules engine that applies them on refresh.
4. **M4 — Two surfaces, one feed** — Personal budget view and business cash-flow view sharing one transaction feed; transfer detection between personal and business accounts.
5. **M5 — CSV import and export** — Import paths for common bank and credit-card CSV formats; CSV export at any time without a paid tier.
6. **M6 — Tax-year view** — Schedule-C-structured business summary; one-page export the user can hand to a preparer.
7. **M7 — Receipts** — Per-transaction receipt attachment with correct surfacing on either side of the flag.
8. **M8 — Polish** — Rule engine tuning, override UX refinement, and the receipts-on-flag-change migration verified.

## Risks

- **Default-classification drift** — a default that quietly classifies one transaction type as the other side reproduces the cross-tool work the post names; defaults have to be auditable per counterparty.
- **Plaid coverage gaps** — a US finance app is only as good as its bank aggregator; the CSV import path must work even when Plaid cannot reach a bank.
- **Override staleness** — counterparty-remembered overrides can go stale when a merchant rebrands or changes accounts; the override surface has to make the rule visible and re-editable.
- **Tax-rule authoring** — schedule-C-shaped summaries are easy to invent badly; the rule set has to be authored by someone who does US tax reporting rather than inferred from input.
- **Privacy of financial data** — a finance app that sends data anywhere the user has not approved is unfit by definition; the data-flow surface has to be visible and the export path has to be free.
- **Refresh SLA** — a finance app with a 24-hour data lag is unfit for budgeting; the refresh latency has to be measurable and the SLA visible.
- **Spreadsheet competition** — a long-time spreadsheet user is the highest-effort audience to migrate; the free tier is the lowest-friction entry path and has to be meaningful.
- **Dual-surface budget maintenance** — two surfaces sharing one feed can produce redundant work if not designed carefully; the rule engine has to make dual-surface updates automatic rather than manual.
