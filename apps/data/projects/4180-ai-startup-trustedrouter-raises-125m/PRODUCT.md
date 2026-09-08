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

## Value Proposition

Two products on one funding announcement. TrustedRouter is a privacy-preserving AI router that does not give the user's data to a third party like a closed-source router, with more providers and more models than OpenRouter and innovations in security and skills that advise the user on which LLM to use. AnyEval is an open-source infrastructure for AI on the Internet where the community crowdsources paying for evals on any model, with head-to-head comparisons and the ability for users to create new evals.

The source ships two new evals on AnyEval. Honey Pot Bench (Honey Bench) recreates some of the facts of the Hugging Face incident to measure a model's propensity to escape, with the headline result that Fable in particular, unlike the other Claudes, is very unaligned in comparison. Freedom Bench measures Chinese censorship at the provider level versus the model weights, with the headline result that the censorship is mostly at the provider-level monitor (Chinese providers but not US providers), with much less in the model weights themselves.

**One-liner:** A privacy-preserving AI router with more providers and models than OpenRouter, paired with an open-source eval platform where the community crowdsources paying for what gets tested, with Honey Pot Bench and Freedom Bench as the first two evals.

## Target Users

| Stakeholder | Why they care |
|---|---|
| AI users who want a privacy-preserving router | Want to route through TrustedRouter without giving data to a closed-source third party. |
| AI users who want more provider and model coverage | Want a router with more providers and models than the existing open router. |
| Benchmark users | Want evals the community can crowdsource paying for, with head-to-head comparisons. |
| Researchers studying model alignment | Want a benchmark that recreates the facts of a real-world escape incident. |
| Researchers studying model censorship | Want a benchmark that separates provider-level monitoring from model-weight censorship. |

## Jobs To Be Done

1. **Functional job** — Route an AI call through TrustedRouter without giving the prompt to a third party like a closed-source router, and pick from more providers and models than the existing open router.
2. **Functional job** — Run an individual problem in an eval on AnyEval for a few pennies, or join the community in paying for a whole eval on a model, or pay for a random sample to get a sense of the model's quality.
3. **Functional job** — Run a head-to-head comparison of two models on AnyEval, or create a new eval.
4. **Emotional job** — Stop the feeling that the closed-source router sees the user's data and that the existing benchmarks hide the methodology.
5. **Social job** — Be the AI user whose routing is private and whose benchmarks are paid for by the community, not by a closed-source vendor.

## Success Metrics

- **Provider-count comparison** — TrustedRouter's provider count relative to the existing open router at the time of the post. The source claims "more providers"; the metric is the comparison.
- **Model-count comparison** — TrustedRouter's model count relative to the existing open router at the time of the post. The source claims "more models"; the metric is the comparison.
- **Privacy guarantee audit rate** — share of TrustedRouter calls the user can audit for "data not given to a third party". A call the user cannot audit is a privacy guarantee gap.
- **Per-problem eval cost** — the cost in pennies to run an individual problem in an eval on AnyEval. The source's framing is "the few pennies it costs"; the metric is the per-problem cost.
- **Crowdsource eval completion rate** — share of community-crowdsourced evals that reach a complete run on the target model. A crowdsourced eval that stalls is a community-engagement gap.
- **Head-to-head comparison count** — the number of head-to-head model comparisons run on AnyEval. The metric is the platform's usage of the head-to-head surface.
- **User-created eval count** — the number of new evals AnyEval users have created. The metric is the platform's openness to community-contributed evals.

## Pricing & Monetization

The source names the funding amount twice in different forms: the post's title says "$1.25M" and the linked article's URL says "$125 million". The plan treats the source text as ground truth and notes the discrepancy. The source names no pricing tier, no per-call rate, no per-eval rate, and no subscription shape for TrustedRouter or AnyEval. Any future monetization has to be measured against the provider-count comparison and the per-problem eval cost, because those are the metrics the source ties to the products' value proposition.

## Competitive Landscape

- **Closed-source AI routers (the names the source does not provide)** — see the user's data; the source's pitch for TrustedRouter is the privacy gap.
- **OpenRouter** — the source's named comparison; TrustedRouter claims more providers and more models.
- **AAII-style benchmarks** — the source's named critique; the methodology is hidden, the models tested are unclear, the gaps are the cost of coverage.
- **Community-driven eval platforms (the names the source does not provide)** — exist; the source's pitch for AnyEval is the crowdsource-payment model.

The post names no specific incumbent, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the funding amount. The post's title says $1.25M and the linked article's URL says $125 million; the open question is which figure is correct and whether the source is reporting two different rounds.
- [ ] Validate the provider-count and model-count claims against the live router. The source claims "more providers than open router and more models as well"; the open question is how the comparison is measured (live model count, model-card count, model-with-pricing count).
- [ ] Define the privacy guarantee's audit surface. The source says "without needing to give your data to a third party like a close source router"; the open question is whether the user can audit a specific call and see that the prompt was not forwarded to a third party.
- [ ] Confirm the crowdsource-payment model for AnyEval. The source says the community pays for the eval; the open question is whether the platform takes a fee on the community's payment, whether the community's payment is refundable if the eval is cancelled, and whether the user can opt out of being part of a crowdsourced eval.
- [ ] Validate the Honey Pot Bench headline result is reproducible. The source reports Fable is "very unaligned in comparison" to the other Claudes; the open question is whether the result holds across reruns, model versions, and benchmark updates.
- [ ] Validate the Freedom Bench headline result is reproducible. The source reports the censorship is mostly at the provider level, with much less in the model weights; the open question is whether the result holds across reruns, model versions, and benchmark updates.
- [ ] Define the policy on a user-created eval that is methodologically unsound. AnyEval lets users create new evals; the open question is whether the platform refuses to publish an eval the platform's reviewers flag, or publishes the eval and lets the community judge.
