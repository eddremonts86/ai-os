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

## Value Proposition

An iOS curator that ranks, sorts and clusters a photo library entirely on-device: private, account-free, and provably unable to delete a single photo. The value is control without exposure — automation that does not require trusting a cloud, and cleanup that cannot destroy anything because deletion is architecturally impossible. The poster's own words frame it: the goal is navigation, not just freeing space.

**One-liner:** An iOS curator that ranks, sorts and clusters your photo library entirely on-device — private, no accounts, and provably unable to delete a single photo.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Busy iPhone users | Automated curation replaces hours of manual sorting. |
| Privacy-first users | No cloud, no accounts, no identifiers — nothing leaves the device. |
| Photo hoarders | A staging album for cleanup without risking data loss. |

The post describes the author's own need and the privacy-conscious audience; the rows follow from his stated design values.

## Jobs To Be Done

1. **Functional job** — Rank and sort a Photos library with on-device ML and Apple Vision.
2. **Functional job** — Cluster photos so navigation beats scrolling.
3. **Functional job** — Stage items for deletion in an album, never delete directly.
4. **Emotional job** — Reclaim the library without handing it to anyone else.

## Success Metrics

- **Library coverage:** share of a user's photos the curator ranks.
- **Navigation:** time to find a given photo before versus after curation.
- **Staging usage:** items staged and later cleared by the user.
- **Zero delete capability:** the release test stays green on every build.

## Pricing & Monetization

None stated. The capture includes an App Store link but names no price or model.

## Competitive Landscape

The post names no competitors but acknowledges the crowd: "There are plenty of apps for this." The category is iOS photo cleanup and organization apps. Piqt's stated differences are fully on-device processing and a hard guarantee that it cannot delete photos — enforced by a release-process test, not a promise.

## Risks & Open Questions

- [ ] On-device ML quality may trail cloud-backed competitors on ranking accuracy.
- [ ] The no-delete guarantee depends on the release-process test staying trustworthy.
- [ ] Photos framework permissions and large-library performance on-device.
- [ ] No monetization stated; App Store economics are unknown.
