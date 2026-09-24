# SPEC.md — CUDA/graphics in QEMU-KVM VMs without passing the Nvidia card to them

## Problem

Hi HN. I built this because I wanted a VM with a real GeForce GPU without losing the card on my desktop.<p>It allows you to run CUDA and graphics in VMs without VFIO&#x2F;vGPU by forwarding the NVIDIA driver&#x27;s own ioctl surface from the guest to the host.<p>That means stock libcuda and real Vulkan ICD run in the guest - no CUDA&#x2F;Vulkan API remoting or translation. Display, LLM, CUDA, headless supported. Your desktop keeps using the same card, multiple VMs supported.<p>Happy to go into the details of the architecture.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49609389)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-08T12:25:31Z

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
