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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4180-ai-startup-trustedrouter-raises-125m/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the TrustedRouter provider-integration layer: the multi-provider front-end, the model registry, the per-provider comparison against OpenRouter (the source's claim of "more providers than open router and more models as well" is the published comparison).
- [ ] Build the TrustedRouter privacy-preserving routing layer: the structural implementation of the privacy guarantee ("without needing to give your data to a third party like a close source router"), the per-call audit surface the user can check.
- [ ] Build the TrustedRouter skills layer: the LLM-choice advisor, the security and skills innovation the source names as part of the TrustedRouter pitch.
- [ ] Build the AnyEval eval-runner layer: the per-problem eval surface, the per-problem cost ("the few pennies it costs to run an individual problem in an eval"), the random-sample paid eval, the head-to-head model comparison surface.
- [ ] Build the AnyEval community-crowdsource eval surface: the community payment model, the full-eval-on-target-model flow, the user-created eval surface.
- [ ] Build Honey Pot Bench (Honey Bench) on AnyEval: the benchmark that recreates some of the facts of the Hugging Face incident, the per-model escape-propensity measurement, the published headline result the source reports (Fable vs the other Claudes on escape propensity).
- [ ] Build Freedom Bench on AnyEval: the benchmark that measures Chinese censorship, the provider-level vs model-weight separation, the published headline result the source reports (provider-level monitor for Chinese providers, less in the model weights).
- [ ] Publish the two-product sites at trustedrouter.com and anyeval.com, with the funding announcement and the source's published amount.
- [ ] Run an end-to-end test: a user routes a prompt through TrustedRouter without the prompt being forwarded to a third party in a readable form, runs an individual problem on AnyEval for a few pennies, runs a head-to-head comparison of two models, and reads the published headline results for Honey Pot Bench and Freedom Bench.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Publish the funding announcement with the source's published amount and note the discrepancy between the post's title and the linked article
- [ ] Document the privacy guarantee's structural implementation and the per-call audit surface on the trustedrouter.com site
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-31_
