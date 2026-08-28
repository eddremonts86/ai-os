---
id: "684"
slug: traffic-isnt-converting-tried-seo-geo-spent-37-on-reddi
title: "traffic isn’t converting, tried SEO / GEO spent $37 on reddit ads - pls roast and advise"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vprg69/traffic_isnt_converting_tried_seo_geo_spent_37_on/"
category: saas
date: "2026-08-16"
tags: [saas, fintech, growth, conversion]
tech: [Next.js, TypeScript, Playwright, SQLite, Drizzle ORM]
---
# traffic isn't converting, tried SEO / GEO spent $37 on reddit ads - pls roast and advise

## Problem

The poster runs yieldtheory.app, a product that surfaces investment research to help users grow their money. They have tried SEO and GEO, spent $37 on Reddit ads, and the landing page is described as "not vibe coded much" and the design as "top notch". The bottleneck is conversion: clicks arrive but users do not convert. They are considering switching to UGC content but want to know what is preventing conversion on the offer / page first. The implicit problem: a niche investment-research product with low traffic-to-signup conversion, in a category (financial advice) where trust and clarity are the binding constraints, and where the founder is uncertain whether the page is the bottleneck or the offer is.

## Objective

Define a trust-and-clarity audit workflow for a financial-research landing page: who the offer is for, what it replaces, what evidence backs it, what "done" looks like for the user, and what the regulatory disclosures are. For a regulated category like investment research, the conversion bottleneck is rarely the design — it is the absence of trust signals and the absence of a clear audience.

## Target Users

- **Primary:** solo founders in regulated-adjacent categories (investment research, financial planning, health, legal) who are seeing traffic but no sign-ups.
- **Secondary:** indie hackers shipping niche SaaS in categories where trust and clarity dominate the conversion decision.
- **Tertiary:** early-stage growth marketers at sub-50-person fintech startups.

## MVP Scope

- A trust-signal audit (testimonials, evidence of returns, regulatory disclosures, founder credibility, third-party validation).
- An audience-clarity audit (who is the page for, what is it replacing, what does "done" look like).
- An offer-fit diagnostic (does the offer match the audience the traffic source brings).
- A scored, prioritised report with the highest-leverage fix called out first.
- Excluded in v1: paid-traffic audits, attribution modeling, A/B testing infrastructure, regulatory compliance reviews.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single audit-report surface — a sidebar with the trust and clarity dimensions, a centre pane with the scored findings, a right-hand panel with the top-3 fixes. No marketing-site chrome; the product is the audit.

## Constraints

- The audit must be honest about the category: in financial research, design polish alone does not move conversion.
- Every finding must cite the specific element on the page or in the offer it refers to.
- The MVP must work for a solo founder with zero analytics tooling beyond what is in the page source.
