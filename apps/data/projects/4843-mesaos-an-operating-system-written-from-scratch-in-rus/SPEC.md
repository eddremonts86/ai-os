# SPEC.md — MesaOS – An operating system written from scratch in Rust

## Problem

Hello! I&#x27;m a student from Spain and I&#x27;m the creator of MesaOS, an open-source operating system written from scratch in Rust for x86_64.<p>I&#x27;ve been working on it mostly by myself.<p>MesaOS currently has:<p>A hybrid kernel
Preemptive multitasking
A Linux driver shim with 400+ exported kernel symbols (still in development)
HDA audio and WAV streaming
A shell with around 82 commands
VFS, RamFS and persistent initrd
File persistence through automatic folder-to-ISO injection
SMP &#x2F; multicore support
xHCI &#x2F; USB 3.0 support<p>It works on QEMU and on my HP 15s-eq2xxx laptop.<p>Some of the things I&#x27;m currently working on are USB storage, TCP, Wi-Fi and more hardware support.<p>Wi-Fi is one of the harder problems for me right now. My laptop uses a Realtek RTL8822CE, and there isn&#x27;t much information available about it.<p>The project is still very much a work in progress, but I&#x27;ve reached a point where I would like to have other people working on it with me. I&#x27;m especially interested in people who like operating systems, kernels, drivers, networking, Rust or low-level programming.<p>I&#x27;m also transparent about using AI during development. The source code is generated using language models based on my instructions. I handle the architecture design, debugging, hardware testing and integration myself.<p>There is also an English&#x2F;Spanish Discord server for the project if anyone wants to discuss development or contribute.<p>Discord:
<a href="https:&#x2F;&#x2F;discord.gg&#x2F;sEaB7KAwtr" rel="nofollow">https:&#x2F;&#x2F;discord.gg&#x2F;sEaB7KAwtr</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49553980)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-03T17:56:50Z

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
