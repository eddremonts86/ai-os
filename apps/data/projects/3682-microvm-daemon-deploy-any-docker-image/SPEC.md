---
id: "3682"
slug: microvm-daemon-deploy-any-docker-image
title: "MicroVM daemon, deploy any Docker image"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49485801"
  captured: "2026-08-29"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Go, Firecracker, KVM, Linux tap/vhost-net, CNI plugins]
---
# MicroVM daemon, deploy any Docker image

## Problem

Every Docker container on a Linux host shares the host kernel, so any kernel zero-day becomes a host-level compromise for every container on that box. The author explored Amazon's open-source answer to that problem — Firecracker microVMs, the same technology AWS Lambda runs on — but found Firecracker painful to operate: it ships as a Go library and assumes the caller wants to build a custom process-pool and tap-device plumbing from scratch. They started writing a Go library to do "just a firecracker spawn", and it grew into a full host-side daemon, **herd**, that boots a microVM from a Docker image and runs it as a one-liner (`herd deploy --image postgres:latest -p 5432:5432 -e POSTGRES_PASSWORD=postgres`). Reported cold-boot time is around 500 ms per microVM. The author also notes their OSS project lost Greptile's free code-review tier once stars dipped below 50 (they're at 38) — a side-ask, not the core problem.

## Objective

Ship an opinionated host-side daemon that takes any Docker image, converts it into a Firecracker microVM with its own kernel-visible OS boundary, and exposes it on the host network — without forcing the operator to write custom process-pool / tap / jailer code. The MVP is "run a docker image inside a microVM with one CLI command and a sub-second boot".

## Target Users

- **Primary:** self-hosting developers and small-platform engineers who want container-style ergonomics but are uncomfortable sharing a kernel with adversarial or multi-tenant workloads (nextcloud, postgres, public-facing game servers, isolated CI runners).
- **Secondary:** security-conscious teams running untrusted images (CTF infra, sandboxed code-execution backends, per-customer R&D environments) who need VM-level isolation without the operational weight of full VMs or kata-runtime setups.

## MVP Scope

- A single binary `herd` (Go) that runs as a host-side daemon and exposes `herd deploy --image REF [-p HOST:VM ...] [-e KEY=VAL ...] [--name NAME]`.
- An image-to-kernel pipeline: pull the Docker image, convert the rootfs to an ext4 block device, pair it with a guest kernel image, and boot it inside Firecracker on the local KVM.
- Per-microVM tap / vhost-net device with NAT to the host; port mapping expressed with the `-p HOST:VM` flag.
- A small CLI surface for `ps`, `stop`, `logs`, and `rm`, all over the daemon's local socket.
- OCI image pulling via a thin Docker-Registry v2 client (no dockerd dependency required).
- Persistent volume mount so stateful images (e.g. postgres) keep their data across restarts.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The author states the design works today; the MVP must stay within the demonstrated Firecracker + Go + KVM surface and not pull in containerd, kata, or runC at runtime.
- The author reports ~500 ms cold-boot; the MVP must not regress that materially (i.e. no per-boot image pull + extract on the critical path for repeat images — cache the converted rootfs).
- KVM must be available on the host (`/dev/kvm`); the daemon must fail with a clear message when it isn't.
- Linux-only in v1 (the KVM and tap primitives are not portable). macOS / Windows runners are out of scope.
- Must not require running dockerd; the daemon pulls from the registry directly.
