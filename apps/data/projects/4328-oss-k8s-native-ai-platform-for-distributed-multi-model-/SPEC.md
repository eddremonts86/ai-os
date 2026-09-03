# SPEC.md — OSS, K8s-native AI platform for distributed multi-model inference

## Problem

Hi everyone,<p>I’m one of the co-founders of axem. We recently open sourced Shaide, a project we’ve been working on to make running multiple LLMs on your own infrastructure less painful.<p>It started pretty simply. Running one model wasn’t the hard part. The hard part came when we needed several models running at the same time, scaling them independently across GPU nodes, routing requests between replicas, and making the whole setup reproducible without relying on an external cloud service.<p>Over time we ended up building most of that infrastructure into one platform, and decided it made more sense to open source it rather than keep it internal.<p>Current setup:
- vLLM for inference
- llm-d for multi-instance orchestration
- multiple models running and scaling independently
- KV-cache-aware scheduling
i- nternal OCI registry for container images + model weights
OpenAI-compatible API
- the entire platform is managed as infrastructure as code
- interactive installer that runs from Docker against an existing Kubernetes cluster
- can operate fully air-gapped with no cluster egress<p>It currently works with on-prem RKE2 as well as EKS&#x2F;GKE&#x2F;AKS.<p>The project is Apache 2.0 and still fairly early, so there are definitely things that will change as more people try it.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49521905)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-01T13:40:24Z

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
