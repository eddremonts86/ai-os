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

## Problem

The poster just released Piqt, an on-device iOS photo and video curator. He wanted his Apple Photos library under control for years but never had enough hours in the day, so he started in Jupyter notebooks to test how far AI models could automate curation; Piqt is the result. His stated goals: fully on-device — ML models, the Apple Vision API and clustering algorithms rank and sort photos without anything leaving the device; private and safe — no accounts, no cloud services, no personal identifiers, and Piqt cannot delete photos, enforced by a test-and-validation step in the release process that verifies no delete APIs exist in the code. Instead of deleting, Piqt stages items the user wants to clear out into an album, to delete when ready. The end goal is not just cleanup — "there are plenty of apps for this" — but making the library easier to navigate. He is looking for feedback on the app, the approach and the vision models used.

## Objective

Ship the claimed experience: a private, on-device curator that ranks, sorts and clusters an Apple Photos library with ML models and Apple Vision, stages unwanted items into a non-destructive album, and makes years of photos navigable — with deletion strictly impossible by design.

## Target Users

- iPhone users with large, unorganized Photos libraries.
- Privacy-conscious users who refuse cloud photo services.
- Photographers who want smarter local organization without uploading.

## MVP Scope

- On-device ranking and sorting via ML models, Apple Vision and clustering.
- No accounts, no cloud, no identifiers; everything stays on-device.
- Non-destructive staging album for items to clear out.
- A release-process test proving no delete APIs exist in the code.
- Navigation-first experience, not just cleanup.

## Constraints

- Deletion is forbidden: the app must be provably unable to delete photos.
- Fully on-device: no server component may exist for analysis.
- The poster's own framing: curation first, cleanup second.
- iOS only, per the title and the App Store link.

## Design Direction

See `DESIGN.md` for this project's design tokens.
