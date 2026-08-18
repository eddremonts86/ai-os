---
tags: ["saas", "developer-tools", "feedback", "changelog"]
tech: ["Next.js", "TypeScript", "Vanilla JS", "Supabase", "Stripe"]
id: "610"
slug: how-do-you-handle-product-updates-for-users-like-change
title: How do you handle product updates for users? Like changelog and stuff?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vp1yfn/how_do_you_handle_product_updates_for_users_like/"
category: saas
date: "2026-08-15"
---
# How do you handle product updates for users, like changelog?

## Problem

A founder using AI coding tools (Cursor, Claude Code) is shipping features and fixes faster than before, but everything around the actual product — announcing the changes, getting feedback, knowing who is affected — has become the bottleneck. They started paying attention to the small SaaS tools they use day-to-day and noticed many do not handle product updates well. The implicit product: a lightweight in-app changelog + feedback widget for small SaaS products, designed to fit into the founder's shipping pace.

## Objective

Define the MVP scope for an in-app changelog + feedback widget that small SaaS products can drop into their app: a per-product feed, a feedback widget, and a "you are affected" indicator for known issues.

## Target Users

- **Primary:** indie SaaS founders shipping multiple times a week who need an in-app announcement surface.
- **Secondary:** small SaaS teams (2-5 engineers) who want a structured changelog without running a blog.
- **Tertiary:** SaaS users who want a single place to see what's changed.

## MVP Scope

- In-app widget: a small bell icon in the app's chrome that opens a per-product feed.
- Per-product changelog: the founder posts a changelog entry, the widget shows it to the right users.
- Feedback widget: a small "?" icon that opens a feedback form, posts to the founder's dashboard.
- "You are affected" indicator: when a known issue matches the user's environment, the widget surfaces it.
- Free tier: 1 product, 50 changelog entries/month, 100 feedback submissions/month. Pro at $29/month: 5 products, unlimited entries + submissions.
- Excluded in v1: AI-summarised changelogs, customer-segment-targeted announcements, native mobile widget.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single founder dashboard — the changelog composer on the left, the feedback inbox in the centre, the "you are affected" rules on the right. The in-app widget is a minimal bell icon. No marketing-site chrome; the product is the bell.

## Constraints

- The in-app widget must add less than 20KB to the host app's bundle.
- The widget must work without cookies (privacy-respecting by default).
- The founder's dashboard must not require the founder to set up an account on every host app; one account, many apps.
