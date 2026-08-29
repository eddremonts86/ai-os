---
id: "718"
slug: did-anyone-here-ab-test-a-free-demo-of-your-software-vs
title: Did anyone here A/B test a free demo of your software vs a free trial?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vpxc43/did_anyone_here_ab_test_a_free_demo_of_your/"
category: saas
date: "2026-08-16"
---
# Did anyone here A/B test a free demo of your software vs a free trial?

## Phase 0: Scaffold

- [ ] Confirm `SPEC.md` Problem carries the poster's exact framing: research-phase question about free demo vs. free trial, with the explicit "SalesForce pre-defined project" example for what they mean by demo
- [ ] Note in `SPEC.md` Constraints that the poster has not run the test yet — the corpus must not record a winner
- [ ] Add frontmatter `tags` for `pricing`, `ab-test`, `free-trial`, `free-demo`, `top-of-funnel`

## Phase 1: Core

- [ ] Re-read the Reddit thread and capture any reply that reports a tested lift / drop in either arm
- [ ] Reject any reply that cites generic conversion benchmarks — the poster asked for tested data
- [ ] Keep the SalesForce-pattern definition of "free demo" pinned in `PRODUCT.md` Competitive Landscape so downstream readers do not blur it with guided-tour demos
- [ ] If a downstream plan runs the A/B test, gate it on a pre-registered hypothesis and a documented sample size

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production
