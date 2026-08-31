---
id: "3827"
slug: live-ai-video-streams-that-write-themselves-one-shot-at
title: Live AI video streams that write themselves one shot at a time
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49493966"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Generative video model inference, shot-by-shot generation loop, HLS streaming pipeline, prompt queue, GPU backend, web player]
---
# Live AI video streams that write themselves one shot at a time

## Problem

The capture is a URL-only Show HN: the post body contains nothing but a link to tv.mormon.garden, and the product claim is carried entirely by the title — "Live AI video streams that write themselves one shot at a time." What is verifiable from the capture: the submission is a Show HN by the user mormonnegro pointing at that stream URL, and the title asserts an endless live video stream in which AI writes each shot as it airs. No implementation, generation model or cadence is stated anywhere in the post.

## Objective

Turn the title into a testable product shape: a live, continuously playing AI video stream whose shots are generated sequentially — one shot at a time — and served at a public URL where viewers can watch whatever the generator writes next.

## Target Users

- Viewers of ambient or generative AI video who want an always-on stream.
- People curious about generative video as live entertainment.
- Builders exploring whether continuous generation can be packaged as a TV-like channel.

## MVP Scope

- A public web page playing a live-style video stream.
- A generation loop that writes one shot at a time and queues it for playback.
- Continuous playback: when one shot ends, the next one airs.
- Internal prompt direction only — the capture says nothing about viewer input.

## Constraints

- The capture is a URL only; everything beyond the title is inference about an unverifiable product.
- "Live" is bounded by generation speed: a shot cannot air faster than the model writes it.
- Generation cost: continuous AI video is expensive per minute; the capture says nothing about who pays.
- The capture names no interactivity, no catalog and no way to choose content.

## Design Direction

See `DESIGN.md` for this project's design tokens.
