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

## Tech Stack

ESP32-class Wi-Fi microcontroller running C++ firmware.
One speaker protocol (Spotify Connect or AirPlay 2) chosen based on the target family setup.
A handful of large mechanical buttons on GPIO; no display.
3D-printed enclosure sized for a small hand.

## Architecture

Firmware splits into two modes: a one-time setup mode (driven by the parent's phone over a captive portal or Bluetooth) and a playback mode (driven only by the on-device buttons). After setup, the device boots straight into playback.

## Milestones

ESP32 prototype + chosen speaker protocol → button input + playback control → enclosure prototype → parental setup flow → small-batch build.

## Risks

Speaker protocol licensing (Spotify Connect, AirPlay 2) is the dominant cost and legal risk; safety certification for a child-handled device is a separate workstream that the post does not address.
