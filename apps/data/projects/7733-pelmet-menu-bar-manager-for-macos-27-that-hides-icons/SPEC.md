# SPEC.md — Pelmet – menu bar manager for macOS 27 that hides icons on demand

## Problem

Hey, super happy to share about Pelmet, a macOS menu bar manager. It started as a side project during macOS 27 beta and just passed over 500 stars on GitHub and 5000+ downloads in a few weeks. This is crazy to me!<p>Since macOS completely changed the menubar architecture in macOS 27 the tools I was using were no longer working at the time, so I decided to build my own. Hadn&#x27;t build an app in over a decade and things have changed so much since. I&#x27;m a design director so of course special attention went in the user experience and aesthetics (Settings with previews, subtle reveal animations, drag&amp;drop and much more)<p>So macOS now knows how to hide icons natively, it does it when a Mac is locked down for an exam for example, Pelmet reuses the hiding part which then lets macOS know which icons should stay visible. The app does call on a private framework (MenuBarClientCore) resolved at runtime and has a safety net in case it fails, it reports hiding is unavailable instead of breaking the bar. Everything else (positions, clicks, previews, etc.) uses public APIs (Accessibility, ScreenCaptureKit).<p>I&#x27;m amazed with the reception Pelmet got, seems I wasn&#x27;t alone to want a simple menu bar tool that does one thing, and (hopefully) does it well ;) Pelmet was built in native Swift, requires no accounts, no analytics, it&#x27;s just private. Only external call it does is Sparkle for its updates. 
The project is free and open source (GPLv3) and hopefully makes many people happy.<p>Get the calm back in your menu bar and happy to answer questions

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49742398)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-17T15:37:14Z

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
