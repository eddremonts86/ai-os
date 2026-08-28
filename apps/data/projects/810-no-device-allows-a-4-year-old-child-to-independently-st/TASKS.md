---
id: "810"
slug: no-device-allows-a-4-year-old-child-to-independently-st
title: "No device allows a 4-year-old child to independently stream music to a speaker over Wi-Fi without using a phone, tablet, or increasing screen time"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/hardware/eopralbt51-no-device-allows-a-4-year-old-child-to-i"
category: hardware
date: "2025-12-15"
tags: [Hardware, Other]
country: Norway
tech: [ESP32, C++, Spotify Connect SDK, AirPlay 2, "3D-printed enclosure"]
---
# No device allows a 4-year-old child to independently stream music to a speaker over Wi-Fi without using a phone, tablet, or increasing screen time

## Phase 0: Scaffold

- [ ] Pick ESP32 dev board and audio protocol
- [ ] Breadboard the buttons and a status LED
- [ ] First firmware: connect to Wi-Fi, register as a speaker
- [ ] Parental setup flow (phone-driven)

## Phase 1: Core

Implement button-driven playback (play/pause and next), persistent Wi-Fi credentials, and a 3D-printed enclosure sized for a small hand.

## Phase 2: Deploy

- [ ] CE / safety review for child-handled electronics
- [ ] Small-batch assembly
- [ ] Ship to a handful of test families
