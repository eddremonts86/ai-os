# SPEC.md — Simpleboot and Easyboot

## Problem

These are FLOSS boot loaders and disk utilities which follow the suckless philosophy (<a href="https:&#x2F;&#x2F;suckless.org&#x2F;philosophy&#x2F;" rel="nofollow">https:&#x2F;&#x2F;suckless.org&#x2F;philosophy&#x2F;</a>). Despite being totally dependency-free, they come with a fully featured single command to create bootable disk images out of a directory (utility is available on Windows, Linux and other POSIX systems). Usage is as simple as it gets.<p>There are two repositories, depending on the desired use case:<p>Simpleboot is the little brother, an embeddable boot loader:
<a href="https:&#x2F;&#x2F;gitlab.com&#x2F;bztsrc&#x2F;simpleboot" rel="nofollow">https:&#x2F;&#x2F;gitlab.com&#x2F;bztsrc&#x2F;simpleboot</a><p>- multiplatform (BIOS, UEFI, RPi, coreboot)<p>- very small (less than 64k), single binary<p>- also flashable into ROM (option ROM, expansion ROM, coreboot payload, etc.)<p>- easy to configure (single config file, checked for validity by the disk creator utility)<p>- one backup boot option<p>- capable to boot Linux and simplified Multiboot2 kernels (see below)<p>Easyboot is the big brother, an interactive boot manager:
<a href="https:&#x2F;&#x2F;gitlab.com&#x2F;bztsrc&#x2F;easyboot" rel="nofollow">https:&#x2F;&#x2F;gitlab.com&#x2F;bztsrc&#x2F;easyboot</a><p>- multiplatform (BIOS, UEFI, RPi)<p>- interactive boot menu for dual booting multiple OSes<p>- easy to configure (similar syntax as GRUB&#x27;s, but much simpler)<p>- up to 9 boot options<p>- transparent payload decompression<p>- on-the-fly, transparent DSDT and DTB patching<p>- plugin system to support multiple file systems and boot protocols<p>- supports FAT12&#x2F;16&#x2F;32, exFAT, NTFS (v3, v3.1), ext2&#x2F;3&#x2F;4, XFS (SGI), UFS (v2, v4.4), mfs (Minix3), BeFS (Haiku), plus any root file system (zfs, btrfs, etc.) provided the kernel is on the ESP<p>- supports booting Linux, Windows, OpenBSD, FreeBSD, FreeDOS, ReactOS, MenuetOS, KolibriOS, SerenityOS, Haiku, Multiboot1, Multiboot2 (in PE&#x2F;COFF, ELF, a.out, etc. formats)<p>- comes with a (very minimal but useful) kernel debugger that works on real machines too<p>Full disclosure: forking Simpleboot into Easyboot was sponsored by The Free Software Foundation Hungary (<a href="https:&#x2F;&#x2F;fsf.hu&#x2F;nevjegy" rel="nofollow">https:&#x2F;&#x2F;fsf.hu&#x2F;nevjegy</a>), created in appliance of FSF.hu&#x27;s Free Software Tender 2023.<p>Their default &quot;simplified Multiboot2 protocol&quot; is an easier to use superset of the GRUB&#x27;s Multiboot2 protocol. This protocol handles native 64 bit kernels (no 32-bit trampoline code), programming language and ABI agnostic (works with native C, C++, Rust, Go, Ada, Pascal, etc. kernels, no Assembly preambule needed), supports transparent higher-half mapping, not tied to x86, and has SMP support too (running the kernel on all CPU cores), passes EDID and kernel segmentation information (not in GRUB), etc. etc. etc. An example kernel is provided in the repo: <a href="https:&#x2F;&#x2F;gitlab.com&#x2F;bztsrc&#x2F;simpleboot&#x2F;-&#x2F;tree&#x2F;main&#x2F;example" rel="nofollow">https:&#x2F;&#x2F;gitlab.com&#x2F;bztsrc&#x2F;simpleboot&#x2F;-&#x2F;tree&#x2F;main&#x2F;example</a><p>If needed, there&#x27;s an Easyboot plugin to support the old-fashioned, x86-only, GRUB-compatible Multiboot2 protocol (embedded tags, 32-bit entry point, no higher-half, GRUB ABI).<p>Documentation and detailed specification is available in German, English, Spanish, French, Hungarian, Italian, Japanese, Dutch, Polish, Portuguese, Russian and Chinese (some machine translated, sorry).<p>I would really love to hear your opinion and constructive criticism. Simpleboot is feature complete (only bugfix allowed), but Easyboot is expandable with new features via plugins.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49685301)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-13T15:48:15Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
