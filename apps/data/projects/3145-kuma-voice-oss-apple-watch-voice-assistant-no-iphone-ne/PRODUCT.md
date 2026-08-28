---
id: "3145"
slug: kuma-voice-oss-apple-watch-voice-assistant-no-iphone-ne
title: "Kuma Voice – OSS Apple Watch voice assistant, no iPhone needed"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49448238"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# Kuma Voice – OSS Apple Watch voice assistant, no iPhone needed

## Value Proposition

A voice assistant that runs on the Apple Watch itself, with no iPhone in range, released as open source.

## Target Users

Apple Watch owners who want to talk to their watch when the phone is not with them, and developers who want an assistant they can read and modify.

## Jobs To Be Done

- Ask my watch something on a run with no phone and no paired device
- Use an assistant whose code I can inspect because it is open source
- Avoid depending on a phone relay for a device that has its own radio

## Success Metrics

- Requests completed on-watch without a paired phone present
- Battery cost of a typical interaction, which decides whether it gets used twice
- Repository stars and forks, since the repo is the distribution channel

## Competitive Landscape

Siri, Google Assistant, and watchOS voice apps exist, but the source does not name any direct competitor that runs as a standalone OSS Apple-Watch voice assistant without an iPhone.

## Risks & Open Questions

- The post does not say whether speech recognition runs on-device or over the network from the watch
- watchOS background execution limits may cap what assistant can mean here
- Battery drain is the likeliest reason a watch assistant gets uninstalled
