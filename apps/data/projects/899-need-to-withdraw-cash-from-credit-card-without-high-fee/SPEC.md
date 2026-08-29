---
id: "899"
slug: need-to-withdraw-cash-from-credit-card-without-high-fee
title: Need to withdraw cash from credit card without high fees
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/finance/6obgkxdbi1-need-to-withdraw-cash-from-credit-card-w"
  captured: "2025-10-10"
category: finance
date: "2025-10-10"
tags: [Finance]
country: Portugal
tech: [Next.js, TypeScript, Node.js API, PostgreSQL, a curated fee-database of Portuguese ATMs and bank cash-advance policies, Plaid / TrueLayer aggregator where available, no transactional money handling in v1]
---
# Need to withdraw cash from credit card without high fees

## Problem

The source post is unusually thin — only the title ("Need to withdraw cash from credit card without high fees"), category (Finance), and country (Portugal) are captured. The title does, however, state the problem precisely: a Portugal-based cardholder wants to take cash out against a credit card without paying the elevated fees that usually accompany a cash advance. In Portugal, the documented fee structure for foreign cards (and credit cards specifically) at most ATMs includes the issuer's cash-advance fee (often 3–5% with a floor) plus interest charged from the day of withdrawal with no grace period, plus an ATM-owner fee for non-Multibanco machines; this is what "high fees" in the title is pointing at. The likely pain is that the cardholder either does not know which combination (card type × ATM network × day of week) gives them the lowest fee, or has no way to compare the options before committing at the ATM.

## Objective

Ship a Portugal-specific lookup tool that, given the user's card network (Visa / Mastercard / Amex), card issuer, and the city or district they are in, returns the lowest-fee options for a cash withdrawal against that card — broken down by ATM network (Multibanco first, then partner-bank ATMs), the issuer-side cash-advance fee, and the interest-from-day-one cost — so the user can pick a route that costs them the least before they walk up to the ATM, and can compare a credit-card cash advance against a debit-card-with-no-fee alternative from the same wallet.

## Target Users

- Primary: Portugal-based residents and visitors holding a credit card who need cash occasionally (small businesses paying suppliers who only take cash, market-stall shopping, tips) and want to know the cheapest way to get it without paying the headline 3–5% cash-advance fee.
- Secondary: Expats in Portugal whose home-country card carries a foreign-transaction fee on top of the cash-advance fee, and who would benefit from a single view that shows whether using a no-FX-fee card at a Multibanco ATM is cheaper than using a fee-free debit card at the same ATM.
- Tertiary: Travellers passing through Portugal on layover or short stays who want to take out the smallest necessary amount at the lowest combined fee and are deciding whether the credit-card route is even worth comparing.

## MVP Scope

- A curated fee database covering the major Portuguese banks (CGD, BPI, Millennium BCP, Novo Banco, Santander Totta, Activobank, etc.) plus the main Multibanco ATM network, with the issuer-side cash-advance fee, the foreign-transaction fee, and the daily interest rate for cash advances from the day of withdrawal.
- A single-page lookup: user enters card network, card issuer (free-text autocomplete), and city; the tool returns a ranked list of ATM networks and bank branches with the lowest effective cost for a chosen withdrawal amount (€100, €200, €500).
- Side-by-side comparison: credit-card cash advance vs debit card vs Revolut / Wise / Starling-style multi-currency card at the same ATM, with the effective cost for the user's chosen amount.
- A plain-English explanation of why the cash advance costs what it costs, so the user understands that "no grace period" is a separate line from "ATM fee".
- No transactional money handling in v1 — the tool is a lookup, not a payment app; users still go to the ATM or use their existing banking app.
- Static hosting on a small Next.js + Postgres stack; no PII is stored beyond the optional email for a fee-update notification.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Lookup-only: no transactional money handling in v1, no card data ever entered, no PCI-DSS scope.
- Fee database must be auditable: every entry has a source link (issuer's published fee schedule, Multibanco's published surcharge, regulator disclosure) and a last-verified date so a stale entry cannot quietly mislead.
- No claim of "fee-free" without an authoritative source. The market has several fee-free debit-card products (Revolut, Starling, Wise) but each has fine-print conditions; the copy must surface the conditions rather than promise what the user will not get.
- Portugal-specific in v1: cross-border expansion to Spain, France, or Brazil would require a separate fee database and is not in scope.
- No investment, tax, or financial-advice claims. The tool is a fee lookup, not advice; the copy must enforce that boundary on every result screen.
