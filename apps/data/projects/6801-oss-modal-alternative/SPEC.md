# SPEC.md — OSS Modal Alternative

## Problem

Our control plane has been public for a while, but I don&#x27;t think I ever posted it here. We&#x27;ve been working on AI infra for a few years, and have built a highly optimized set of primitives for GPU inference and sandboxes. This includes all sorts of bells and whistles like embedded CAS, a custom image format, multiple container runtimes supported (gVisor&#x2F;runc), and an opinionated python SDK. Totally self-hostable (of course, you&#x27;ll need to find some GPUs) on any k8s cluster with a helm chart.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49685152)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-13T15:34:24Z

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
