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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/268-no-device-allows-a-4-year-old-child-to-independently-st/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] ESP32-S3 firmware: button-press handler, Spotify Connect client
- [ ] BLE provisioning and Wi-Fi setup flow
- [ ] Parent app (React Native) with song-to-button binding
- [ ] 3D-printed enclosure prototype (food-grade plastics)
- [ ] Button hardware design (large, tactile, child-safe)
- [ ] Diagnostics and firmware-update backend
- [ ] Pilot run of 50 devices for Norwegian families
- [ ] CE / EMC certification path

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (ESP32-S3, C++ (Arduino / ESP-IDF), Spotify Connect SDK) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 268-no-device-allows-a-4-year-old-child MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Norway completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for ESP32-S3, C++ (Arduino / ESP-IDF), Spotify Connect SDK errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
