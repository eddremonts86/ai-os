---
id: "521"
slug: any-way-to-speed-up-aws-build-times-without-increasing-
title: Any way to speed up AWS build times without increasing infrastructure costs?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo3ket/any_way_to_speed_up_aws_build_times_without/"
category: saas
date: "2026-08-14"
---
# Any way to speed up AWS build times without increasing infrastructure costs?

## Phase 0: Scaffold

- [x] Capture problem from Reddit + write SPEC.md skeleton
- [ ] Define DESIGN.md (analyzer palette, snippet styling)
- [ ] Provision Next.js + Fastify + Postgres
- [ ] YAML parser + AST walker skeleton

## Phase 1: Core

- [ ] 5 analyzer rules: missing cache key, sequential jobs that can parallelize, oversized single job, unnecessary dependency install, no artifact reuse
- [ ] Ranked wins view with severity + estimated savings band
- [ ] Snippet library per rule (CodeBuild + GitHub Actions variants)
- [ ] Per-repo history (paste → analyze → before/after diff)
- [ ] Pricing page with Stripe Checkout
- [ ] End-to-end test: paste YAML → 3 wins shown → paste "after" YAML → diff recorded

## Phase 2: Deploy

- [ ] Recruit 5 platform teams
- [ ] Coolify-side deployment
- [ ] Snippet library version audit (quarterly)

---

_Generated automatically by Lúa on 2026-08-14_
