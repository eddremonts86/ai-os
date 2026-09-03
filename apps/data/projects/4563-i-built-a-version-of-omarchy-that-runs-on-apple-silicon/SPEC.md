# SPEC.md — I built a version of Omarchy that runs on Apple Silicon

## Problem

I wanted to try out Omarchy before doing a full install, but I only have an M series MacBook so I would have to find a laptop and there&#x27;s no official M support yet.<p>So I decided to create something that allows people to test and run Omarchy on their devices so they can understand how it feels.<p>So I built an app that allows you to run Omarchy Quattro as a native, hardware-accelerated app on your Apple Silicon Mac!<p>It uses QEMU and Apple&#x27;s HVF, a custom built Omarchy ARM image, a swift app enclosing it, and custom patches on Omarchy, QEMU, Hyprland and more.<p>I tried many things, and this approach achieved the best results. The native keyboard experience with Super shortcuts works very well, along with all the rest.<p>It supports any resolution (fixed ratio), retina or non retina displays, audio input &#x2F; output devices, shared clipboard, and many other features.<p>Since it runs on top of macOS, native features like universal clipboard and AirPods work smoothly.<p>It takes ~3min to install, works the same as any other standard macOS app.<p>The whole project is open source, so feel free it check it out on GitHub, install, PRs, etc.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49539913)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-02T17:54:32Z

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
