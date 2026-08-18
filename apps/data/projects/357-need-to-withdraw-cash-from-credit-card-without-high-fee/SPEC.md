---
id: "357"
slug: need-to-withdraw-cash-from-credit-card-without-high-fee
title: Need to withdraw cash from credit card without high fees
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/finance/tp6dgyysf1-need-to-withdraw-cash-from-credit-card-safe"
category: finance
date: "2025-10-10"
tags: [Finance]
country: Portugal
---
# Need to withdraw cash from credit card without high fees

## Problem

In Portugal, holders of a credit card who need cash — not a card payment — face an immediate fee wall. The standard behaviour of European issuers is to charge a cash advance fee (often a flat percentage of the withdrawal or a flat minimum, whichever is higher) plus a higher interest rate that starts accruing from the day of withdrawal, with no grace period. The source post on ProblemHunt describes the situation as needing a way to take cash off a credit card without these high fees. The underlying job is not glamorous: it is the moment a consumer has cash on the card, not on the bank account, and the cost of moving that money is uncomfortably high. The post does not name a specific bank, a specific fee number, or a specific withdrawal size — it identifies only the gap and the urgency of the user feeling it.

## Objective

Provide a path for a Portuguese credit card holder to obtain cash from the card's available balance without paying the standard cash-advance fee and without the higher cash-advance interest rate. The MVP should produce a single use case end to end: a user with a credit card shows their need for cash, the system explains the available routes (issuer-specific cash-with-deposit, balance-transfer, instalment plan, or a partner ATM that absorbs the fee), the user picks one, and the money lands in their bank account with a fee the user accepted in advance. The objective is not to remove the issuer's fee altogether — it is to give the user a menu that includes at least one route that is cheaper than the default cash advance.

## Target Users

- **Portuguese consumer who has cash on a credit card and needs cash on a bank account**, typically short-term, often for a one-off expense (rent gap, medical bill, vehicle repair).
- **Freelancers and self-employed workers in Portugal** whose income timing does not match their expense timing and who use a credit card as a working-capital stopgap.
- **Cardholders who already have a credit card with a small credit limit** and cannot afford the cash-advance fee on top of the amount they need to withdraw.
- **People in the days before payday** who have already maxed their debit account but have unused credit card balance.

## MVP Scope

- A Portugal-only intake that asks the user which issuer they hold (a short list of Portuguese banks), the amount they want to withdraw, and the deadline.
- A route-explainer that, for the selected issuer and amount, lists the available routes and the effective total cost of each: standard cash advance, instalment plan, balance transfer to a partner bank account, or a partner ATM that waives the fee in exchange for a small fixed markup.
- A booking step that prepares the route (e.g., opens the issuer's instalment portal flow, or generates a partner-ATM code) and tells the user the exact net amount and the exact fee they will pay.
- A settlement confirmation that records the chosen route, the fee that was actually paid, and the date the cash landed in the user's account.
- A small audit log so the user can re-open the route and see what they did last time.

## Constraints

- **Regulatory**: any product that touches lending in Portugal is under Banco de Portugal supervision; the MVP must not be a lender itself but a routing layer that explains the user's existing options.
- **Truthful cost**: the route-explainer must show the *total* cost effective yearly (including any interest and any flat fee), not just the headline fee; the user must consent to the exact figure before the cash moves.
- **Bank partnership**: the partner-ATM route requires a real agreement with at least one Portuguese ATM network; until that agreement exists, the MVP must say "no route available" rather than invent one.
- **Cash-advance interest**: the consumer-credit disclosure rules in Portugal require specific wording about interest from the day of withdrawal; the MVP must surface that wording, not paraphrase it.
- **Single-country**: the MVP is Portugal-only; cross-border (e.g., a Spanish cardholder in Portugal) is out of scope for the first release.
