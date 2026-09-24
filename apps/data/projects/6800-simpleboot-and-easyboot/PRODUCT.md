# PRODUCT.md — Simpleboot and Easyboot

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ These are FLOSS boot loaders and disk utilities which follow the suckless philosophy (<a href="https:&#x2F;&#x2F;suckless.org&#x2F;philosophy&#x2F;" rel="nofollow">https:&#x2F;&#x2F;suckless.org&#x2F;philosophy&#x2F;</a>). Despite being totally dependency-free, they come with a fully featured single command to create bootable disk images out of a directory (utility is available on Windows, Linux and other POSIX systems). Usage is as simple as it gets.<p>There are two repositories, depending on the desired use case:<p>Simpleboot is the little brother, an embeddable boot loader:
<a href="https:&#x2F;&#x2F;gitlab.com&#x2F;bztsrc&#x2F;simpleboot" rel="nofollow">https:&#x2F;&#x2F;gitlab.com&#x2F;bztsrc&#x2F;simpleboot</a><p>- multiplatform (BIOS, UEFI, RPi, coreboot)<p>- very small (less than 64k), single binary<p>- also flashable into ROM (option ROM, expansion ROM, coreboot payload, etc.)<p>- easy to configure (single config file, checked for validity by the disk creator utility)<p>- one backup boot option<p>- capable to boot Linux and simplified Multiboot2 kernels (see below)<p>Easyboot is the big brother, an interactive boot manager:
<a href="https:&#x2F;&#x2F;gitlab.com&#x2F;bztsrc&#x2F;easyboot" rel="nofollow">https:&#x2F;&#x2F;gitlab.com&#x2F;bztsrc&#x2F;easyboot</a><p>- multiplatform (BIOS, UEFI, RPi)<p>- interactive boot menu for dual booting multiple OSes<p>- easy to configure (similar syntax as GRUB&#x27;s, but much simpler)<p>- up to 9 boot options<p>- transparent payload decompression<p>- on-the-fly, transparent DSDT and DTB patching<p>- plugin system to support multiple file systems and boot protocols<p>- supports FAT12&#x2F;16&#x2F;32, exFAT, NTFS (v3, v3.1), ext2&#x2F;3&#x2F;4, XFS (SGI), UFS (v2, v4.4), mfs (Minix3), BeFS (Haiku), plus any root file system (zfs, btrfs, etc.) provided the kernel is on the ESP<p>- supports booting Linux, Windows, OpenBSD, FreeBSD, FreeDOS, ReactOS, MenuetOS, KolibriOS, SerenityOS, Haiku, Multiboot1, Multiboot2 (in PE&#x2F;COFF, ELF, a.out, etc. formats)<p>- comes with a (very minimal but useful) kernel debugger that works on real machines too<p>Full disclosure: forking Simpleboot into Easyboot was sponsored by The Free Software Foundation Hungary (<a href="https:&#x2F;&#x2F;fsf.hu&#x2F;nevjegy" rel="nofollow">https:&#x2F;&#x2F;fsf.hu&#x2F;nevjegy</a>), created in appliance of FSF.hu&#x27;s Free Software Tender 2023.<p>Their default &quot;simplified Multiboot2 protocol&quot; is an easier to use superset of the GRUB&#x27;s Multiboot2 protocol. This protocol handles native 64 bit kernels (no 32-bit trampoline code), programming language and ABI agnostic (works with native C, C++, Rust, Go, Ada, Pascal, etc. kernels, no Assembly preambule needed), supports transparent higher-half mapping, not tied to x86, and has SMP support too (running the kernel on all CPU cores), passes EDID and kernel segmentation information (not in GRUB), etc. etc. etc. An example kernel is provided in the repo: <a href="https:&#x2F;&#x2F;gitlab.com&#x2F;bztsrc&#x2F;simpleboot&#x2F;-&#x2F;tree&#x2F;main&#x2F;example" rel="nofollow">https:&#x2F;&#x2F;gitlab.com&#x2F;bztsrc&#x2F;simpleboot&#x2F;-&#x2F;tree&#x2F;main&#x2F;example</a><p>If needed, there&#x27;s an Easyboot plugin to support the old-fashioned, x86-only, GRUB-compatible Multiboot2 protocol (embedded tags, 32-bit entry point, no higher-half, GRUB ABI).<p>Documentation and detailed specification is available in German, English, Spanish, French, Hungarian, Italian, Japanese, Dutch, Polish, Portuguese, Russian and Chinese (some machine translated, sorry).<p>I would really love to hear your opinion and constructive criticism. Simpleboot is feature complete (only bugfix allowed), but Easyboot is expandable with new features via plugins.

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

| Stakeholder | Why they care |
|---|---|
| Early adopters | _[What pain they feel, and how this solves it]_ |
| Founders | _[What pain they feel, and how this solves it]_ |
| SMEs | _[What pain they feel, and how this solves it]_ |

## Jobs To Be Done

1. **Functional job** — _[What the user is trying to accomplish]_
2. **Emotional job** — _[How they want to feel]_
3. **Social job** — _[How others perceive them using this]_

## Success Metrics (North Star)

- **Activation:** _[% of signups who complete X within Y days]_
- **Retention:** _[DAU/MAU, week-1 retention, cohort curves]_
- **Revenue:** _[MRR target, ARPU, LTV/CAC]_

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_TODO:_ list 2-3 alternatives + differentiation.

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49685301) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
