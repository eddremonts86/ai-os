---
id: "1181"
slug: k7d-fork-live-kubernetes-clusters-in-1s-grpo-train-ai-o
title: "K7d – Fork live Kubernetes clusters in <1s –> GRPO-train AI on infra"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49346284"
category: show-hn
date: "2026-08-18"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# K7d – Fork live Kubernetes clusters in <1s –> GRPO-train AI on infra

## Problem

Hey HN, Gary here.Today I want to present k7d which is an Apache 2.0, tight Rust VMM + shim enabling something not possible before: fast forking of live running virtualized multi-node k8s clusters with surviving of in-flight connections.A 3-VM nodes K8s cluster gets forked in 105ms, and a 50x fork of a 3-VM cluster in 4.1s on a 64GB RAM box.I have two goals here:1) enable large scale GRPO/RL training of AI on Kubernetes infra, which IMO is a great playground for reasoning training, besides training a capability that's actually useful. And this requires not only fast episode reset (as you need tens of thousand of multi-turn runs during RL post-training) but also greatly benefits from fast forking so you can do parallel branch exploration, rollback, pruning during RL training. Faithful forks also give you byte-identical starts for the G of GRPO, which gives variance reduction across the group.2) enable <3s VM snapshot pause/resume/fork of sandboxes with Docker-in-VM, for my other project K7 which provides self-hosted infra for VM sandboxes at scale, with a user-friendly CLI / API / Python SDK, and Kubernetes native.Besides that, k7d is equipped with:- A Tree-shaped API for resource management: as you can guess when you fork, even with optimized CoW-page-sharing, you want to properly manage your resources (memory + disk) and hence you need to know how to evict while things run. So I have tree-shaped logic to keep track of how children share pages with parents, and let your AI agent protect a promising tree branch, evict an unpromising one, or let LRU-ish logic auto-evict when resources get tight. This tree-based logic applies both to single VM sandboxes, and to multi-VM clusters on their own Linux bridge.- Formal verification: of course not all of it, but selected critical subparts of k7d are formally verified: I use Kani for memory arithmetics in the unsafe paths, and Aeneas (with Lean backend) to formally prove the tree-based logic explained above so that eviction never frees a page referenced by a live descendent.- Latencies as CI: I rigorously keep track of latency for most important operations which remain checked/enforced via a suite of integration tests.I really tried hard not building my own VMM and first ended up building another backend for K7 than my initial "kfd" (Kata + Firecracker + Devmapper-snapshotter over LVM thin-pool), which I called "kql" for Kata + Qemu + Longhorn. If you know this stack you'll guess it right away: Longhorn is great for cross-node replication so I used it to have my snapshots replicated across nodes, so "snapshot resume" always works / HA. Qemu here is because Longhorn's block storage requirements was incompatible with Firecracker who wants Devmapper-snapshotter, a backend for which I would not want to build myself the cross-node replication logic.But this "kql" backend yielded forks in 45s due to how Longhorn is built, which was too slow for the users who asked me to enable fast forking for K7.So this is what pushed me towards k7d, named as "k7's daemon", its own native VMM and shim, replacing both Firecracker/Qemu and Kata at once.This yields VM sandboxes in K7 which you can fork in under 2-3s, and most of this latency is kubelet overhead, as at the VMM level the warm-fork is actually 5ms.One security trade-off: the daemon has to be shared across branches of a same tree: that's by design. So you lose Firecracker's Jailer per VM. But I could re-build a similar Jailer per tree, which would be sufficient when a tree isn't shared across tenants, such as when you use branching for RL training. That's just optimizing for something different than what Firecracker does.The codebase is intentionally tight enough to be audited (<30k LOC for VMM + shim) and I linked a deep-dive blogpost series at the top of the README.I hope you guys will enjoy it and I'd love contributors and critics.Thx!

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
