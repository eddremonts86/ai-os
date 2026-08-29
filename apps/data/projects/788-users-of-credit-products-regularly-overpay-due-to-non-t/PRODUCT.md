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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

Russian bank statements are technically public to the account holder, and practically opaque. A user can see the numbers but cannot easily see the structure: which fee recurs, which insurance add-on they never asked for, which product feature they are paying for without using, which late-payment charges could have been avoided. The poster names this opacity as the cause of regular overpayment and the absence of an advocate on the user's side as the missing service.

The product reads the user's statement and returns a plain-language findings report. It accepts the statement as a PDF, as a CSV export, or through a sandboxed Open Banking connection; parses the lines into a structured spend record; runs a findings engine that flags recurring fees, off-tariff charges, unused product features and avoidable late-payment patterns; and produces a report the user can read without a banking dictionary. A dispute-letter helper drafts the language the user can use when they raise a finding with the bank; the user reviews and sends it themselves.

The data stays in Russian jurisdiction. The deployment does not sell findings to banks, advertisers or affiliates. The MVP is one user uploading one statement at a time, which is the advocate shape the title implies.

**One-liner:** A Russian-jurisdiction advocate that reads a user's credit-product statement, flags the recurring fees and unused features the user is paying for, and drafts the language they can use to push back on their bank.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Russian credit-product users | The capture names them directly; they get an independent read of their statement instead of trusting a bank self-service portal. |
| Users with multiple credit products | One advocate across card, loan and instalment rather than per-bank guesswork. |
| Users preparing to renegotiate | A structured findings report is a stronger basis for a renegotiation call than a vague feeling of overpayment. |
| Users preparing to refinance or close | A clean view of every charge attached to the product before the user acts. |
| Users with low financial literacy | The advocate translates the line items into plain language so the user does not have to decode small-print terminology alone. |

## Jobs To Be Done

1. **Functional job** — Hand the statement to someone on the user's side and get back a structured list of what the user is paying for and why.
2. **Functional job** — Identify the fees and product features the user is paying for without using.
3. **Functional job** — Draft the language the user can use when they raise a finding with their bank.
4. **Emotional job** — Stop feeling that the bank has more information about the user's money than the user does.
5. **Social job** — Walk into a bank branch with a printed findings report rather than relying on a phone call to a call centre.

## Success Metrics

- **Findings per statement** — median number of distinct findings surfaced per uploaded statement. A high count means the engine is doing real work; a low count means the input is being skimmed.
- **User-confirmed finding rate** — share of findings the user confirms as legitimate after reading the report. A persistently low rate means the engine is flagging too aggressively.
- **Dispute letter sent** — share of users who edit and send a draft dispute letter after seeing a finding, since the letter is what closes the loop with the bank.
- **Bank-side resolution rate** — share of disputed findings the user reports as resolved by the bank, tracked at the level of findings rather than users.
- **Time to report** — median minutes from statement upload to findings report. A slow advocate loses the user before the value is delivered.
- **Recurring-fee detection accuracy** — share of recurring fees the engine flags that the user confirms as recurring, which is the headline accuracy number for the product.

## Pricing & Monetization

The post names no price, no tier and no business model; it is a one-line ProblemHunt problem statement from Russia. The architecture forces a particular cost shape nonetheless: per-statement parsing scales with uploads, per-finding dispute-letter generation scales with engagement, and storage of encrypted statement copies is small but persistent. Any paid tier would therefore have to be bounded by the number of statements analysed per month or by a flat subscription for users who upload regularly, not by a per-finding fee, because charging per finding creates a perverse incentive for the engine to flag more aggressively.

The post names no incumbent or comparison point, so the listing above is the existing options a Russian credit user might already be using and is not a market survey.

## Competitive Landscape

- Bank self-service portals and mobile apps — the user's own bank's view of their account, with no advocate role and no cross-bank comparison.
- Independent financial bloggers and influencers — sometimes surface fee patterns but do not read a user's real statement and do not produce a per-statement findings report.
- Tax-automation services that read bank statements — solve the categorisation problem for tax purposes but are not built to challenge the bank on the user's behalf.

The post names no competitor, so the landscape above is the existing tools a credit user might compare against and is not a market map.

## Risks & Open Questions

- [ ] Confirm the pdfplumber sidecar handles the published PDF statement formats of the major Russian banks before depending on it for anything beyond the largest issuers.
- [ ] Decide the tariff-reference policy: which version of a tariff schedule is the engine checking against, and how is the reference date shown on the report.
- [ ] Establish how Russian-jurisdiction storage is enforced in the architecture, not just in a privacy notice.
- [ ] Verify the dispute-letter wording stays inside the advocate role and does not drift into financial advice.
- [ ] Audit the findings engine for false positives on legitimate fees that simply look unusual to a user unfamiliar with their own tariff.
- [ ] Confirm the Open Banking sandbox coverage before relying on it for development, and gate any production connection behind explicit consent.
