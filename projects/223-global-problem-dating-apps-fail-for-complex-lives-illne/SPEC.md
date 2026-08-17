---
id: "223"
slug: global-problem-dating-apps-fail-for-complex-lives-illne
title: "Global problem: Dating apps fail for complex lives (illness, relocation, unfulfilled youth). A platform built for those still in motion does not exist."
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/"
category: social
date: "2026-02-11"
tags: [Social, Dating, Health]
country: Russia
tech: [Flutter, Python, FastAPI, PostgreSQL, Redis, MinIO]
---
# Global problem: Dating apps fail for complex lives (illness, relocation, unfulfilled youth). A platform built for those still in motion does not exist.

## Problem

A user in Russia who has had a complex life — chronic illness, relocation, periods of being outside the workforce — finds that mainstream dating apps (Tinder, Bumble, Hinge) describe them as a bad match on first sight. The profile is a series of gaps, the photos are unflattering, the bios either humiliate or hide what is actually true. People in this situation retreat to niche communities (Reddit, Discord) where the dating conversation is real but the discovery layer is non-existent. What is missing is a date-friendly platform that treats complex lives as the centre, not the edge — where the profile is a story, not a credential, and the matching logic respects context, not just chemistry.

## Objective

A dating platform for people whose lives do not fit the default profile — chronic illness, recovery, relocation, career changes, late-realisation queerness, parenting kids from a previous relationship — where the profile is a structured story and the matching logic ranks by context fit, not just proximity.

## Target Users

Adults in Russia and the EU who feel that mainstream dating apps exclude them by their very profile. Also users in recovery, single parents, late-realisation LGBTQ+, and people returning to dating after a long absence.

## MVP Scope

Flutter app with a structured story profile (not a single bio). Context tags (illness, recovery, single parent, returning, etc.). Matching logic that weights context fit. End-to-end encrypted messages. No video call in v1. No swipe-deck in v1 — discovery by story feed.

## Design Direction

Design direction for the MVP at `` follows the constraints in `223-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Profile data must be explicit-consent per field. E2E encryption for messages. No third-party trackers. Profile must be deletable within 24 hours of account close. No paid promotion of a profile.
