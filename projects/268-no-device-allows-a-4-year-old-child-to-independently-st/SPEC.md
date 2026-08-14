---
id: "268"
slug: no-device-allows-a-4-year-old-child-to-independently-st
title: "No device allows a 4-year-old child to independently stream music to a speaker over Wi-Fi without using a phone, tablet, or increasing screen time"
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/hardware/eopralbt51-no-device-allows-a-4-year-old-child-to-i"
category: hardware
date: "2025-12-15"
tags: [Kids, Other]
country: Norway
tech: [ESP32-S3, C++ (Arduino / ESP-IDF), Spotify Connect SDK, Apple AirPlay 2 (Shairport-sync), "3D-printed enclosure", Wi-Fi provisioning via BLE]
---
# No device allows a 4-year-old child to independently stream music to a speaker over Wi-Fi without using a phone, tablet, or increasing screen time

## Problem

In Norway (and many similar markets) a parent cannot hand a 4-year-old a device that lets them pick a song and stream it to the home speaker over Wi-Fi without also giving them a phone or tablet, which the parent wants to avoid because of screen time. The poster wants a physical, no-screen device that a small child can operate independently.

## Objective

Ship a small physical device with a few large, tactile buttons (e.g. 6 song tiles) that, when pressed, streams a pre-assigned song or playlist to the home Wi-Fi speaker via Spotify Connect or AirPlay 2. No screen, no phone, no tablet.

## Target Users

Norwegian parents of small children (3-6 years) who want their child to be able to play music independently without screen exposure. Grandparents buying gifts. Daycare centres and preschools.

## MVP Scope

Hardware device with 6 large tactile buttons, each pre-bound to a Spotify playlist or song chosen by the parent via a simple BLE-provisioning app. Spotify Connect integration (AirPlay 2 in v2). Companion parent app for binding buttons to songs and Wi-Fi setup. 3D-printed enclosure.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/hardware/eopralbt51-no-device-allows-a-4-year-old-chi` follows the constraints in `268-.../SPEC.md` and the chosen stack (ESP32-S3, C++ (Arduino / ESP-IDF), Spotify Connect SDK). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Norway.

For Norway, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Must be operable by a 4-year-old with no reading required (large icons or NFC tiles). Must be safe for small children (no small parts, no sharp edges, food-grade or similar plastics). Must work without internet after initial setup.
