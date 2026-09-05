# SPEC.md — Come On, Blink, You Can Be Better

## Problem

I bought a couple of Blink cameras and a doorbell and installed them around our house for security. I tried the subscription during the free trial, but decided not to continue. Eventually, I bought an SD card and started recording locally instead.<p>But here’s my problem: Blink cameras detect motion and then record the next few seconds after sensing any motion. They don’t offer continuous recording. I understand that these cameras are battery-powered, so constant recording would quickly drain the battery. That makes sense.<p>But I’m willing to use a power cable instead of batteries. Even then, Blink doesn’t allow continuous recording.<p>I don’t understand why.<p>The camera is constantly monitoring the view through its lens to detect motion. If it is already processing what the camera sees, why can’t it simply record the video continuously? Why can’t it perform this seemingly simple task?<p>Come on, Blink. You can be better than this.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49553009)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-03T16:49:03Z

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
