---
id: "3685"
slug: darwin-vm-run-the-latest-ios-and-macos-in-qemu
title: Darwin-VM – run the latest iOS and macOS in QEMU
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49485263"
  captured: "2026-08-28"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [QEMU (upstream fork), Apple SPTM/TXM boot protocol, Apple Silicon CPU emulation (GXF, guarded exception levels), MTE (Memory Tagging Extension), APFS image tooling, code-signing / trustcache tooling]
---
# Darwin-VM – run the latest iOS and macOS in QEMU

## Phase 0: Scaffold

- [x] Capture problem from HackerNews + write SPEC.md skeleton
- [ ] Publish darwin-vm repository with README + LICENSE
- [ ] Add pre-built device-profile configs for virtual iPhone 12/13/14/15/16/17 and M1/M2/M3/M4/M5 Mac Mini / MacBook Air
- [ ] Document the macOS-only setup step and the host-agnostic runtime step in the README
- [ ] Pin QEMU baseline commit the out-of-tree fork is built against

## Phase 1: Core

- [ ] QEMU patch series implementing the SPTM boot protocol (trusted execution monitor, kernelcache, ramdisk, trustcache, device tree, boot args in physmem)
- [ ] Apple Silicon CPU model in QEMU: GXF instructions + SPTM/TXM guarded exception levels alongside classical EL2/EL0
- [ ] Memory Tagging Extension (MTE) support for the latest virtual hardware
- [ ] End-to-end setup pipeline: raw iOS / macOS update file → extracted kernel + kernelcache + ramdisk → signed trustcache
- [ ] Root-shell-daemon injection into the ramdisk so the first boot lands at a root prompt
- [ ] Latest iOS beta boots to ramdisk root shell on every advertised iPhone profile
- [ ] Latest macOS beta boots to a usable user session on every advertised Mac profile
- [ ] Kernel Debug Kit development kernel swap-in documented and exercised against M-series virtual Macs
- [ ] Host-side lldb attaches symbolically to the virtual kernel with the documented workflow
- [ ] Recipe for compiling and running custom user programs inside the VM as root
- [ ] End-to-end test: hand darwin-vm a current iOS beta and a current macOS beta, get a root shell in each on a fresh host within the documented time budget

## Phase 2: Deploy

- [ ] Upstream-readiness pass on the GXF / guarded-EL / SPTM patch series (clean history, public review)
- [ ] Open the repo to outside contributors (CONTRIBUTING, issue templates, CI on a sample device profile)
- [ ] Tag a 1.0 release once the latest public iOS and macOS both boot cleanly on every advertised profile
- [ ] Publish a research blog post + a conference talk covering the SPTM boot reverse-engineering
