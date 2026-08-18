---
id: "275"
slug: trust-crisis-in-indias-upi-payments-fear-of-stranger-tr
title: "Trust crisis in India's UPI payments: fear of stranger transfers hurts business"
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/finance/jrrxhgsoh1-trust-crisis-in-indias-upi-payments-fear"
category: finance
date: "2025-12-07"
tags: [Business, Other]
country: India
tech: [Next.js 14, TypeScript, PostgreSQL, UPI Deep Link API, Razorpay, OTP via SMS Gateway, BharatPe-style merchant directory]
---
# Trust crisis in India's UPI payments: fear of stranger transfers hurts business

## Problem

In India, merchants and small businesses who receive UPI payments from strangers (new customers, one-off buyers) experience a trust crisis: a customer who sends money to the wrong UPI ID, a fraudster who initiates a chargeback, or a genuine dispute that the merchant has no way to verify or contest. The fear of these stranger transfers hurts business, especially for small merchants.

## Objective

Ship a merchant-side trust layer for UPI payments that verifies the payer's identity at payment time (within RBI-compliant limits), records an immutable transaction reference, and provides a structured dispute path so merchants can confidently accept UPI from strangers.

## Target Users

Indian small merchants accepting UPI from new or one-off customers. Indian SMBs selling on Instagram, Meesho, or own websites. Indian freelancers receiving UPI from new clients.

## MVP Scope

Web app with merchant-side payment-request flow (generate UPI deep link with payer-verification step), payer-verification via OTP or UPI PIN within RBI limits, immutable transaction-log export, and structured dispute form. Razorpay as a fallback for non-UPI payments.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/finance/jrrxhgsoh1-trust-crisis-in-indias-upi-payment` follows the constraints in `275-.../SPEC.md` and the chosen stack (Next.js 14, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in India.

For India, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Must comply with RBI guidelines on UPI payer verification (cannot store full UPI PIN, must use OTP or biometric within app). Indian DPDP Act compliance. No false claims about fraud prevention — the product is a trust layer, not a guarantee.
