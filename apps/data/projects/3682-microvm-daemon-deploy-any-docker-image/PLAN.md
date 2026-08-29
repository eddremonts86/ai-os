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

## Tech Stack

- **Language:** Go (matches Firecracker's SDK and the existing `herd-core/herd` repo).
- **VMM:** Firecracker (`firecracker/firecracker` Go SDK + the `firecracker` binary).
- **Hypervisor:** Linux KVM via `/dev/kvm`.
- **Networking:** Linux `tap` + `vhost-net`, NAT via `nftables` (or `iptables-nft`) on the host; each VM gets a deterministic IP inside a `herd0` subnet.
- **Image pipeline:** custom OCI Distribution v2 client → unpacked OCI layers → `mkfs.ext4` → `dd` into a sparse raw block device; a thin cache (content-addressed by image digest) keeps the warm-boot path off the registry.
- **Guest kernel:** a vendored Firecracker-compatible kernel image (`vmlinux`) shipped alongside the daemon; no per-VM custom kernel build.
- **CLI:** Cobra for the `herd` command surface; gRPC or unix-socket JSON-RPC for the daemon ↔ CLI protocol.

## Architecture

The `herd` daemon owns the host-side state machine: image cache, VM records, tap devices, and the Firecracker child processes. The CLI is a thin client that talks to it over a unix socket. Each `herd deploy` is a one-shot pipeline: pull (if cold) → convert → spawn Firecracker with a generated config.json → wire tap → NAT port-maps → return the VM ID.

```
herd CLI ──▶ herd daemon (unix socket)
                │
                ├─▶ OCI pull ──▶ layer unpack ──▶ ext4 rootfs (cache by digest)
                │
                ├─▶ Firecracker process pool (one FC per VM)
                │       └─▶ tap0 ──▶ host NAT (nftables) ──▶ HOST:VM port map
                │
                ├─▶ VM record (id, image digest, rootfs path, tap, ports, state)
                │
                └─▶ journald / file logs per VM
```

## Milestones

1. **M0 — Repo and daemon skeleton.** `herd-core/herd` exists today; the MVP milestone is documenting the architecture and stabilising the daemon ↔ CLI socket protocol. End of week 1.
2. **M1 — Warm-boot path.** `herd deploy --image CACHED` returns a working VM in ≤ 800 ms; deterministic state stored in SQLite or a JSON file. End of week 3.
3. **M2 — Cold-boot + image cache.** OCI pull, layer unpack, ext4 conversion, content-addressed cache; second boot of the same digest is fast. End of week 5.
4. **M3 — Lifecycle CLI.** `herd ps`, `stop`, `rm`, `logs`; graceful SIGTERM to Firecracker, rootfs and tap cleanup on exit. End of week 7.
5. **M4 — Persistent volumes + Postgres-grade smoke test.** Volume mount path; smoke-tested by booting `postgres:latest` and surviving a `herd stop` / `herd deploy` cycle with data intact. End of week 9.
6. **M5 — Docs + Show HN polish.** README with one-command install, a comparison table vs. raw Firecracker, and a screencast of `herd deploy` + a quick `uname -r` inside the VM. End of week 11.

## Risks

- **Firecracker API drift.** Firecracker ships breaking JSON-config changes between minor versions; pinning the FC version and validating `config.json` against the chosen FC schema is mandatory.
- **KVM availability.** `/dev/kvm` must be present and the running user must have rw access; on most distros this is `kvm` group membership. The installer must diagnose and report it cleanly.
- **Cold-boot latency.** Pulling a 1 GB image and `dd`-ing it into an ext4 file is the slow path; the cache must be content-addressed so the second deploy of the same digest skips the network and the filesystem work.
- **Networking privilege.** Creating tap devices and nftables rules is root-only; the daemon runs as root or under a dedicated `herd` user with the right capabilities. Sandboxing the daemon (jailer-style) is a later hardening step.
- **macOS / Windows.** The `kvm` and `tap` primitives don't exist; the README must state Linux-only support to avoid wasted issue traffic.
