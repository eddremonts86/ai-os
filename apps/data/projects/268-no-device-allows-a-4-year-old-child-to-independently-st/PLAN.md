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

## Tech Stack

ESP32-S3 microcontroller for the device firmware (chosen for Wi-Fi + BLE + sufficient flash for audio protocols). C++ with ESP-IDF or Arduino framework. Spotify Connect SDK for streaming; AirPlay 2 via Shairport-sync as v2. 3D-printed enclosure designed in Fusion 360. BLE-based Wi-Fi provisioning. Companion parent app in React Native for iOS / Android.

## Architecture

Three pieces: the ESP32-S3 firmware (button-press handler, Wi-Fi station, Spotify Connect client), the parent app (BLE provisioning, song-to-button binding), and a small backend (optional, for firmware updates and diagnostics).

## Milestones

M1: ESP32-S3 firmware with Spotify Connect streaming on button press. M2: BLE provisioning and Wi-Fi setup. M3: Parent app with song-to-button binding. M4: 3D-printed enclosure prototype. M5: Pilot with 20 Norwegian families.

## Risks

Spotify Connect SDK licensing terms need review. AirPlay 2 licensing requires certified modules. BOM cost vs. retail price must hit a viable margin. Hardware certification (CE, EMC) for the EU market.
