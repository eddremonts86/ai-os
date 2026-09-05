---
id: "3882"
slug: i-built-a-physical-dream-machine-for-my-wife
title: I built a physical dream machine for my wife
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49498469"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Embedded button and microphone, E-ink display, OpenRouter transcription, Image generation model, Postcard rendering, Web publishing]
---
# I built a physical dream machine for my wife

## Tech Stack

- **Embedded button and microphone:** the physical input path, wake-on-press-and-hold.
- **E-ink display:** the output surface for the rendered illustration.
- **OpenRouter transcription:** speech-to-text for the dream description.
- **Image generation model:** turns the transcribed description into an illustration.
- **Postcard rendering:** each dream becomes a postcard image.
- **Web publishing:** postcards land on the website.

## Architecture

- **Input layer:** the button wakes the microphone and records the spoken description.
- **Processing layer:** OpenRouter transcribes the audio, then an image model renders the illustration.
- **Output layer:** the illustration shows on the e-ink display and is rendered as a postcard for the website.

## Milestones

1. **M0 — Capture.** Press-and-hold button records a spoken dream description reliably.

2. **M1 — Render.** Transcription via OpenRouter and illustration via the image model work end to end.

3. **M2 — Display.** The illustration lands on the e-ink display.

4. **M3 — Postcards.** Every dream is published as a postcard on the website.

## Risks

- **API dependence:** transcription and image generation rely on OpenRouter staying available and affordable.
- **Single-device fragility:** there is one machine and one user; a broken component ends the whole system.
- **E-ink constraints:** refresh rate and color depth limit what the illustration can show.
- **Expectation drift:** people may expect the device to read dreams, which the author explicitly says it does not.
