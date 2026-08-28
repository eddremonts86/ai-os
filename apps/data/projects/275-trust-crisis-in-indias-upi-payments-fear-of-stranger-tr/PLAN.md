---
id: "275"
slug: trust-crisis-in-indias-upi-payments-fear-of-stranger-tr
title: "Trust crisis in India's UPI payments: fear of stranger transfers hurts business"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/finance/jrrxhgsoh1-trust-crisis-in-indias-upi-payments-fear"
category: finance
date: "2025-12-07"
tags: [Business, Other]
country: India
tech: [Next.js 14, TypeScript, PostgreSQL, UPI Deep Link API, Razorpay, OTP via SMS Gateway, BharatPe-style merchant directory]
---
# Trust crisis in India's UPI payments: fear of stranger transfers hurts business

## Tech Stack

Next.js 14 (TypeScript) for the web app. PostgreSQL for merchants, transactions, verifications, disputes. UPI Deep Link API for payment-request generation. Razorpay as a payment-gateway fallback. SMS Gateway for OTP verification. Immutable transaction-log export via signed JSON or PDF.

## Architecture

Three services: a Next.js merchant dashboard, a UPI deep-link service that generates payer-verification flows within RBI limits, and a dispute-form service that produces bank-ready submission packages.

## Milestones

M1: UPI deep-link payment-request flow with OTP verification. M2: Immutable transaction-log export. M3: Structured dispute form with bank-ready submission package. M4: Razorpay fallback for non-UPI. M5: Merchant-side onboarding pilot in 3 Indian cities.

## Risks

RBI compliance is existential — over-collecting data is a regulatory risk. Bank dispute processes are slow and uneven. SMS Gateway delivery in India can be unreliable for OTP.
