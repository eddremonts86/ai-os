---
id: "2017"
slug: is-this-aws-risp-simulation-engine-interesting-valuable
title: Is this AWS RI/SP simulation engine interesting / valuable?
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49374412"
category: ask-hn
date: "2026-08-20"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Is this AWS RI/SP simulation engine interesting / valuable?

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ TLDR; This AWS RI/SP tool we built might have unique features that are important especially for companies running large, high-variability workloads with high coverage targets. We want feedback on how true that is and whether we should open this up to others, possibly even for free or as OSS.Setup: We're a small cloud cost consultancy, but not a tools vendor. We do build a lot of internal tooling for our own use. We serve companies spending 7- to 9-figures (USD) annually.One of the internal tools we built over the past several years is a simulation engine for RIs/SPs that can do a number of things, some of which we believe might be one-of-a-kind in the space today and could be valuable to others.1.) Visualize the entire commitment savings/discount curve for any commitment type (any RI, any SP, of any flavor), showing the exact savings achieved and the marginal discount rate at every level of commitment. This unlocks what we feel is the best purchasing strategy: "buy SP dollars or RI units until the next penny/instance-hour yields less than a 10% discount," rather than taking the all-or-nothing recommendation with an averaged discount (e.g., "Cover everything by buying a $10/hr SP at a 5% overall discount").2.) Such savings/discount curves can also be stacked to show how changes in discount rate unlock more coverage space. For example, deciding to purchase some or all of a commitment with upfront dollars changes the discount rate, which is not just an ROI-on-cash decision, but also changes the shape of the curve to allow more infrastructure to be covered profitably at the same risk level.3.) Build "what-if" scenarios that stack upcoming planned purchases, add or remove covered usage, and expire unwanted commitments to see how savings change under various assumptions. Essentially, we take the historical usage for the desired look-back period, modify it according to our whims for the forward projection, and apply any of the current or planned commitments that we want. We run multiple such scenarios simultaneously if needed to suss out risks.4.) See how savings can be improved by purchasing commitments that would be applied before your existing SPs. If your AWS console or tool-of-choice currently shows you having only Compute SP purchase possibilities, and low or no RI and EC2 Instance SP possibilities, you're definitely in that boat. AWS doesn't show you how SP discounts that are currently eating the coverage space could instead be pushed out along the discount curve, which would unlock purchasing specific targeted RIs or EC2 Instance SPs that would get applied first and at higher discount levels.5.) It can be driven by LLMs to narrow in on strategies that aren't visible without simulating the possibility space. Importantly, the data produced are compact, legible, and easily summarized.Adding a couple of images in comment with explainers to help communicate some of the above.Questions:1.) Are these features truly unique? Or is there some existing tool (whether paid or OSS) essentially doing the same thing?2.) (If answer to #1 is "yes, unique") Are these features enough of a value-add that they would be worth the effort to bring into your own practice, or are they only marginally interesting (or, perhaps, completely uninteresting)?3.) Do you think the simulation engine could be used to solve other related problems that I'm not specifically suggesting here and that would be more valuable? (We have a lot of ideas... strategy back-testing, M&A merged billing account scenarios, etc.)

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49374412) · **Category:** ask-hn · **Tags:** Ask HN,Problem
