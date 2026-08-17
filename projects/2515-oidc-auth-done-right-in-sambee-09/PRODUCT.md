---
id: "2515"
slug: oidc-auth-done-right-in-sambee-09
title: OIDC auth done right in Sambee 0.9?
status: draft
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49323492"
category: show-hn
date: "2026-08-16"
tags: [Show HN, Product, Problem]
---
# OIDC auth done right in Sambee 0.9?

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Sambee turns your storage into a modern workspace by presenting SMB and local files in your browser.In the latest version 0.9 we added single sign-on via OpenID Connect. Given that configuring OIDC auth is not trivial, we tested and refined a lot until we got an implementation that seemed right to us. I've listed some key insights below. What do you think we got right and what should be changed?- Treat the IdP as source of truth- Configuration: focus on UX and guide the admin through the setup process.- Prevent lock-out: ensure the admin making the configuration will still have admin rights once OIDC is enabled before activating OIDC login.- Auto-provision OIDC users. Don't require the admin to create user accounts in your product. They already maintain users on their OIDC's identity server.- Delegate your product's permission management to the IdP. Map one OIDC group to your product's admin role, another to your product's user role.

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [ProblemHunt](https://news.ycombinator.com/item?id=49323492) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
