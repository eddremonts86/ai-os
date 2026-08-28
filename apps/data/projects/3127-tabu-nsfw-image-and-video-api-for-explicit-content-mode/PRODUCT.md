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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A solo app developer gets an NSFW confidence score for an image (or sampled video frames) in a single REST call, with the image buffer destroyed by default, so the app passes platform content-moderation review without provisioning DevOps or self-hosting a model.

## Target Users

Solo developers and small app teams building products with user-generated content — the poster's own prior app was rejected by Apple App Store under Guideline 1.2, which is the cited origin case. Developers who would otherwise use AWS Rekognition, Google Cloud Vision, or Sightengine and want a lighter integration.

## Jobs To Be Done

Functional: decide whether to keep, blur, or reject a user-uploaded image or a sampled video frame. Emotional: ship the app without a moderation infra project. Social: be the kind of indie app that handles the moderation requirement the platform expects.

## Success Metrics

The poster offers two reported numbers: ~200 ms latency per image on the in-memory NSFWJS backend, and a free tier of 5,000 requests/month. These are the operating baseline for the current build.

## Pricing & Monetization

Free tier at 5,000 requests/month is stated. Paid pricing beyond the free tier is not specified.

## Competitive Landscape

The poster names AWS Rekognition, Google Cloud Vision, and Sightengine as the alternatives Tabu is positioned against, citing the DevOps and self-hosted-ML burden those imply as the friction Tabu removes.

## Risks & Open Questions

In-memory model means horizontal scaling is not solved for the current build. Five NSFWJS categories do not cover the full NSFW space the poster wants to support, and expansion is noted as future work. The poster self-describes as having no engineering background and is open to a technical co-founder — execution capacity is an open dependency. Cost of the inference path on heavier traffic is not yet quantified.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49450127) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
