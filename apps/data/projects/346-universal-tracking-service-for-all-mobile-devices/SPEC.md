---
id: "346"
slug: universal-tracking-service-for-all-mobile-devices
title: Universal tracking service for all mobile devices
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/other/kiv6i361e1-universal-tracking-service-for-all-mobil"
category: other
date: "2025-10-29"
tags: [Other]
country: Russia
tech: [React Native (background service), Native iOS (Significant Location Change) + Android (Fused Location Provider), Apple Push + FCM, Postgres + TimescaleDB, Telegram Bot API]
---
# Universal tracking service for all mobile devices

## Problem

A Russian user - for fleet, child-safety, or own-lost-device reasons - wants a single tracking service that works on iOS, Android, smartwatches and a small hardware tag, with one account, one dashboard, and predictable battery cost. Today they cobble this together from vendor-specific services, none of which interoperate, and each of which battery-drains for a different reason.

## Objective

Ship a universal tracking service for Russian users that supports iOS, Android, Garmin / Wear OS watches, and a small hardware tag, sharing one account, one map view and one alert model - with a battery-cost ceiling of 5%/day on a typical phone.

## Target Users

- Russian families tracking children, parents or elderly relatives on a single shared map.
- Russian fleet operators with mixed iOS / Android / hardware-tag devices.
- Russian individual users who want a 'find my stuff' service for phone, watch, keys and bag.

## MVP Scope

- iOS app: Significant Location Change path; background fetch; battery <= 5%/day.
- Android app: foreground + background service; Fused Location Provider with balanced accuracy.
- Watch ingest: Garmin + Wear OS companion apps; location stored on the phone.
- Hardware tag: BLE-tracked, last-seen location uploaded when the phone passes.
- Shared map view with geofence alerts (enter/exit) and SOS button (long-press).
- Telegram bot for alert routing (push + Telegram).
- Privacy: per-device granularity, no analytics resale, all data in RU region.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/other/kiv6i361e1-universal-tracking-service-for-all-m` follows the constraints in `346-.../SPEC.md` and the chosen stack (React Native (background service), Native iOS (Significant Location Change) + Android (Fused Location Provider), Apple Push + FCM). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Russian data-residency: storage in RU-based Postgres / object storage.
- iOS Significant Location Change path is the only power-efficient path; foreground-only location will not pass the battery gate.
- Per-account device limit: 10 devices; 2 family members per account in free tier.
