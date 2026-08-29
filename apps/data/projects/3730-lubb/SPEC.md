---
id: "3730"
slug: lubb
title: Lubb
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/lubb-heartbeat-for-sleep"
category: product-launch
date: "2026-08-25"
tags: [ProductHunt, Product Launch]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Lubb

## Problem

Most heartbeat and sleep apps fall into one of two camps: white-noise libraries, or sleep trackers that measure how you slept after the fact. The maker of Lubb is targeting a third case: people who want a calmer way to fall asleep on a night they are alone, missing someone, or simply agitated, and who find that ambient sound makes the room feel busier rather than calmer. The ProductHunt listing pitches Lubb as a "dedicated heartbeat companion" built around the iPhone's Taptic Engine: instead of producing noise, it produces a slow, realistic lub-dub haptic the user slides under the edge of their pillow. The maker cites Dr. Bruce Perry on patterned sensory stimulation ("brings the body back to a calm state that allows the brain to function most...") as the rationale for a quiet, rhythmic, physical cue rather than another soundscape. The implicit gap in the market is that no mainstream sleep app treats tactile rhythm as the primary sleep-onset stimulus — current options are either audio-first, screen-first, or sensor-first, and a haptic-only product is small enough to slot in for a user who already owns an iPhone.

## Objective

Ship an iOS sleep app whose entire surface is a single haptic heartbeat the user can tune and tuck under their pillow. The MVP is the Lubb app as described in the ProductHunt listing: Taptic-Engine-driven lub-dub, tunable pace and feel, free 10-minute nightly trial, no account, no subscription shown in the listing. The product's job is to give the user a private, low-distraction, non-audio way to fall asleep, not to measure, score, or coach them.

## Target Users

- **Primary:** adults who sleep (or try to sleep) alone — whether due to travel, a partner away, bereavement, separation, or simply being single — and who want a calm, non-audio companion at night.
- **Secondary:** anxious sleepers for whom audio sleep apps (rain, brown noise, lofi) feel overstimulating or who share a room and cannot play sound; they want a tactile cue only they can feel.
- **Tertiary:** couples in long-distance relationships who use a shared rhythm as a low-bandwidth "presence" signal at bedtime.

## MVP Scope

- An iOS app (built per the listing with Remotion in the maker's stack — listed under "Built With"; treat that as maker tooling, not necessarily the shipped runtime) that drives the iPhone Taptic Engine at a slow, repeating heartbeat cadence.
- A "lub-dub" pattern the user can adjust for pace (beats per minute) and feel (intensity / sharpness of the haptic transient).
- A 10-minute nightly free trial that auto-stops, after which the user can start a paid session (the listing marks the app as "Free"; the gating mechanic beyond the trial is not described in the source).
- A "slide under the pillow" affordance: the UI assumes the phone is face-down with a timer / minimal screen so the user is not staring at the screen.
- No account, no email signup, no analytics, no login wall — per the listing.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The product is haptic, not audio: the entire UX must communicate "this is felt, not heard." No loops, no music, no voice.
- Free-tier ceiling is set by the listing (10-minute nightly trial); monetization beyond the trial is not stated in the source and is left as `wtp: absent` rather than invented.
- The product assumes an iPhone with a Taptic Engine (iPhone 7 and newer in practice). iPad support is plausible but not stated in the source.
- No account means no cloud sync of settings; preferences either stay on-device or are acceptably lost on reinstall.
- Safety: do not allow the haptic to start without the user explicitly tapping a "start" button, so the phone is not buzzing unattended in a bag or pocket.
