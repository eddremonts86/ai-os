---
id: "4158"
slug: retainfast-cancellation-flow-widget-that-never-touches-
title: RetainFast – cancellation flow widget that never touches your Stripe
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49511987"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# RetainFast – cancellation flow widget that never touches your Stripe

## Tech Stack

The widget bundle is a single vanilla JS file under 5 KB gzipped with zero dependencies per the source; it mounts inside a Shadow DOM so merchant CSS cannot leak in and the widget's CSS cannot leak out. The dashboard (flow editor + analytics) is the React + TypeScript stack already in use in the AI-OS project, with the TanStack Start API, SQLite with Drizzle ORM for analytics storage, Coolify for deployment, and Docker for packaging. No Stripe SDK is required on the widget side because the widget never receives or stores a Stripe key.

## Architecture

Two surfaces: the widget script that merchants embed (a script tag with `data-key="rf_pub_xxx"` and `defer`, plus the `data-retainfast` cancel-button attribute and the `RetainFast.onSave`/`onCancel` callbacks) and the merchant dashboard (flow editor + analytics view). The widget fires analytics events to the vendor's API; the dashboard reads aggregated analytics from the same store. The merchant's own backend stays the only side that talks to Stripe.

## Milestones

Ship the widget bundle with the two callback contract (`onSave`, `onCancel`) and the Shadow-DOM isolation; ship the flow editor with reason list, per-reason offers, accent colour, and live preview; ship the analytics view with funnel, save-rate-per-offer, reason breakdown, and free-text reasons; publish the docs page with the three-step integration walkthrough; collect HN feedback and ship the intro pricing.

## Risks

Risk that the widget script CDN becomes a single point of failure for the merchant's billing page; mitigate with the quiet-fail behaviour the vendor describes (widget renders nothing on script failure rather than blocking the cancel button). Risk that a merchant's legacy CSS or aggressive CSP blocks the script; mitigate with documented CSP allow-list and the Shadow DOM isolation. Risk that expanding the dashboard features pushes payload size above 5 KB; mitigate by keeping dashboard code out of the widget bundle entirely.