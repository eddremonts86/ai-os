# SPEC.md — What Just Pinged Me?

## Problem

My wife kept getting some random-seeming notification sounds on her macbook that we couldn&#x27;t identify - a little quarter second &quot;bloop&quot; that would play and then go away without any trace we could find.<p>So I made (prompted) this app that will listen to the audio on the system and identify the sound. It will identify system sounds and use system logs to try to work out what caused it, it will tell you which apps were making sounds when the sound is played, it will look in app bundles for sound files that contain the sound it heard.<p>If the source is the web browser and you install the bundled browser extensions it will tell you the name of the tab that played it.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49689178)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-13T22:05:07Z

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
