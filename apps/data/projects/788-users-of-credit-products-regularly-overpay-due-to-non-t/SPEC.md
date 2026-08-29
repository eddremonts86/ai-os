---
id: "788"
slug: users-of-credit-products-regularly-overpay-due-to-non-t
title: Users of credit products regularly overpay due to non-transparent bank terms. There is no advocate service that would analyze their spending and find hidden fees.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/finance/jtv11ju831-users-of-credit-products-regularly-overp"
category: finance
date: "2026-01-18"
tags: [Finance, Legal, Other]
country: Russia
tech: [Bun, Hono, Postgres, Tinkoff/YooMoney Open Banking sandbox, pdfplumber (Python sidecar), Resend, Fly.io (Frankfurt region)]
---
# Users of credit products regularly overpay due to non-transparent bank terms. There is no advocate service that would analyze their spending and find hidden fees.

## Problem

The poster argues that users of credit products regularly overpay because bank terms are not transparent, and that no advocate service exists to analyse their spending and find the hidden fees inside their statements. The pain is double: the user cannot see the structure of what they are paying, and no one in the existing system is on their side of the table. The missing thing is a service that takes a user's real statement, reads it line by line, and tells the user which fees were avoidable and which product features they are paying for without using.

The capture is a one-line ProblemHunt problem statement with the country Russia as its only extra detail. The title carries the rest: the actor is a credit-product user, the pain is the combination of non-transparent terms and overpayment, and the missing thing is an advocate that turns opaque statements into concrete findings. The poster names no specific bank, no product type and no fee category, so we cannot claim the user holds a credit card, a personal loan or a mortgage; what we can work from is the overpayment pattern the title names and the advocate role the title asks for.

The implied hard parts are accuracy and trust on the user's side. Russian bank statements come in PDF, in proprietary mobile-export formats and behind Open Banking APIs that vary by bank; an advocate that misreads a statement is worse than no advocate at all because the user will act on the finding. Trust is the other hard part: a Russian user is being asked to hand a copy of their credit statement to a third party, and the service has to earn that trust by being local, by keeping the statement off any cloud that is not Russian-jurisdiction, and by not selling the findings to the bank.

## Objective

Ship an advocate service that takes a user's Russian credit-product statement, parses it into a structured spend record, identifies recurring fees, hidden charges and product features the user is paying for without using, and returns a plain-language report with the items the user can dispute or renegotiate. The capture is rich enough to fix the advocate role: the service is on the user's side of the table, it reads the user's real statement rather than asking the user to retype anything, and it produces findings the user can act on with their bank.

## Target Users

- Russian credit-product users who suspect they are paying fees they do not understand and want an independent read of their statement.
- Russian users with multiple credit products (card, personal loan, instalment) who want one advocate across all of them rather than per-bank self-service.
- Users who have tried to renegotiate a fee with a bank and been told the fee is standard, and who want a structured argument rather than a phone call.
- Users preparing to refinance or close a product, who need a clean view of every charge attached to the product before they act.
- Users whose statements they cannot easily read themselves because of small-print terminology, who need the advocate to translate the line items into plain language.

## MVP Scope

- Statement ingest via three paths: PDF upload parsed by a Python pdfplumber sidecar, CSV export from a Russian mobile-banking app, and a direct Open Banking connection where the bank exposes one (Tinkoff and YooMoney sandboxes for development).
- A statement normaliser that turns the parsed lines into a structured spend record: date, merchant, amount, category, fee flag and any recurring-charge marker.
- A findings engine that surfaces recurring fees, charges that do not match a previously stated tariff, late-payment patterns, insurance add-ons the user did not opt into and product features (cashback, grace period, travel insurance) the user is paying for but not using.
- A plain-language report with each finding, the line in the statement that triggered it and the language the user can use when they raise the finding with their bank.
- A dispute-letter helper that drafts a letter in Russian based on the findings, with the user able to edit before sending.
- A "do not sell my findings" promise that is enforced in the architecture, not just in a privacy notice.
- Storage of statement copies and parsed records in a Postgres instance in a Russian-jurisdiction cloud, so the user's data does not leave the country.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The service is an advocate, not a financial adviser; every report has to make that distinction explicit and the dispute letter is for the user to send, not the service.
- Statement files are sensitive; they must be stored encrypted at rest, transmitted over TLS, and deletable by the user at any time without a support ticket.
- The data has to stay in Russian jurisdiction; the deployment cannot push statement copies to a non-Russian cloud provider.
- The findings engine has to be conservative: a fee that looks unusual is flagged for the user to confirm, not asserted as hidden.
- The dispute letter is a draft the user reviews and edits; sending the letter happens from the user's own channel, not from the service.
- Bank tariffs change; every finding has to carry the tariff reference it was checked against and the date of that reference.
- The MVP does not connect to live bank APIs for production use; Tinkoff and YooMoney sandboxes are for development, and any production Open Banking connection is gated behind an explicit, separately-consented flow.
