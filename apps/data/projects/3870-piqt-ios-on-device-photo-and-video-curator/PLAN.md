---
id: "3870"
slug: piqt-ios-on-device-photo-and-video-curator
title: Piqt (iOS) – on device photo and video curator
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49499789"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Apple Vision API, On-device ML models, Photo clustering, Photos framework integration, Local ranking, iOS app]
---
# Piqt (iOS) – on device photo and video curator

## Tech Stack

Chosen from the poster's stated design values; he names Apple Vision explicitly.

- **iOS app:** App Store distribution, per the capture.
- **Apple Vision API:** image understanding on-device.
- **On-device ML models:** ranking signals without a server.
- **Clustering algorithms:** grouping the library locally.
- **Photos framework integration:** read access plus staging-album writes.

## Architecture

- **Analysis pipeline:** Vision plus ML models produce per-item signals.
- **Ranking and clustering layer:** local sort and grouping over the library.
- **Staging layer:** curated outputs written to a staging album only.
- **Guardrail:** the release-process test asserts no delete API is reachable from the code.

## Milestones

1. **M0 — Analysis.** The on-device pipeline ranks a sample library.
2. **M1 — Scale.** Ranking, sorting and clustering hold across a full library.
3. **M2 — Safety.** The staging album flow and the no-delete release test are wired into CI.
4. **M3 — Release.** App Store launch with a feedback loop from the Show HN thread.

## Risks

- **Battery and performance** on large libraries under the on-device constraint.
- **Clustering quality** varies across photos versus videos.
- **Test coverage:** the no-delete test must cover every code path touching the library.
