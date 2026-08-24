---
id: "2357"
slug: kandelo-a-posix-compatible-multi-process-wasm-kernel-fo
title: Kandelo – a POSIX-compatible multi-process WASM kernel for the browser
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49378305"
category: show-hn
date: "2026-08-20"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Kandelo – a POSIX-compatible multi-process WASM kernel for the browser

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Kandelo is an open-source, Wasm-based multi-process kernel that runs POSIX programs in browsers and Node.js.Kandelo is still experimental, but it already runs a substantial range of existing software.Do you have use cases for this?We are trying Kandelo as a new foundation for WordPress Playground which runs server-side WordPress entirely in the browser. Kandelo also looks promising as a sandbox for running agents in the the browser and on the command line. On the side, we've been playing with porting games and desktop environments and even compiling runnable programs within Kandelo.Yet it feels like there are many possibilities we haven't considered.How would you like to use something like this?Demos:Some notes: The demos have been tested in desktop browsers. Unfortunately, YMMV on mobile today. Some of the disk images are large (~50MB) and may take a while to boot initially.Main set, with Shell (bash, vim, nethack, and more), Nginx, PHP, WordPress, and Doom:
https://kandelo.dev/20260819-demo/LÖVE game engine:
https://kandelo.dev/20260819-demo-love/SNKRX running under LÖVE:
https://kandelo.dev/20260819-demo-love/?vfs=love-snkrx-abi44...Commander Keen running in DOSBox:
https://kandelo.dev/20260819-demo-dos/?demo=keenLXDE desktop PoC:
https://kandelo.dev/20260819-demo-lxde/?demo=desktop-lxdeBackgroundI wanted an authentic OS-level foundation for running systems software in the browser and started this as a vibe-coded exploration. I figured it would end up being too slow and that we would have to offer many different ways to compromise default POSIX behavior to get anything usable. But after weeks of fighting agents, insisting on genuine POSIX compatibility as the default, I was surprised at how well the system worked without those compromises.Nginx, PHP, Python, Ruby, Redis, and even MariaDB were able to be built using the SDK with minimal hacks.Then we started porting games, having fun, and playing to see how far we could push it.Notes on architecture:There is a central, single-worker kernel, aiming to provide all supportable POSIX syscalls. Each process is a dedicated worker with independent memory. Each process thread is a dedicated worker that shares memory with threads from the same process. Syscalls are done with the process SharedArrayBuffer and the Atomics API. fork() is supported. The system is centered around virtual file system (VFS) images, and the VFS can contain lazy references to programs that may or may not be used. Vim is such a reference in the shell demo.On GitHub:
https://github.com/Automattic/kandelo

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49378305) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
