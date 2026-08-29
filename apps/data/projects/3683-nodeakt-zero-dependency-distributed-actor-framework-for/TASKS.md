---
id: "3683"
slug: nodeakt-zero-dependency-distributed-actor-framework-for
title: NodeAkt – Zero-dependency distributed actor framework for TypeScript
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49485541"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [TypeScript, Node.js runtime, libuv worker threads, TCP/TLS networking, gossip-based cluster membership]
---
# NodeAkt – Zero-dependency distributed actor framework for TypeScript

## Phase 0: Scaffold

- [x] Capture problem from HackerNews + write SPEC.md skeleton
- [ ] Define DESIGN.md (README hero, code-snippet typography, API reference chrome)
- [ ] Set up `tsconfig` strict + Vitest + ESLint + Apache-2.0 LICENSE
- [ ] Confirm the published package's `dependencies` block stays empty across all subpaths
- [ ] Add `npm pack --dry-run` to CI to fail any PR that introduces a runtime dep
- [ ] Write CONTRIBUTING.md spelling out the "zero runtime deps" rule

## Phase 1: Core

- [ ] Implement `ActorSystem`, `Props`, typed `ActorRef` with `tell`/`ask`/`watch`
- [ ] Mailboxes: unbounded, bounded (drop-oldest / drop-newest), priority, custom interface
- [ ] Behaviors: `become`, `becomeStacked`, `unbecome`, stash replay after switch
- [ ] Supervisor with restart strategies (one-for-one, one-for-all), restart budgets, exponential backoff
- [ ] Worker-thread dispatcher: same PID API across threads, mailbox routing across the boundary
- [ ] Remoting wire protocol over TCP: frame format, serialization, ping/pong, version negotiation
- [ ] TLS optional via `node:tls` with cert + key + optional CA, mutual TLS supported, all-or-nothing per system
- [ ] `tell`/`ask`/`request`/`forward`/`watch` crossing the wire; death-watch fires on remote crash
- [ ] Gossip-based membership: static seed list + DNS seed list, failure detection with phi accrual, quorum guard
- [ ] Distributed name registry (gossip-replicated) for cluster-wide `actorOf` lookups
- [ ] `spawnSingleton` with coordinator pinning and idempotent creation
- [ ] Relocation: when a node departs, the coordinator recreates its relocatable actors on a survivor
- [ ] Bench harness: local throughput (target ≥ 100k msg/sec/actor pair), cluster latency baseline
- [ ] End-to-end test: 3-node cluster, kill one node, observe singleton recovery + name-registry convergence
- [ ] Publish 1.0.0 GitHub Release with signed checksums and the bench numbers in the README

## Phase 2: Deploy

- [ ] Update GitHub Pages site with the 1.0.0 API reference, the cluster demo, and the benchmark page
- [ ] Post a Show HN follow-up linking the v1.0 release and the benchmark numbers
- [ ] Triage GitHub issues for the first 4 weeks; publish a weekly status note
- [ ] Collect at least 3 independent case studies (interview writeups) within 12 weeks of release
- [ ] Decide v1.1 scope (persistence/eventsourcing, scheduler polish) based on the case-study signal
