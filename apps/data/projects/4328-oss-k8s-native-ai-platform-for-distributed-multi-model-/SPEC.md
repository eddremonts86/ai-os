---
id: "4328"
slug: oss-k8s-native-ai-platform-for-distributed-multi-model-
title: "OSS, K8s-native AI platform for distributed multi-model inference"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49521905"
category: show-hn
date: "2026-09-01"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# OSS, K8s-native AI platform for distributed multi-model inference

## Problem

Hi everyone,I’m one of the co-founders of axem. We recently open sourced Shaide, a project we’ve been working on to make running multiple LLMs on your own infrastructure less painful.It started pretty simply. Running one model wasn’t the hard part. The hard part came when we needed several models running at the same time, scaling them independently across GPU nodes, routing requests between replicas, and making the whole setup reproducible without relying on an external cloud service.Over time we ended up building most of that infrastructure into one platform, and decided it made more sense to open source it rather than keep it internal.Current setup:
- vLLM for inference
- llm-d for multi-instance orchestration
- multiple models running and scaling independently
- KV-cache-aware scheduling
i- nternal OCI registry for container images + model weights
OpenAI-compatible API
- the entire platform is managed as infrastructure as code
- interactive installer that runs from Docker against an existing Kubernetes cluster
- can operate fully air-gapped with no cluster egressIt currently works with on-prem RKE2 as well as EKS/GKE/AKS.The project is Apache 2.0 and still fairly early, so there are definitely things that will change as more people try it.

---

## Objective

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
