---
id: "219"
slug: need-a-smart-device-that-automatically-detects-pigeons-
title: Need a smart device that automatically detects pigeons and permanently deters them. Everything on the market is one-shot or habituation-prone.
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/"
category: iot
date: "2026-02-23"
tags: [IoT, Hardware, Environment]
country: France
tech: [Python, YOLOv8, Raspberry Pi, LoRa, ESP32, Next.js]
---
# Need a smart device that automatically detects pigeons and permanently deters them. Everything on the market is one-shot or habituation-prone.

## Tech Stack

Python for the on-device logic. YOLOv8 fine-tuned on pigeon vs other birds. Raspberry Pi 5 or equivalent for the CPU. ESP32 for the sensor and actuator control. LoRa for the optional multi-device mesh. Next.js for the user dashboard. Local-only mode for the privacy-conscious.

## Architecture

Camera frame → YOLOv8 → pigeon detection → randomised deterrent (sound/light/motion/water) → log → adaptive schedule per time-of-day. Solved locally on the device. Dashboard pulls logs via Wi-Fi.

## Milestones

M0 — pigeon-vs-other-bird classifier at 90% accuracy. M1 — device prototype with sound + light. M2 — water sprayer option. M3 — 10 sites in pilot across France. M4 — public launch with a clear 'no habituation' claim.

## Risks

Bird-classification model may misclassify a small bird as a pigeon. Randomised deterrent may still habituate over months. Legal risk if water spray or sound exceeds local nuisance limits. Hardware failures in the field require a service loop. Power budgeting for solar deployment is non-trivial.

## Data Model

## Integrations

Python for the on-device logic. YOLOv8 fine-tuned on pigeon vs other birds. Raspberry Pi 5 or equivalent for the CPU. ESP32 for the sensor and actuator control. LoRa for the optional multi-device mesh. Next.js for the user dashboard. Local-only mode for the privacy-conscious.
