---
id: "3693"
slug: restore-real-urls-in-google-search-results
title: Restore real URLs in Google Search results
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49484118"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [JavaScript browser extension (Chrome MV3, Edge, Firefox WebExtension, Safari), Manifest V3 service worker, TypeScript]
---
# Restore real URLs in Google Search results

## Problem

In August 2026 Google confirmed a rollout that routes some Google Search result links through a server-side `google.com/goto?url=…` redirect instead of returning the page's real URL. The destination still opens, but the link users see, copy, hover-preview, paste into chat, or feed into a scraper is Google's passthrough URL — not the destination page. Search-industry reporting documented this on July 8, 2026, and observers connected the change to making automated result collection harder and to Google's stated "technical measures against abuse." For researchers, journalists, SEO analysts, and any power user who routinely copies links out of search, the visible link no longer reveals where the result actually leads, and the copied link breaks bookmarking, citation, and link-share workflows.

## Objective

Ship a cross-browser extension that detects Google `/goto?url=…` links on the live Search Results Page, resolves them to their real destination, and rewrites both the hover-preview URL and the URL placed on the clipboard so that what the user copies is the actual destination page. Extension must work on Chrome, Edge, Firefox, and Safari, ship as signed/notarized packages, and run with no telemetry and no middleman (the extension itself only pings Google's own `/goto` endpoint to resolve).

## Target Users

- Primary: power users of Google Search (researchers, journalists, analysts, developers) who copy search-result links into documents, chats, citation managers, or notes and need the link to be the real destination.
- Secondary: SEO and content teams that analyze Google results at volume and need destination URLs rather than `google.com/goto?…` wrappers in their data exports.
- Tertiary: privacy-conscious users who prefer the visible URL to reveal the destination before they click.

## MVP Scope

- Detection: scan Google Search result pages for any `a[href*="google.com/goto?url="]` element; resolve each to its destination.
- Rewrite: replace the `href` on each result anchor so hover-preview, "Copy link address", and middle-click-open all return the real URL.
- Toggle: a browser-action toolbar button that flips the rewrite on/off (blue "ON" badge when rewriting).
- Cross-browser packaging: Chrome MV3 (load-unpacked build), Edge MV3, Firefox WebExtension (signed), Safari (notarized).
- No telemetry, no remote endpoint other than Google's own `/goto` resolver, no middleman server.
- Single-user, single-device; no sync, no account, no settings beyond on/off.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Privacy posture is a feature: the extension must read only the current Google Search page and must only contact Google's own `google.com/goto?url=…` to resolve; no other network traffic.
- Cross-browser coverage is the headline claim: Chrome, Edge, Firefox, and Safari must all ship in v1, each with the appropriate signing/notarization (signed Firefox, notarized Safari).
- Author has not stated a price; extension is free, no paid tier in v1.
- Manifest V3 on Chromium browsers; the rewrite logic must work inside MV3's service-worker + content-script split without losing the on-page anchor rewrite after navigation events.
- Must not require any user account, sign-in, or background sync.
- The version published on GitHub Releases must include checksums so users can verify the package they install matches the published binary.
