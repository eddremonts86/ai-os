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

## Tech Stack

- **Emulator core:** an out-of-tree fork of upstream QEMU that adds the SPTM boot protocol, Apple Silicon CPU model (GXF instructions, SPTM/TXM guarded exception levels), and Memory Tagging Extension (MTE) support for the latest hardware.
- **Boot pipeline scripts** in shell + Python that take an iOS or macOS update file, extract the kernel, kernelcache, ramdisk, trustcache and device tree, install a root-shell daemon into the ramdisk, and sign a fresh trustcache.
- **APFS / code-signing tooling** invoked by the setup scripts; depends on macOS-only utilities (APFS images, codesign, friends) for the one-time setup hop.
- **Kernel debugging path:** the Apple-supplied Kernel Debug Kit development kernel swapped into the ramdisk, plus documented lldb server wiring so a host-side lldb attaches symbolically.
- **Distribution:** a single GitHub repository (github.com/jprx/darwin-vm per the HN link) with shell scripts and a README; no separate backend service or web UI.

## Architecture

The repository ships three layers: an out-of-tree QEMU with the SPTM / GXF / guarded-EL / MTE patches; a setup pipeline that turns an iOS or macOS update file into a directory of boot artefacts (kernel, ramdisk with root-shell daemon, signed trustcache, device tree, boot args); and a thin QEMU launcher that points the patched QEMU at those artefacts. Setup runs once on a Mac (APFS + code-signing); runtime runs anywhere QEMU does because it relies on TCG, not on hardware virtualization.

```
                ┌──────────────────────────┐
                │ iOS / macOS update file  │
                └────────────┬─────────────┘
                             ▼
                ┌──────────────────────────┐
                │  Setup scripts (macOS)   │
                │  - extract IPSW / pkg    │
                │  - inject root daemon    │
                │  - sign trustcache      │
                └────────────┬─────────────┘
                             ▼
                ┌──────────────────────────┐
                │  Boot artefacts dir      │
                │  kernel, ramdisk,        │
                │  trustcache, devicetree  │
                └────────────┬─────────────┘
                             ▼
   ┌──────────────────────────────────────────────────┐
   │ darwin-vm QEMU (TCG, host-agnostic)              │
   │  - Apple Silicon CPU model                       │
   │  - GXF + guarded ELs + MTE                       │
   │  - SPTM boot protocol                            │
   └──────────────────────────┬───────────────────────┘
                              ▼
                ┌──────────────────────────┐
                │  virtual iPhone 12–17 /  │
                │  M1–M5 Mac Mini / Air    │
                │  → root shell (ramdisk)  │
                │  → or full macOS / iOS   │
                └──────────────────────────┘
```

## Milestones

1. **M0 — Repo and device profiles.** GitHub repository with README, LICENSE, and pre-built device-profile configs for virtual iPhone 12–17 and M1–M5 Mac Mini / MacBook Air. End of week 1.
2. **M1 — SPTM boot bring-up.** QEMU patch series implementing the SPTM boot protocol and the GXF + guarded-EL instructions, with the latest iOS and macOS betas booting to the ramdisk root shell. End of week 4.
3. **M2 — Setup automation.** End-to-end shell pipeline that takes a raw update file and emits a bootable artefacts directory, including root-shell-daemon injection and trustcache signing. End of week 6.
4. **M3 — Kernel debugging workflow.** Documented Kernel Debug Kit kernel swap-in and host-side lldb attach on at least the M-series virtual Macs. End of week 8.
5. **M4 — MTE and remaining hardware.** Memory Tagging Extension correctness on the latest virtual hardware; undocumented system register and device-tree manipulation closed out. End of week 10.
6. **M5 — Upstream-readiness pass.** Clean up the patch series into a form that could land in upstream QEMU; community testing across the advertised device profiles. End of week 13.

## Risks

- **Apple boot-layout churn.** SPTM-era iOS and macOS betas change how the trusted execution monitor, kernelcache, ramdisk, trustcache, device tree and boot args are laid out in physical memory. Each shift can break the bring-up and requires a new reverse-engineering pass.
- **Apple licensing surface.** Automating IPSW extraction, ramdisk population, and trustcache signing lives in an unsettled legal area around Apple's right-to-use terms; the tool ships no Apple binaries but the pipeline is still considered derivative work by some Apple-platform lawyers.
- **macOS-only setup step.** APFS image manipulation and code signing force a Mac for the one-time setup hop, which is friction for Linux-first researchers who would otherwise have a host-agnostic workflow.
- **TCG-only runtime.** Because darwin-vm depends on QEMU TCG rather than KVM/HVF, runtime performance is significantly slower than hardware-accelerated emulation, which limits its usefulness for performance benchmarking or fuzzing at scale.
- **Upstream QEMU drift.** If the GXF / guarded-EL / SPTM patches live as an out-of-tree fork long-term, every QEMU release forces a rebase; the value of upstreaming matters more than for typical one-off forks.
