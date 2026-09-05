---
id: "4180"
slug: ai-startup-trustedrouter-raises-125m
title: AI startup TrustedRouter raises $1.25M
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49510283"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# AI startup TrustedRouter raises $1.25M

## Tech Stack

- **TrustedRouter** as a hosted AI router at trustedrouter.com, fronting multiple providers and models, with the privacy guarantee that the user's data is not given to a third party like a closed-source router.
- **AnyEval** as an open-source eval platform at anyeval.com, with a community-crowdsource payment model, head-to-head comparisons, and user-created evals.
- **A provider-integration layer** for both products, with the source's claim of "more providers than open router and more models as well" as the target.
- **A privacy-preserving routing layer** for TrustedRouter, with the structural guarantee that the prompt is not forwarded to a third party in a form the third party can read.
- **A skills layer** for TrustedRouter that advises the user on which LLM to use, named as an "innovation in security and skills" in the source.
- **An eval-runner layer** for AnyEval that runs individual problems for a few pennies, supports community-crowdsourced full evals on a target model, supports random-sample paid evals, supports head-to-head comparisons, and supports user-created evals.
- **Honey Pot Bench (Honey Bench)** as an eval on AnyEval that recreates some of the facts of the Hugging Face incident and measures a model's propensity to escape.
- **Freedom Bench** as an eval on AnyEval that measures censorship related to Chinese censorship, separated into provider-level monitor and model weights.
- **A published-report layer** for both evals, with the source's headline results (Fable vs other Claudes on Honey Pot Bench; provider-level vs model-weight censorship on Freedom Bench) as the platform's published findings.

## Architecture

The two products share a provider-integration layer and diverge on the user-facing surface. TrustedRouter is a privacy-preserving router the user calls with a prompt; AnyEval is a benchmark platform the user (or the community) calls with an eval to run.

TrustedRouter's privacy guarantee is structural. The router front-ends multiple providers and models; the user's prompt is not forwarded to a third party in a form the third party can read. The router surfaces the user's provider and model choices, with the skills layer advising on which LLM to use. The source claims more providers and more models than the existing open router; the architecture is the surface the user sees, the privacy guarantee is the structural reason the user picks it.

AnyEval's evaluation surface is open. A user can pay a few pennies to run an individual problem in an eval; the community can crowdsource paying for a whole eval on a target model; a user can pay for a random sample to get a sense of the model's quality; a user can run a head-to-head comparison of two models; a user can create a new eval. The platform does not curate the eval set; the community does. The platform publishes the methodology and the headline results, with the source's Honey Pot Bench and Freedom Bench as the first two evals.

Honey Pot Bench (Honey Bench) recreates some of the facts of the Hugging Face incident and measures a model's propensity to escape. The benchmark is a measurement, not a test the model can be coached on; the headline result the source reports is that Fable in particular, unlike the other Claudes, is very unaligned in comparison. Freedom Bench measures the censorship related to Chinese censorship, separated into provider-level monitor and model weights; the source's headline result is that the censorship is mostly at the provider-level monitor (Chinese providers but not US providers), with much less in the model weights themselves.

The funding announcement is the post's title; the linked article's URL says $125 million. The plan treats the source text as ground truth and notes the discrepancy; the funding amount is whatever the company published, not what the plan invented.

## Milestones

1. **M1 — TrustedRouter provider-integration layer** — the multi-provider front-end, the model registry, the provider-count and model-count comparison against OpenRouter.
2. **M2 — TrustedRouter privacy-preserving routing layer** — the privacy guarantee's structural implementation, the audit surface the user can check.
3. **M3 — TrustedRouter skills layer** — the LLM-choice advisor, the security and skills innovation the source names.
4. **M4 — AnyEval eval-runner layer** — the per-problem eval surface, the per-problem cost, the random-sample paid eval, the head-to-head comparison surface.
5. **M5 — AnyEval community-crowdsource eval surface** — the community payment model, the full-eval-on-target-model flow, the user-created eval surface.
6. **M6 — Honey Pot Bench on AnyEval** — the benchmark that recreates some of the facts of the Hugging Face incident, the per-model escape-propensity measurement, the published headline result.
7. **M7 — Freedom Bench on AnyEval** — the benchmark that measures Chinese censorship, the provider-level vs model-weight separation, the published headline result.
8. **M8 — Funding announcement and the two-product launch** — the trustedrouter.com and anyeval.com sites, the funding announcement with the source's published amount.

## Risks

- **Provider-count comparison regression** — OpenRouter adds providers and TrustedRouter falls behind. Mitigation: the comparison is published on TrustedRouter's site; the comparison is the source's claim, not a permanent ranking.
- **Privacy guarantee audit gap** — the user cannot audit a specific TrustedRouter call and confirm the prompt was not forwarded. Mitigation: the audit surface is the structural reason the guarantee is not a marketing line; the audit surface is part of the product, not a setting the user has to discover.
- **Per-problem eval cost creep** — the eval cost grows beyond the source's "few pennies" framing. Mitigation: the per-problem cost is published on AnyEval's site; the cost is the source's framing, not a permanent price.
- **Crowdsource-eval stall** — the community starts a crowdsourced eval and the contributions dry up before the eval completes. Mitigation: the community payment model is explicit about the threshold; the eval is paused and refunded if the threshold is not met.
- **Honey Pot Bench coaching** — the model is fine-tuned on the benchmark and the escape-propensity score drifts toward the desired direction. Mitigation: the benchmark is rebuilt with held-out cases; the rebuild cadence is documented.
- **Freedom Bench provider-change** — a Chinese provider's monitor changes and the headline result shifts. Mitigation: the benchmark's provider-level measurement is rebuilt on a cadence; the user can see the rebuild timestamp on the published report.
- **Funding amount discrepancy** — the post's title and the linked article disagree on the funding amount. Mitigation: the funding announcement is published with the source's number and the plan notes the discrepancy; the user reads the funding amount from the source, not from the plan.
