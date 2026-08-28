---
id: "3344"
slug: reconstruct-distributed-llm-training-traces
title: Reconstruct distributed LLM training traces
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49461808"
category: show-hn
date: "2026-08-27"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Reconstruct distributed LLM training traces

## Problem

When we train large language models, there are a lot of systems challenges and different sharding schemes one can use. While there are many great resources on scaling LLMs out there (https://huggingface.co/spaces/nanotron/ultrascale-playbook or https://jax-ml.github.io/scaling-book/), I felt like there was still a gap when it comes to visualising different forms of parallelism and building intuition around overlaps and execution order for a distributed training runThe idea is to make it easier to visualise FSDP/Tensor Parallel/Expert Parallel/Context parallel and reason about it - you can drag and drop compute kernels and collectives to create DDP/TP/FSDP/EP/CP traces based on real torchtitan profiles.

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
