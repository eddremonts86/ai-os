# SPEC.md — How is AWS console so broken?

## Problem

A small rant, after painful user experience. I admit I visited it after a while spending on GCP space, but the console looks like it is either not maintained at all, or individual teams just throwing stuff at it and causing a mess.<p>My simple workflow - I want to copy millions of objects from one bucket in us-east-1 to us-west-1<p>1. I can kick off the replication rule. but oh wait, there is no monitoring, unless you select it in edit rules. Even then, the experience is broken and I have now no idea if anything is happening in the background.<p>2. There is batch operation. It doesn&#x27;t work. If I select source region for aws console, I can&#x27;t see destination region bucket to execute copy batch. Vice-a-versa, if I select destination region, I can&#x27;t select any buckets from the source region.<p>I can perhaps use a CLI, which is a long list of instructions to follow and execute without pulling my hair out.<p>I asked claude code to just figure out out to create a job and execute it and tell me the state. It didn&#x27;t even hesitate.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49531472)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-02T03:45:54Z

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
