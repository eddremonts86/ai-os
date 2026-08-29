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

## Problem

Reverse-engineers and low-level Apple-platform researchers have no convenient way to bring up the latest SPTM-based iOS and macOS inside an emulator. Regular macOS VMs need a 40 GB disk image, and you still have to download a 10 GB+ IPSW and provision a user-space image before you can boot anything; for iOS the situation is worse — there is essentially no off-the-shelf path that gives a root shell on a freshly-emulated device. As a result, anyone who wants to study or patch XNU, the SPTM/TXM trusted-execution monitors, kexts, launchd, dyld, or user programs either needs a real piece of Apple hardware or has to do the bring-up work from scratch. The author (jprx on Hacker News) has spent several months building that bring-up inside QEMU: reverse-engineering the SPTM boot protocol (how SPTM expects the trusted execution monitor, boot kernelcache, ramdisk, trustcache, device tree and boot args to be laid out in physical memory), implementing Apple's GXF instructions and the new guarded exception levels used by SPTM and TXM alongside the classical EL2/EL0, and getting MTE working for the latest hardware. The result is a scriptable workflow where you hand the tool an iOS or macOS update file and get a root shell inside a VM running that OS — without a 40 GB disk image and without a 10 GB IPSW. The author has tested it against the very latest iOS and macOS betas on virtual iPhone 12–17 plus M1–M5 virtual Mac Minis and MacBook Airs, all under QEMU TCG so it runs anywhere QEMU runs (no ARM host required), though you do still need a Mac to run the setup scripts because they manipulate APFS images and code signing.

## Objective

Ship a "give me an IPSW, give me a root shell" workflow that boots the latest SPTM-based iOS or macOS inside QEMU on any host QEMU supports, with scriptable setup that automates IPSW extraction, ramdisk population, trustcache signing, and kernel-debugger wiring, so security researchers and XNU/Darwin internals hobbyists can debug, patch, and run their own code in a current Apple OS without maintaining their own bring-up.

## Target Users

- Primary: security researchers and low-level Apple-platform developers who currently need a real iPhone/Mac or have to redo the SPTM boot bring-up themselves to study XNU, SPTM/TXM, kexts, launchd, or dyld on a current OS build.
- Secondary: Apple internals hobbyists and kernel-debugging students who want symbolic kernel debugging in lldb against a development kernel from a Kernel Debug Kit, and who need a Mac only for the one-time setup scripts (APFS + code signing) and can then run the VM anywhere QEMU runs.
- Tertiary: tooling authors and CI authors who need a scripted, reproducible way to spin up a virtual iPhone 12–17 or M1–M5 Mac on commodity Linux/Windows/macOS hosts via QEMU TCG.

## MVP Scope

- A CLI / script set that takes an iOS or macOS update file and produces a bootable QEMU invocation with a populated ramdisk and a signed trustcache, automating IPSW extraction and APFS image manipulation.
- QEMU patches that implement the SPTM boot protocol, the GXF instruction set, and the SPTM/TXM guarded exception levels, plus MTE support for the latest hardware.
- Pre-built device profiles for the latest virtual iPhone 12/13/14/15/16/17 and M1/M2/M3/M4/M5 Mac Mini / MacBook Air.
- A root shell daemon installed in the ramdisk so the first boot lands the user at a root prompt.
- README instructions for swapping in a Kernel Debug Kit development kernel and attaching lldb for symbolic kernel debugging, plus a recipe for compiling and running custom user programs inside the VM.
- Setup script requires a Mac for the APFS + code-signing step; the QEMU side itself is host-agnostic.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Setup scripts run only on macOS because they manipulate APFS images and apply code signing; running on Linux/Windows hosts needs an extra Mac hop for one-time setup.
- The host side depends on QEMU TCG (no KVM/HVF hardware acceleration assumed) so it can run on x86 hosts, but this caps performance versus hardware-accelerated emulation.
- Only the latest SPTM-based iOS and macOS are in scope; older non-SPTM Apple OS builds are not a target.
- The project is a QEMU fork / patch series plus tooling, not a standalone redistributable Apple OS — users must supply their own iOS/macOS update file and accept the licensing constraints that come with it.
- Apple Silicon CPU emulation (GXF, guarded ELs, MTE) is the technical core, so the project cannot ride on the upstream QEMU tree without those patches applied.
