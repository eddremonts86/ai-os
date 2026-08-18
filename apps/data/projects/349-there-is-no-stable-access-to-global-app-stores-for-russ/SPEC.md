---
id: "349"
slug: there-is-no-stable-access-to-global-app-stores-for-russ
title: There is no stable access to global app stores for Russian developers
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/legal/jg3la3g2k1-there-is-no-stable-access-to-global-app"
category: legal
date: "2025-10-29"
tags: [Legal]
country: Russia
tech: [Next.js, Playwright / puppeteer (monitoring), Postgres, Telegram Bot API, Cloudflare Workers]
---
# There is no stable access to global app stores for Russian developers

## Problem

A Russian app developer trying to publish or update a mobile app on Google Play or Apple App Store is running into account closures, payout freezes, and review delays that have been the operating reality since 2022. The poster describes a situation where the global app stores are not stable distribution channels for Russian developers, and the alternative distribution paths (RuStore, Huawei AppGallery, Xiaomi GetApps) are real but require extra setup and offer less reach.

## Objective

Ship a Russian-app-developer distribution console that, given one app, publishes and updates it across Google Play (where the developer remains eligible), RuStore, Huawei AppGallery, Xiaomi GetApps, and a one-click APK download page, with one release artifact and a status board for each store.

## Target Users

- Russian indie mobile developers shipping on Android and iOS.
- Russian mobile-app studios with 3-20 simultaneous titles that need multi-store publishing.
- Russian-developed apps with international reach that need a stable non-Google fallback distribution path.

## MVP Scope

- One release artifact: signed AAB + APK; per-store metadata overrides.
- Per-store publish: Google Play (where eligible), RuStore, Huawei AppGallery, Xiaomi GetApps.
- One-click APK download page hosted on a Russian edge (Cloudflare or a Russian CDN) for users without store access.
- Status board per store: review state, version, last published date.
- Store-monitoring watchdog: weekly probe of each store page; alert if listing vanishes or version falls behind.
- No iOS distribution path beyond the developer's existing Apple Developer account; that channel is admin-only.
- No proxy or anonymizing layer for stores that block such techniques; honesty with the store is the policy.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/legal/jg3la3g2k1-there-is-no-stable-access-to-global-` follows the constraints in `349-.../SPEC.md` and the chosen stack (Next.js, Playwright / puppeteer (monitoring), Postgres). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Per-store publish uses each store's official CLI/API; no scraping for publish.
- Monitoring only via public store listing endpoints; no scraping of review queues.
- Russian-developer accounts only; no reselling of publishing as a service to non-Russian accounts.
