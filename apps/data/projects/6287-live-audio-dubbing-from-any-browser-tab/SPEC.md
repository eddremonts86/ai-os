# SPEC.md — Live audio dubbing from any browser tab

## Problem

Hey HN, at Pinch we&#x27;ve been working on something to reduce friction to getting accurate, fast audio translation for live media.<p>Initially we launched a desktop app that sat between your hardware mic&#x2F;speakers and your meeting platform, but this required users to install our audio driver which introduced permissions hoops to jump through as well as stability issues across updates, not to mention trying to get our device driver approved by Microsoft..<p>So today we&#x27;re launching Pinch Sidecar, which offers speech to speech translation in-browser for any Chrome browser tab.  This is accomplished by sharing the tab audio with our page, where we proceed to mute the original tab and mix in our translated audio with speaker-matched voices.<p>We also offer meeting creators using Google Meet, Zoom, or Teams the ability to host a translated meeting where listeners can listen and interact in their own language through our Sidecar.<p>The tab translation mode is open for free testing for this HN launch.  Our ask is just to let us know how it goes, and to share the link to anyone you know organizing multilingual webinars&#x2F;meetings.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49649066)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-10T19:28:47Z

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
