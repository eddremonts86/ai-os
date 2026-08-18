---
id: "289"
slug: a-year-of-searching-for-an-affordable-solution-for-remo
title: A year of searching for an affordable solution for remote US business opening wi
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/business/xnzvy42z31-a-year-of-searching-for-an-affordable-solution"
category: business
date: "2025-10-29"
tags: [Business, Legal, Finance]
country: USA
tech: [Next.js 14, TypeScript, Postgres, Stripe Connect, dLocal (payment for non-US cards), DocuSign API, Clerky compliance workflow, Hetzner]
---
# A year of searching for an affordable solution for remote US business opening wi

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A non-US-resident founder goes from 'I want a US LLC' to 'I have an EIN, a US bank account, and a Stripe Atlas' in under two weeks, at one transparent price below the market floor for the same workflow.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Non-US-resident founder | Wants a US LLC for invoicing, Stripe, or fundraising; cannot or will not fly to the US. |
| Existing US formation service | Wants a non-resident arm without building ITIN/EIN/resident-agent integrations. |
| Foreign accountant advising overseas clients | Wants a white-label formation flow they can offer under their own brand. |

## Jobs To Be Done

1. **Functional job** — Open a US LLC, get an EIN, open a US bank, and stay compliant
2. **Emotional job** — Stop feeling that US business formation is reserved for people with US addresses and US lawyers.
3. **Social job** — Tell a US customer 'we are a Wyoming LLC' without flinching at the implicit cost of saying so.

## Success Metrics

- Time-to-EIN median ≤ 14 days from filing acceptance.
- US bank account activation rate ≥ 70% (vs ~30% for DIY non-resident applicants).
- First-year compliance on-time rate ≥ 90% (annual report, franchise tax, registered-agent renewal).
- Customer-reported savings vs attorney-led formation ≥ $800 median.

## Pricing & Monetization

Flat $399 formation bundle: state filing + registered agent (year 1) + EIN + operating agreement + bank-account setup guidance. Year-2 renewal: $199/year (registered agent + annual report + franchise tax). Premium tier ($799): adds Stripe Atlas, US phone number, US address, and a 1-hour attorney consult.

## Competitive Landscape

- doola, Firstbase, Stripe Atlas — strong Stripe integrations, but price tiers exclude the ITIN-less EIN path or push premium tiers that exceed $500+.
- Clerky / LegalZoom — premium, attorney-led, US-resident-default; price floor $500+, not non-resident-specialised.
- DIY via IRS instructions + Wyoming SoS — possible but the EIN-without-SSN path is poorly documented; users abandon at the fax/mail step.

## Risks & Open Questions

- [ ] IRS EIN-application backlog — phone wait times regularly exceed 4 hours; the fax path can take 4–6 weeks. Mitigation: explicit timeline disclosure, parallel track via accountant EIN.
- [ ] Bank-account partner changes policy — a Mercury/Brex program can tighten non-resident onboarding overnight. Mitigation: two bank-partner integrations in v1; switch routing is automated.
- [ ] State law changes — Wyoming and Delaware adjust annual fees and franchise tax yearly. Mitigation: state-fee table is a versioned config; CI test against SoS site on every release.

---

_Source:_ [manual](https://problemhunt.pro/en/business/xnzvy42z31-a-year-of-searching-for-an-affordable-solution) · **Category:** business · **Tags:** Business, Legal, Finance
