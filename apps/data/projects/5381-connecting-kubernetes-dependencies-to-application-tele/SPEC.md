# SPEC.md — Connecting Kubernetes dependencies to application telemetry

## Problem

I’m building Cardinal (cardinalhq.io). One thing that drives me nuts about Kubernetes debugging is the number of steps it takes to go from an application issue to its underlying kubernetes root cause.<p>Like for example, if I am seeing an error rate spike, and I group by deployment, I want to immediately see the deployment&#x27;s k8s neighborhood, which would then show me the configmap that was updated recently and incorrectly.<p>Similarly, say a node is low on disk and that is causing a ripple effect on a statefulset trying to write new files, which then affects request latency.<p>The list goes on.<p>To solve this, one idea we had was: build a smart chart legend that recognizes a k8s tag (based on OTEL semantic conventions), and then for every entry pops an &quot;infra map&quot; icon. Click and you see the full k8s neighborhood of that entity with health annotations. So now it&#x27;s easier to go from app telemetry to k8s infra.<p>I am curious if this UX makes sense, and if not how do you solve this correlation problem today?<p>https:&#x2F;&#x2F;cardinalhq.io&#x2F;use-cases&#x2F;kubernetes

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49588372)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-06T16:53:44Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
