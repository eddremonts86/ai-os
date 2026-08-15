---
id: "572"
slug: if-your-saas-resells-model-output-your-margin-is-decide
title: Billing-dimension audit — the unit economics trap when reselling model output
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vobkje/if_your_saas_resells_model_output_your_margin_is/"
  captured: "2026-08-14"
category: finops
date: "2026-08-14"
tags: [ai, saas, pricing, unit-economics, finops]
scores:
  money: 6
  learn: 6
  fun: 5
---
# Billing-dimension audit — the unit economics trap when reselling model output

## Problem

Sharing a mistake because I think it's structural rather than a me problem, and I haven't seen it in any pricing advice here. We run an AI image and video product for ecommerce. When we added video, I costed it the obvious way: read the provider's pricing, work out cost per second of output, add margin, charge per second. Everything I could find described the model in per-second terms. On paper, roughly 70% margin. Then I read line items on the provider's actual billing dashboard for real jobs, instead of trusting the docs. They meter by output pixel area, not duration. 720p was really about 50%. 1080p was negative on every render, and 1080p was the tier we were actively upselling. Errored generations billed and returned nothing to the user. That ran three weeks. Nothing in our code was wrong, the number was right, the axis was wrong, and our cheap tier reconciled fine the whole time, which is why nothing looked broken. The general version: any time you resell compute you don't own, the headline price tells you very little. What decides your margin is the dimension being metered. Per token, per call, per second, per pixel area, per megapixel-second, per minute of audio, per page, per GB out. Two providers can quote similar-looking numbers and bill an order of magnitude apart, and your own pricing has to sit on a dimension you can predict. The check takes about twenty minutes now. Write the billing dimension out in words next to the number, not just the number. Run one real job on your most expensive tier and reconcile it against that specific invoice line. Find out whether failures bill, because they usually do and it's usually undocumented. Then work out cost per accepted output rather than per generation, since a 25% discard rate means your real unit cost is four times what you think. And redo the whole thing whenever you add a model, a resolution or a duration option, because any of those can move the axis under you. The second-order lesson is the one I actually think about. A margin dashboard computed from your own assumptions can only ever agree with your assumptions. If nothing in your stack reconciles against what the provider says it charged, you don't have cost visibility, you have a well-formatted opinion. Would like to know how common this is. If you charge for AI output, did you verify against a real invoice or from the docs? I suspect docs is the honest answer for most people, and shipping rates and payment processing feel like they have the same shape of trap. submitted by /u/DryProgress9179 [link] [comments]

---

## Objective

Catch the failure mode the author discovered: when reselling AI model output, the dimension the provider meters (per second, per pixel, per token, per call) decides margin, not the headline price. The tool reconciles provider invoices against the founder's own pricing model so the wrong axis is caught in 20 minutes, not 3 weeks.

## Target Users

Founders and finance/ops leads at SaaS companies that resell AI image, video, audio, or text generation. The author's own case (AI image + video for ecommerce) is the archetype; the lesson generalises to any per-output reselling.

## MVP Scope

A reconciliation CLI: enter your provider's pricing page numbers + the real billing dimension + your customer-facing pricing, get back cost-per-accepted-output on your most expensive tier. Optional: a connector that pulls real invoice line items so the check is automated.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

Provider pricing pages are sometimes misleading; the reconciliation has to be run against real invoice data, not docs. The author's specific failure (pixel-area vs duration) generalises to other dimensions but each new model/resolution/duration option re-opens the trap.
