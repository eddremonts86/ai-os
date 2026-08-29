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

## Phase 0: Scaffold

- [x] Capture problem from HN + write SPEC.md skeleton
- [ ] Document the daemon ↔ CLI socket protocol in README
- [ ] Decide state-store: SQLite vs. plain JSON file (pick whichever keeps `herd ps` simple)
- [ ] Pin Firecracker + vendored `vmlinux` kernel image; document the supported host-kernel matrix
- [ ] Diagnose `/dev/kvm` and group membership in the install script with a clear failure message
- [ ] Wire nftables NAT setup (idempotent `herd0` table) into the daemon's first-run path

## Phase 1: Core

- [ ] `herd deploy --image REF` — pull (if cold), convert rootfs, spawn Firecracker with generated config.json
- [ ] Content-addressed image cache keyed by OCI digest; second deploy of the same image is warm
- [ ] Per-VM tap device + NAT port-mapping from `-p HOST:VM`
- [ ] `-e KEY=VAL` env injection into the VM via Firecracker boot metadata
- [ ] Persistent volume mount: `--volume host:vm` survives `herd stop` + `herd deploy`
- [ ] `herd ps` lists running VMs with id, image, ports, age
- [ ] `herd stop ID` sends clean SIGTERM, tears down tap and rootfs
- [ ] `herd rm ID` removes the persistent rootfs and the VM record
- [ ] `herd logs ID` tails the VM's serial-console log
- [ ] Smoke test: deploy `postgres:latest`, write a row, stop + redeploy, verify the row survives
- [ ] Isolation proof: `uname -r` inside the VM differs from the host (different guest kernel)

## Phase 2: Deploy

- [ ] One-command Linux install script (curl | bash) with KVM and `kvm` group checks
- [ ] Screencast of `herd deploy --image postgres:latest` for the Show HN top post
- [ ] Cross-distro CI matrix (Ubuntu LTS, Debian stable, Fedora, Arch) gating release
- [ ] Documented path for `herd` users to upgrade the vendored kernel without losing data
