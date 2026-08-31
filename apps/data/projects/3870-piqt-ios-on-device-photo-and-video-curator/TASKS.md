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

## Phase 0: Scaffold

- [x] Read the Show HN capture and record the stated design values and goals
- [x] Write SPEC.md (this document)
- [x] Scaffold the iOS project with Photos read access
- [x] Stand up the release-process test that asserts no delete APIs exist

## Phase 1: Core

- [ ] Implement the on-device analysis pipeline (Apple Vision plus ML models)
- [ ] Add ranking, sorting and clustering across the library
- [ ] Build the staging album flow

## Phase 2: Deploy

- [ ] Ship to the App Store and publish the design-values blog post
- [ ] Collect feedback from the Show HN thread on models and approach
- [ ] Iterate on navigation: measure time-to-find for photos
