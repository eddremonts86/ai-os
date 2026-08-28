---
id: "3127"
slug: tabu-nsfw-image-and-video-api-for-explicit-content-mode
title: "Tabu, NSFW image and video API for explicit content moderation"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49450127"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [Node.js, TypeScript, NSFWJS, In-memory request buffer, ffmpeg, REST API, PostgreSQL]
---
# Tabu, NSFW image and video API for explicit content moderation

## Problem

The poster (Jozef) was rejected by Apple App Store under Guideline 1.2 — user-generated content must be checked for NSFW. Existing moderation APIs (AWS Rekognition, Google Cloud Vision, Sightengine) require heavy DevOps or self-hosted ML models, which raises cost and slows development. Tabu was built because the author wanted a single-request moderation filter, and then opened it to others.

The current build is simple: the backend runs the NSFWJS model in memory and returns a result in about 200 ms per image. The image buffer is destroyed immediately after classification so no images are stored; users can opt out of privacy-first mode. The JSON payload carries confidence scores across five categories — porn, hentai, sexy, drawing, neutral — and there is a dashboard for tuning per-image and per-video sensitivity thresholds. A free tier of 5,000 requests/month is offered for testing. The poster notes the model is meant to expand over time, eventually covering more NSFW categories.

## Objective

Give a solo app builder a single-request API that returns per-category NSFW confidence for an image (or video frame) in low two-digit milliseconds, with privacy-first defaults and a tunable sensitivity threshold, so apps can ship content moderation without standing up DevOps.

## Target Users

Solo developers and small teams building apps with user-generated content who need a content-moderation check to pass platform review (the poster's own Apple App Store rejection is the cited origin). Buyers who would otherwise reach for AWS Rekognition, Google Cloud Vision, or Sightengine but want a lighter integration.

## MVP Scope

A single REST endpoint that accepts an image and returns per-category confidence scores for the five NSFWJS categories, with an optional privacy-off mode that retains the buffer. Video support via frame sampling through ffmpeg. A dashboard to set per-image and per-video sensitivity thresholds. A free tier at 5,000 requests/month. No image storage by default.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

The current build runs the NSFWJS model in memory; horizontal scaling and GPU-backed inference are not in scope for the MVP. Per-image latency is quoted at about 200 ms. The model covers five categories only; full NSFW coverage is a stated future direction. The poster flags that they have no engineering background and are considering a technical co-founder — meaning roadmap velocity depends on hiring that is not in this plan.
