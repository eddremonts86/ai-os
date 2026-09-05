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

## Problem

SaaS subscription cancellations today follow one of three paths and none of them give the operator useful answers. The Stripe-hosted portal asks one canned question, offers one coupon, and keeps the answer somewhere the operator is unlikely to look. The paid retention tools (Churnkey and similar, $250+/mo) require write access to the merchant's Stripe account before they will render a single screen, which is a long onboarding and a real security risk for the merchant. Or the operator ships a native `confirm()` dialog and loses the customer, the reason they left, and the one chance to offer them something. RetainFast's positioning is to sit between the "do nothing" path and the "expensive, high-trust path" by offering a script-tag widget that intercepts the merchant's existing cancel button, asks the one question the operator never gets answered, makes the right offer, and hands the outcome back to the merchant's own code. The widget never asks for a Stripe key, never holds a token, and never issues a refund on the merchant's behalf because it cannot — the merchant's backend stays the only thing that can move money.

## Objective

Build a drop-in widget SaaS for SaaS operators who want a real cancellation flow with reasons, offers, and analytics without handing Stripe write access to a third party.

## Target Users

Indie SaaS founders and small SaaS teams on Stripe who want better save-rate and reason data than a `confirm()` dialog, but who do not want to grant OAuth-scoped Stripe write access to a $250+/mo vendor.

## MVP Scope

The vendor's landing copy names three integration steps: paste the script tag with `data-retainfast` on the cancel button, build the flow in the dashboard (reasons, offers, copy, colour) with a live widget preview, and wire two callbacks — `onSave({offer})` to apply the offer through the merchant's own API and `onCancel({reason})` to cancel through the merchant's own API. The dashboard has a flow editor (add/remove/reorder reasons, attach offers per reason, pick accent colour), an analytics view (funnel from opened to saved, save rate per offer, reason breakdown, free-text reasons), shadow-DOM widget rendering, a zero-dependency vanilla JS payload under 5 KB gzipped, and quiet failure mode if the analytics endpoint is down. Pricing per the source is $25 intro then $12/month.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

The source is a landing page and an HN post. It does not name a specific SLA, a refund policy for the widget's own subscriptions, or a specific auth scheme for the merchant dashboard. The widget-side integration surface (`onSave`, `onCancel`, `data-retainfast`) is described in prose on the landing page but the post does not link a versioned API doc, so anything beyond the two callbacks should be treated as unverified.