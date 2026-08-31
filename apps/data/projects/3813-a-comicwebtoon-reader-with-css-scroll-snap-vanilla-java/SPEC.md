---
id: "3813"
slug: a-comicwebtoon-reader-with-css-scroll-snap-vanilla-java
title: "A comic/webtoon reader with CSS scroll-snap, vanilla JavaScript"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49495856"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Vanilla JavaScript, CSS scroll-snap, static hosting on Netlify, client-side theming, demo content catalog, browser reader UI]
---
# A comic/webtoon reader with CSS scroll-snap, vanilla JavaScript

## Problem

The capture is a URL-only Show HN by EditArteSoy pointing at a Netlify demo; the post text is just the link, so the product claim is the title. The demo identifies itself as MotionPanel, a "cinematic comic reading platform". Its interface (largely in Portuguese) shows a rated catalog with reading and like counters — 4.8 stars, 1.2k readings, 342 likes — a Studio section for the reader's own works, and a settings panel covering language, accent color, app background, card background, main text color and a library background image with a darkening control to keep text legible. Demo works ship in the catalog and can be hidden from view while staying in the code. The title supplies the technical core: the reading experience is built on CSS scroll-snap with vanilla JavaScript — no framework — which is the engineering claim worth inspecting, since webtoon readers usually need continuous vertical scrolling, page snapping and fast image handling all at once.

## Objective

Build out the reader's core loop — smooth, snapped, cinematic reading of comic and webtoon content — in dependency-free vanilla JS, with the catalog, studio and theming surfaces shown in the demo as the surrounding product.

## Target Users

- Webtoon and comic readers who want a fast, cinematic scrolling experience in the browser.
- Creators (the Studio section) who upload and present their own works.
- Developers evaluating a framework-free implementation of scroll-snap reading.

## MVP Scope

- A CSS scroll-snap-based reading view for comic and webtoon pages, vanilla JS only.
- A catalog of demo works with rating, reading and like counts displayed.
- Studio section for the user's own works.
- Settings: language, accent color, app, card and text backgrounds, library background image with darkening control.
- Toggle to hide demo works from the catalog without removing them from the code.

## Constraints

- No framework: the title's "vanilla JavaScript" is a stated constraint, so dependencies must be justified or absent.
- The capture is URL-only; product specifics come from the linked demo's visible UI and the title, nothing more.
- Static hosting on Netlify implies a client-side product; there is no backend described anywhere in the capture.
- The UI text being Portuguese suggests a Brazilian-first audience; nothing in the capture states a language roadmap.

## Design Direction

See `DESIGN.md` for this project's design tokens.
