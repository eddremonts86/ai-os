---
id: "246"
slug: users-of-credit-products-regularly-overpay-due-to-non-t
title: Users of credit products regularly overpay due to non-transparent bank terms. There is no advocate service that would analyze their spending and find hidden fees.
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/finance/jtv11ju831-users-of-credit-products-regularly-overp"
category: finance
date: "2026-01-18"
tags: [Finance, Legal, Other]
country: Russia
---
# Users of credit products regularly overpay due to non-transparent bank terms. There is no advocate service that would analyze their spending and find hidden fees.

## Problem

In Russia, consumers who use credit products — cards, installment plans, consumer loans, mortgages — regularly pay more than they expect because the bank's pricing is spread across multiple documents (rate card, tariff schedule, insurance add-ons, SMS-notification fees, cash-advance commissions, penalty mechanics, currency-conversion markups). The poster frames the missing piece as an independent advocate service that would read those documents, look at a customer's actual statement, and call out the hidden fees that compound month after month.

The pain is asymmetric: a bank employee can quote a headline rate, but the customer only discovers the effective cost after signing. There is no neutral intermediary who works on the customer's side, in plain Russian, and produces a list of "you paid X for things you didn't realize you were paying for." The post does not quote specific bank fees, percentages, or ruble amounts — the problem is stated as a structural lack of advocacy, not a quantified loss.

## Objective

Build a service that ingests a Russian consumer's bank statements and credit-product contracts, then surfaces non-transparent fees, buried charges, and contract clauses that the customer is paying for without realizing it. The output is a plain-language report ("Advocate Report") that the customer can use to dispute charges with their bank, negotiate a tariff change, or decide to refinance.

The MVP focuses on the discovery step — turning opaque paper into a list — and stops short of automated dispute filing or legal representation. A human advocate can be the next layer, but the deliverable in scope is a clear, evidence-backed list of "this is what you are paying and why."

## Target Users

- Russian adults who hold at least one credit product (card with overdraft, consumer loan, installment plan, mortgage) and suspect they are overpaying but cannot prove it.
- People who are about to sign a new credit agreement and want a second opinion on the fine print before committing.
- Financially literate users who want a periodic check (every 6–12 months) on whether their bank has changed tariffs or added new fees since they signed.
- Family members helping a relative (often an older parent) audit the cost of their existing banking relationship.

The source does not specify age, income, region, or occupation; the user is framed in behavioral terms — someone who already pays a bank and cannot tell whether the price is fair.

## MVP Scope

- Upload a bank statement (PDF or CSV export from a Russian online-banking portal) and, optionally, the credit agreement PDF.
- Parse the statement into transactions and tag each one against a catalogue of fee patterns common to Russian retail banks (cash-advance commissions, SMS-banking fees, insurance add-ons, currency-markup spreads, penalty interest, account-maintenance fees).
- Parse the credit agreement to extract headline rate, effective annual rate, list of tariff items, and clauses that mention additional fees.
- Produce an Advocate Report: a list of identified hidden or non-transparent charges, each with a line from the source document, a plain-language explanation, and an estimated ruble cost over the trailing 12 months. The poster's title and source URL do not quote numbers, so the report shows the customer's own numbers rather than benchmark figures.
- Export the report as a PDF the customer can hand to their bank or keep for their records.

The MVP is single-customer, single-bank, read-only. No dispute submission, no legal escalation, no migration to another bank.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/finance/jtv11ju831-users-of-credit-products-regularly` follows the constraints in `246-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Russian-language output. Source material is in Russian, and the report must be readable without translation by the customer and by Russian bank staff.
- Document handling is sensitive: statements and contracts contain personal data. The MVP must keep storage to the minimum needed to produce one report, and document the retention policy on the upload screen.
- No regulatory advice. The service surfaces findings; it does not draft complaints to the Central Bank of Russia, file lawsuits, or represent the customer in court.
- Coverage is limited to retail banking products visible on a statement. Investment products, brokerage accounts, and business banking are out of scope.
- The MVP does not connect to bank APIs (no aggregator is universally available to Russian consumers). All input is uploaded by the user.
