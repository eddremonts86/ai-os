# PRODUCT.md — MesaOS – An operating system written from scratch in Rust

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hello! I&#x27;m a student from Spain and I&#x27;m the creator of MesaOS, an open-source operating system written from scratch in Rust for x86_64.<p>I&#x27;ve been working on it mostly by myself.<p>MesaOS currently has:<p>A hybrid kernel
Preemptive multitasking
A Linux driver shim with 400+ exported kernel symbols (still in development)
HDA audio and WAV streaming
A shell with around 82 commands
VFS, RamFS and persistent initrd
File persistence through automatic folder-to-ISO injection
SMP &#x2F; multicore support
xHCI &#x2F; USB 3.0 support<p>It works on QEMU and on my HP 15s-eq2xxx laptop.<p>Some of the things I&#x27;m currently working on are USB storage, TCP, Wi-Fi and more hardware support.<p>Wi-Fi is one of the harder problems for me right now. My laptop uses a Realtek RTL8822CE, and there isn&#x27;t much information available about it.<p>The project is still very much a work in progress, but I&#x27;ve reached a point where I would like to have other people working on it with me. I&#x27;m especially interested in people who like operating systems, kernels, drivers, networking, Rust or low-level programming.<p>I&#x27;m also transparent about using AI during development. The source code is generated using language models based on my instructions. I handle the architecture design, debugging, hardware testing and integration myself.<p>There is also an English&#x2F;Spanish Discord server for the project if anyone wants to discuss development or contribute.<p>Discord:
<a href="https:&#x2F;&#x2F;discord.gg&#x2F;sEaB7KAwtr" rel="nofollow">https:&#x2F;&#x2F;discord.gg&#x2F;sEaB7KAwtr</a>

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49553980) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
