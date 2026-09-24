# SPEC.md — Video uploader for React/RN – drop in or headless UI, any back end

## Problem

Universal Video Uploader is an open source React&#x2F;React Native component library for adding video upload flows to your app. It handles the UX and background mechanics for single or multi-video upload flows: upload state, file queue, concurrency, per-file progress, abort&#x2F;retry, validation, and backend communication for async processing.<p>It comes with a composable and customizable UI, or you can go headless and use the core hooks to build your own. You can connect it to any backend via the adapter interface, and it ships with a prebuilt adapter for Hyperserve (a video backend API I built).<p>I&#x27;ve had to build this kind of thing a few times and it&#x27;s more complex than it seems, I wanted to try making something drop in that is still flexible and comprehensive. I&#x27;m currently using it as the dashboard uploader for Hyperserve and so far it&#x27;s working great.<p>Try it at <a href="https:&#x2F;&#x2F;videouploader.fyi" rel="nofollow">https:&#x2F;&#x2F;videouploader.fyi</a>. There&#x27;s full docs with live demos for every component, plus working Next.js and Expo examples you can run. I&#x27;d appreciate any feedback on it if you have any!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49741778)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-17T14:56:43Z

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
