---
id: "3882"
slug: "i-built-a-physical-dream-machine-for-my-wife"
title: "I built a physical dream machine for my wife"
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

## Problem

The capture is a URL-only Show HN post linking to a tweet: the poster built a physical dream machine for his wife. The author's reply in the thread describes how it works: press and hold the button, which wakes up the microphone; she describes the dream; OpenRouter transcribes it and an image-generation model renders it; the result is shown on the e-ink display and made into a postcard for the website. A commenter on the thread asked exactly the question the capture leaves open — whether the device somehow reads the dream from her head, or she describes it aloud — and the author answered: she describes it.

## Objective

Complete the dream machine as a finished physical artifact: a button-operated bedside device that records a spoken dream description, transcribes it, renders an illustration, shows it on the e-ink display and turns it into a web postcard. The MVP is the working device as described, built and operating for the author's wife.

## Target Users

- The author's wife — the named first user the machine was built for.
- Makers who want a blueprint for a voice-capture plus image-generation gadget with an e-ink display.
- Anyone keeping a dream journal who prefers speaking a description over typing it.

## MVP Scope

- Press-and-hold button waking a microphone for a spoken dream description.
- OpenRouter transcription plus image generation from the description.
- E-ink display showing the rendered illustration.
- Postcard rendered to the website from each captured dream.

## Constraints

- The dream is described aloud, not read from the head — the author corrected that assumption in the thread.
- The capture is a title plus a tweet link; the only product detail comes from the author's reply.
- Hardware specifics beyond button, microphone and e-ink display are not stated.
- This is a personal build for one user; no commercial intent is claimed.

## Design Direction

See `DESIGN.md` for this project's design tokens.
