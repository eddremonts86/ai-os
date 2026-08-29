---
id: "853"
slug: problem-of-access-to-loans-for-immigrants-in-the-eu
title: Problem of access to loans for immigrants in the EU
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/lhvgiz7hs1-problem-of-access-to-loans-for-immigrant"
category: other
date: "2025-11-06"
tags: [Immigration, Finance, Legal, Other]
country: Portugal
tech: [Astro, TypeScript, Go (chi), PostgreSQL, Pinecone (vector index), Anthropic Claude API, Plaid EU (sandbox), Coolify, Docker]
---
# Problem of access to loans for immigrants in the EU

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

An eligibility-readiness tool for immigrants resident in the EU, focused on Portugal, that turns a profile into a personalised list of which lending categories the applicant is most likely to be eligible for now, which documents each category will require, and which gaps in the profile will most likely cause a refusal. Each readout is generated from a versioned rule library an operator maintains, so what the applicant sees is auditable and consistent rather than invented on the fly.

The product is deliberately scoped. It does not lend, it does not broker loans, and it does not replace a regulated financial advisor. What it does is convert a frustrating walk-into-a-branch refusal into a structured, document-ready application — and into a sequenced gap-closure plan the applicant can act on with a bank, an NGO advisor, or a tax accountant.

**One-liner:** An eligibility-readiness tool for immigrants resident in Portugal that turns their profile into a personalised list of which EU lending categories they are most likely eligible for, the documents each will require, and a sequenced gap-closure plan to close the gaps.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Immigrants resident in Portugal | Need to know which loan categories are realistic before walking into a branch and risking a hard credit-file inquiry. |
| Recent arrivals with under two years of Portuguese tax history | Have the steepest documentation gap and want a concrete plan to build local credit and re-apply. |
| Refugees and humanitarian-status residents | Have a NIF and residency permit but no local credit history, and need to know which categories consider their situation. |
| Self-employed immigrants and micro-entrepreneurs | Income proof follows Portuguese IRS regimes rather than a payslip, and retail underwriters often decline without explanation. |
| Migrant-support NGOs and immigrant-advocacy groups | Repeat the same guidance from memory and want a maintained, versioned tool to point residents to. |
| Portuguese bank frontline staff | Want a structured intake form they can hand to an immigrant applicant instead of improvising the conversation. |

## Jobs To Be Done

1. **Functional job** — Tell me, for my specific profile and the loan category I am interested in, whether I am likely eligible now and which documents the lender will ask for.
2. **Functional job** — Tell me which gaps in my profile are most likely to cause a refusal, in priority order.
3. **Functional job** — Give me a sequenced plan to close those gaps, with the action and the expected effect.
4. **Functional job** — Print or export the readout so I can bring it to a branch conversation or to an NGO advisor.
5. **Emotional job** — Stop walking into a branch and being refused with no clear reason.
6. **Social job** — Be able to talk to my spouse, family or employer about a loan decision with a written summary in hand.

## Success Metrics

- **Readout completion** — share of generated readouts the user opens, prints or exports, indicating the output was actionable rather than ignored.
- **Return rate** — share of users who generate a second readout after closing some gaps, which is the proxy for whether the gap-closure plan was trusted.
- **Rule coverage** — share of the most common residency-permit types and income-source combinations in Portugal that have at least one rule record.
- **Rule version currency** — median age of rule records in the library, since stale rules are the failure mode this product exists to prevent.
- **Operator edit load** — rule records added or updated per month, because the product is only as good as the maintained library.
- **Disclaimer acknowledgement** — share of readouts for which the non-regulated-advice disclaimer was visibly rendered.

## Pricing & Monetization

The capture names no price, no tier and no business model; the only ground truth available is the title, the country and the category tags. What the architecture does fix is a cost shape: every useful output references one or more rule records and one vector-retrieval call, so the marginal cost scales with the number of readouts generated rather than with the number of users. A plausible paid shape is therefore per-applicant subscription for unlimited readouts against a maintained rule library, or a per-seat licence for NGO advisors and bank frontline staff; the actual price is left as an open question because the source gives no number to quote.

## Competitive Landscape

- **Walk-in branch consultations** — the incumbent. Branch staff answer the same question across the desk for each applicant, with no structured intake form and no audit trail. The product competes on structured preparation, not on replacing the conversation.
- **Generic LLM assistants answering the same question** — fast and free, but with no versioned rule library and no way for an applicant to know which rule was applied. The product competes on auditability and on the gap-closure plan.
- **Migrant-support NGO guidance** — written materials maintained by advocacy organisations, generally broad and country-level. The product competes on personalised readout and on Portugal-specific depth.
- **Personal-finance blogs and YouTube channels** — abundant and accessible, but generic and unregulated. The product competes on personalisation and on the disclaimer that the advice is informational rather than regulated.

The capture names no competitor by name, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm with a Portuguese consumer-credit lawyer that the disclaimer language is sufficient for an eligibility-readiness product; the capture gives no legal sign-off.
- [ ] Establish which Portuguese lending categories and which residency-permit types the rule library must cover on day one, given the capture names no specific combination.
- [ ] Decide whether any credit-bureau integration is in scope at MVP, and if so under which Portuguese consent regime; default must be no-bureau-lookup.
- [ ] Set the GDPR-compliant retention policy for intake profile data, including residency-permit scans and NIF numbers; the capture gives no data-retention rule.
- [ ] Determine who maintains the Portuguese rule library long-term — the operator, a partner NGO, or a network of bank frontline staff — because the product is only as good as the library.
- [ ] Confirm whether the MVP extends to other EU member states at launch or stays Portugal-only with EU expansion as a stated later milestone.
