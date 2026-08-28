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

## Problem

The poster shipped Remap at remap.earth, an on-device bike-routing app that builds loop rides from the best roads. The HN post body gives no further detail beyond the link.

## Objective

Build a bike loop from the best available roads, calculated on the user's device.

## Target Users

Cyclists who want a no-network, privacy-preserving tool that produces a ride loop from their start point using good roads.

## MVP Scope

Mobile app that takes a start point and target distance, computes a loop locally from open road data, and rates road quality.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

Road-quality scoring depends on the open data available for the region.
