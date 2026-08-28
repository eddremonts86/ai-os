---
id: "3147"
slug: remap-bike-routing-that-builds-loops-from-the-best-road
title: "Remap – bike routing that builds loops from the best roads, on-device"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49448085"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# Remap – bike routing that builds loops from the best roads, on-device

## Value Proposition

Bike routing that returns a loop built from good roads, computed on the device rather than on a server.

## Target Users

Cyclists who want a ride starting and ending where they are, without handing their location to a routing service or needing a connection.

## Jobs To Be Done

- Get a loop of roughly the distance I want from where I am standing
- Ride roads worth riding, not merely the shortest path
- Plan a route with no signal and no account

## Success Metrics

- Loops generated that are actually ridden end to end
- Loop generation time on a phone, since on-device is the constraint
- Whether riders re-request a loop from the same start, which suggests the first one was not good enough

## Competitive Landscape

Bike-route planners (Komoot, RideWithGPS) exist, but the source does not name any direct competitor that focuses on loop-building from the best local roads on-device.

## Risks & Open Questions

- The source does not say where road-quality signal comes from, and it is the differentiator
- On-device routing bounds how large a region can be loaded and searched
- Road quality is subjective and varies by rider and by bike
