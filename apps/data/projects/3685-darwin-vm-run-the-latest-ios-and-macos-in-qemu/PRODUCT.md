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

## Value Proposition

A security researcher or Apple-internals hobbyist gets a single command that takes their iOS or macOS update file and gives them a root shell in a QEMU VM running that exact OS — no 40 GB disk image, no 10 GB IPSW, no real Apple hardware required for the runtime — with the latest SPTM-based builds working out of the box and lldb-attached symbolic kernel debugging one README away.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Security researcher / low-level Apple-platform developer | Currently either buys hardware or maintains their own SPTM bring-up to study current XNU/SPTM/TXM; darwin-vm collapses that to a scriptable workflow. |
| Apple-internals hobbyist / kernel-debugging student | Wants symbolic kernel debugging against a Kernel Debug Kit kernel without owning a dev-fused iPhone or a Mac Mini; can run the VM on any host QEMU supports. |
| Tooling / CI author | Needs a scripted, reproducible way to spin up virtual iPhone 12–17 or M1–M5 Macs on commodity Linux/Windows/macOS hosts via QEMU TCG. |
| Apple (indirectly) | A larger independent research community around current Apple platforms surfaces more kernel and trust-stack bug reports. |

## Jobs To Be Done

1. **Functional job** — Boot the latest iOS or macOS inside an emulator and get a root shell without buying hardware or maintaining the bring-up yourself.
2. **Emotional job** — Stop feeling locked out of current Apple-platform internals every time a new SPTM-based build ships that breaks older emulators.
3. **Social job** — Be able to share a reproducible QEMU recipe with other researchers instead of a pile of private scripts.

## Success Metrics

- **Boot parity:** every iOS / macOS beta the author ships against boots successfully across all advertised device profiles within one quarter of public release.
- **Setup reduction:** median researcher goes from update file to root shell in under 10 minutes on a fresh host (versus days of manual bring-up today).
- **Debugger coverage:** the documented lldb + Kernel Debug Kit workflow attaches symbolically on at least the M-series virtual Macs within the first week of using darwin-vm.
- **Reproducibility:** the README's "give me an IPSW, give me a root shell" path works on a clean machine after a single macOS-side setup step, without private patches.
- **Adoption signal:** GitHub stars and forks in the first 90 days as a proxy for researcher uptake; PRs landing upstream QEMU as the upstream-readiness target.

## Pricing & Monetization

This is an open-source research tool. No paid tier; monetization is reputational — adoption by the QEMU / Apple-security research community, upstream QEMU contributions, and conference talks.

## Competitive Landscape

- **Corellium** — commercial mobile-device emulation platform with strong legal footing; paid SaaS, focuses on iOS/Android forensics and testing, not open SPTM research.
- **Tunnelblick / mac-on-linux style efforts** — historical, mostly abandoned; never targeted SPTM-era iOS/macOS.
- **Manual QEMU bring-up per build** — what researchers do today; brittle, breaks every Apple update, and is exactly what darwin-vm automates.
- **Asahi Linux** — runs Linux on Apple Silicon hardware, not the inverse problem; complementary rather than competitive.

## Risks & Open Questions

- [ ] Validate that the SPTM boot-protocol reverse-engineering holds for every new iOS/macOS beta (Apple changes boot layouts; a single missed shift can break the bring-up).
- [ ] Confirm the macOS-side setup script remains the only Apple-required hop, and that APFS + code-signing tool dependencies stay available on current macOS releases.
- [ ] Decide whether to upstream the GXF + guarded-EL patches into QEMU proper or maintain them as an out-of-tree fork long-term.
- [ ] Watch for any Apple licensing signals around distributing the tooling that automates IPSW extraction and trustcache signing — the tool itself ships without Apple binaries, but the legal surface around "automated IPSW processing" is unsettled.
