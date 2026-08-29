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

## Tech Stack

- **Language:** TypeScript (strict mode), targeting the active Node.js LTS line. Zero runtime npm dependencies — every module is either in the Node standard library or a first-party TypeScript source file.
- **Concurrency core:** `node:worker_threads` for multi-core placement; the same `ActorRef` and `Props` API works whether an actor lives in the current thread or a sibling worker thread.
- **Messaging wire:** a small binary frame protocol over TCP (`node:net`) for remoting; the same protocol optionally wrapped in TLS via `node:tls` (cert + key + optional CA, mutual TLS supported).
- **Cluster membership:** gossip-based failure detector with a static or DNS seed list at boot, plus a distributed name registry (also gossip-replicated) for cluster-wide actor lookups.
- **Tooling:** Vitest for unit tests, a separate `bench/` harness for the published throughput numbers, `tsc` for build (no bundler — keep the source inspectable).
- **Documentation site:** the existing GitHub Pages site (`tochemey.github.io/nodeakt`) continues to host API reference and benchmarks.

## Architecture

A single `ActorSystem` owns a local dispatcher (one or more worker-thread executors), a default supervisor, and an optional remoting layer. `Props` describe how to spawn an actor (`actorOf` returns an `ActorRef`). Local actors share memory and pass messages by structured-clone through the dispatcher; remote actors look the same but the dispatcher proxies each `tell`/`ask` over TCP/TLS to the owning node. The cluster layer sits on top of remoting: each node runs a gossip loop that tracks membership and replicates the name registry, and a relocation coordinator moves an actor's responsibility to a survivor when its host node departs.

```
                              ┌──────────────────────────┐
                              │     ActorSystem          │
                              │ �──────────────────────┐ │
                              │ │   Dispatcher         │ │
                              │ │   (worker_threads)   │ │
                              │ └──────────────────────┘ │
                              │ ┌──────────────────────┐ │
                              │ │   Supervisor tree    │ │
                              │ └──────────────────────┘ │
                              │ ┌──────────────────────┐ │
                              │ │   Local mailbox      │ │
                              │ └──────────────────────┘ │
                              └────────────┬─────────────┘
                                           │
                                           ▼
                              ┌──────────────────────────┐
                              │   Remoting (TCP / TLS)   │
                              └────────────┬─────────────┘
                                           │
                                           ▼
                              �──────────────────────────┐
                              │   Cluster                │
                              │   (gossip + registry)    │
                              └──────────────────────────┘
```

Single-node path: `actorOf(props)` → dispatcher schedules onto a worker thread → mailbox delivers messages one at a time → supervision reacts to failures. Multi-node path is the same until the `ActorRef` is resolved remotely: the dispatcher routes the message through the remoting layer to the node that owns the actor. `spawnSingleton` is a cluster-aware factory; `watch` and death-watch cross the wire and re-fire on relocation.

## Milestones

1. **M0 — Local core.** `ActorSystem`, `Props`, typed `tell`/`ask`/`watch`, bounded/unbounded/priority mailboxes, behaviors (`become`/`becomeStacked`), stash, supervision with restart strategies and exponential backoff. End of week 3.
2. **M1 — Multi-core.** Worker-thread dispatcher; same PID API across threads; benchmark suite for local throughput. End of week 5.
3. **M2 — Remoting.** TCP carrier, message serialization, `tell`/`ask`/`request`/`forward`/`watch` over the wire; TLS optional; failure semantics cross the wire. End of week 8.
4. **M3 — Cluster.** Gossip-based membership (static + DNS seed), failure detection with quorum, distributed name registry, `spawnSingleton`, relocation on departure. End of week 11.
5. **M4 — Public release.** Apache-2.0 license, GitHub Releases for 1.0.0, signed checksums, GitHub Pages site updated with benchmark numbers, Show HN follow-up post. End of week 13.
6. **M5 — Adoption loop.** Triage GitHub issues for 4 weeks, publish at least one case-study interview per month, decide on persistence/eventsourcing for v1.1 based on demand. End of week 17.

## Risks

- **"Zero dependencies" claim under attack.** The TypeScript ecosystem has strong opinions about what counts as a dependency (peer vs dev vs runtime). The package's `dependencies` block must be empty; everything else (test runners, build tools) goes in `devDependencies` and is documented.
- **Cross-node message semantics.** Erlang's "let it crash" assumes the BEAM runtime can survive process death and route messages around it; a Node.js process death is heavier. The supervision tree and the relocation path together must give the same observable semantics, or the value proposition against BEAM is hollow.
- **Split-brain under partitions.** A gossip cluster with quorum only avoids split brain if the network partition respects the quorum size. Documenting and testing the failure mode (5-node cluster with 3-node partition surviving, 2-node partition self-terminating) is load-bearing for the trust claim.
- **TLS throughput.** TLS handshakes and per-message overhead can halve remoting throughput. If the published benchmark cannot sustain the headline number with TLS on, the framework ships plaintext-only by default and TLS as opt-in, with the trade-off documented in the README.
- **Persistence/eventsourcing.** If included in v1 to match the "framework" claim, scope and timeline risk blowing out by 4–6 weeks. Defer to v1.1 and document the deferral openly on the release page; do not silently slip the schedule.
- **Show HN visibility window.** The HN thread lives on the front page for ~24 hours; if M2–M4 slip into that window, follow-up benchmarks must already exist or the post's credibility tanks.
