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

## Problem

The title states the gap: a 4-year-old child cannot stream music to a speaker over Wi-Fi on their own — every current path requires a phone, a tablet, or extra screen time. The post gives no model number, no Wi-Fi protocol preference, no audio source preference, and no safety/regulatory detail; the only constraint is "no phone, no tablet, no extra screen time".

## Objective

Build a simple, child-operable hardware device that streams music to a speaker over Wi-Fi when a young child presses its buttons.

## Target Users

4-year-old children (per the title), used with parental setup. Secondary user: the parent who configures the device once and then leaves it alone.

## MVP Scope

A small Wi-Fi-connected device with one or two large physical buttons (play/pause, next track), no screen, no parental controls surface, that streams audio from a fixed source to a paired speaker. Setup happens on the parent's phone exactly once.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

Hardware safety for a 4-year-old (choking hazards, battery), Wi-Fi pairing flow that the parent can do but the child cannot break, and a music source the family already uses.
