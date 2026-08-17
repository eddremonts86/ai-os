---
id: "603"
slug: startup-registration
title: Startup registration
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vow1pl/startup_registration/"
category: saas
date: "2026-08-15"
tags: [saas, legal, compliance, b2b]
tech: [Next.js, TypeScript, Supabase, Stripe]
---
# Startup registration (EU citizen, multiple ideas, subscription-based services)

## Problem

An EU citizen (French) residing outside of Europe (Saudi Arabia) is building a platform that could provide subscription-based services. They have multiple ideas; the target user is unspecified but the poster is asking about startup registration options and the regulatory considerations for an EU citizen building a subscription SaaS while residing abroad. The implicit product: a consultancy or guide for non-resident EU founders on startup registration, tax, and compliance for a subscription-based SaaS.

## Objective

Define the MVP scope for a guide / consultancy product that helps non-resident EU founders pick the right registration (country, legal form), set up tax (VAT MOSS, OSS), and stay compliant for a subscription-based SaaS.

## Target Users

- **Primary:** EU citizens residing outside the EU who want to launch a subscription SaaS.
- **Secondary:** EU citizens who have moved outside the EU and want to keep their company.
- **Tertiary:** non-EU founders who want an EU entity for market access.

## MVP Scope

- A structured decision tree: country + legal form + tax registration + payment-rail choice for a subscription SaaS.
- Templates: incorporation documents, VAT registration, OSS / MOSS forms.
- A directory of incorporation agents, accountants, and payment-rail partners in the relevant EU jurisdictions.
- A free tier: the decision tree + the templates. Pro at $99: 1:1 review of the founder's specific situation + a partner recommendation.
- Excluded in v1: ongoing tax filing, in-house legal advice, cross-border VAT audit.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single decision-tree surface — the country picker at the top, the legal-form picker below, the tax registration panel, the payment-rail panel. No marketing-site chrome; the product is the tree.

## Constraints

- The product is a guide, not a legal adviser; explicit "not legal advice" disclaimer is mandatory.
- The templates must be jurisdiction-current; a quarterly review of EU regulatory changes is mandatory.
- The 1:1 review tier is high-touch and does not scale; the Pro tier is capped.
