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

## Phase 0: Scaffold

- [ ] Create the repo and watchOS app target
- [ ] Get microphone permission and audio capture working on-device
- [ ] Establish an on-watch network path independent of the phone
- [ ] Write SPEC.md, PRODUCT.md, PLAN.md, TASKS.md, DESIGN.md

## Phase 1: Core

- [ ] Implement speech-to-text for a watch-length utterance
- [ ] Implement intent resolution and a spoken reply
- [ ] Test the full loop with the paired iPhone powered off
- [ ] Measure battery cost per interaction
- [ ] Document the build and the on-device requirements in the README

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify (or chosen host)
- [ ] Verify in production
