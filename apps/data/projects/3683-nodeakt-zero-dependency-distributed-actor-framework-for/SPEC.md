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

## Problem

TypeScript teams building stateful concurrent services (chat pipelines, workflow engines, real-time bidding, IoT gateways, multiplayer backends) reach for the actor model to avoid lock-based bugs — actors own private state and process one message at a time, so shared state does not need locks. The existing TypeScript options force an impossible trade: heavyweight Erlang/BEAM runtimes (Pekko/Akka.NET require JVM, Elixir/Erlang require a second language and VM), or lightweight in-memory actor libraries that fall over the moment you want actors to span more than one process or machine. The Show HN submission for NodeAkt frames it as "distributed actor framework for TypeScript" with "actors on one machine" (mailboxes, supervision, behaviors, multi-core runtime) and "actors across many machines" (TCP remoting with TLS, clustering with gossip, singletons, relocation on node departure) — all with zero npm dependencies. The pain is that the gap between "in-process actors" and "cluster actors" is currently bridged either by a foreign runtime or by hand-rolled TCP plumbing, and neither works for a team whose whole stack is already TypeScript and Node.

## Objective

Ship a TypeScript-native actor framework that scales from a single multi-core process to a multi-node cluster without code changes, so that a Node.js team can adopt the actor model and grow into distribution later without re-platforming. End state: typed actors, supervision trees, behaviors, mailboxes, and a multi-core runtime work locally; TCP/TLS remoting and gossip-based clustering extend the same PID API across machines; singleton and relocation semantics survive node departure.

## Target Users

- Primary: backend TypeScript engineers building stateful concurrent services (workflow engines, real-time bidding, IoT ingest, chat, multiplayer state) who want the actor model without leaving Node.js.
- Secondary: platform teams running multi-node Node services that need supervision, location transparency, and graceful failover between processes without bolting on a separate Akka/Elixir runtime.
- Tertiary: solo indie developers prototyping distributed systems who need the same primitives at one process today and many processes tomorrow without rewriting call sites.

## MVP Scope

- Core actor runtime: typed actor refs, mailboxes (bounded, unbounded, priority), behaviors with `become`/`becomeStacked`, stash, supervised restart strategies (one-for-one, one-for-all), and exponential backoff.
- Multi-core: actor placement across CPU cores via libuv worker threads or `node:worker_threads`, same PID API local and cross-thread.
- Remoting: TCP carrier, typed `tell`/`ask`/`request`/`forward`/`watch` crossing the wire, TLS optional via cert/key/CA, mutual TLS supported.
- Clustering: discovery provider (DNS seed list + static seed list), gossip-based membership with failure detection, distributed name registry, location-transparent `actorOf`, `spawnSingleton`, relocation on node departure, quorum guard against split brain.
- Persistence primitives (eventsourced actors) and a small scheduler (`scheduleOnce`, `schedule` cron-style) are in scope if the runtime fits; they are deferred to v2 if they slip the launch.
- No npm dependencies at the framework level (matching the author's claim); build with Node.js stdlib + TypeScript only.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- "Zero dependencies" is the headline claim — the framework's published package must install with no transitive npm dependencies beyond the Node.js standard library.
- The same PID call site must work locally, across worker threads, and across cluster nodes — no API fork between in-process and distributed.
- TLS is opt-in and all-or-nothing per system, never per-actor, to keep the wire protocol simple.
- Author has not stated a price; framework is open source. No monetization assumption baked into the plan.
- Remoting throughput over plaintext must be the documented baseline; TLS is a correctness/privacy feature, not a default performance target.
