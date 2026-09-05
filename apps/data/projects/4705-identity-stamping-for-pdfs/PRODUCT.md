# PRODUCT.md — Identity Stamping for PDFs

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I built Ordius to solve a problem I couldn&#x27;t find a clean solution for: establishing a deterministic identity stamp for a PDF document while preserving the document itself.<p>Ordius creates an ID for a PDF and embeds that identity within the document so it can be verified later.
The important constraints for me were that Ordius should not normalize or reconstruct the document, modify its original payload bytes, strip metadata or maintain metadata exclusion logic, require a detached identity file, depend on PKI, and retain the submitted document.<p>I like to think the byte dependency paradox has been resolved by this build, and the result is a small API with Generate and Verify operations.
It&#x27;s live here: https:&#x2F;&#x2F;ordius.net&#x2F;home&#x2F;<p>There are still some questions I am trying to answer: Do cloud storage applications preserve the Ordius Block when a document is uploaded and downloaded? Is the Ordius Block preserved when a stamped PDF is sent as an email attachment? What I have tested: sending an Ordius stamped document as an attachment in Gmail passes with no problems.<p>I&#x27;d like to hear from people who work with documents, PDFs, signing, archives, or document integrity. I&#x27;m particularly interested to hear about unnecessary friction in the approach and situations where it doesn&#x27;t make sense.

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

| Stakeholder | Why they care |
|---|---|
| Early adopters | _[What pain they feel, and how this solves it]_ |
| Founders | _[What pain they feel, and how this solves it]_ |
| SMEs | _[What pain they feel, and how this solves it]_ |

## Jobs To Be Done

1. **Functional job** — _[What the user is trying to accomplish]_
2. **Emotional job** — _[How they want to feel]_
3. **Social job** — _[How others perceive them using this]_

## Success Metrics (North Star)

- **Activation:** _[% of signups who complete X within Y days]_
- **Retention:** _[DAU/MAU, week-1 retention, cohort curves]_
- **Revenue:** _[MRR target, ARPU, LTV/CAC]_

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_TODO:_ list 2-3 alternatives + differentiation.

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49547137) · **Category:** ask-hn · **Tags:** Ask HN,Problem
