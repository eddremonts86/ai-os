---
id: "3153"
slug: toned-an-iphone-darkroom-app-that-models-film-negatives
title: "Toned, an iPhone darkroom app that models film negatives and paper"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49447599"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [Swift, iOS, Metal]
---
# Toned, an iPhone darkroom app that models film negatives and paper

## Tech Stack

Native iOS in Swift, with Metal for the GPU side of the per-dye H&D and paper response-curve maths. App Store distribution is already live. No server component is mentioned in the post, so the simulation runs entirely on device.

## Architecture

A two-stage image pipeline: input scene-RGB passes through the colour-negative stage (per-dye H&D curves applied per colour layer) and the result is fed into the print stage (paper response curve). Each stage is a small, isolated math kernel; Metal compute shaders are the natural place to run both, with the App Store app shell providing the UI around them.

## Milestones

- Confirm the two-stage pipeline (scene → negative → print) renders correctly on real iPhone hardware, not just the simulator.
- Calibrate per-dye H&D curves and paper response curve against reference film/paper the maker trusts.
- Make the darkroom-feedback loop easy: a way for the practitioner audience to submit a sample image and a verdict.
- Keep App Store metadata and build in sync with the version under test.

## Risks

Mobile GPU performance for the two-stage curve pipeline is unverified in the source. Practitioner expectations are subjective and may diverge — feedback may demand film/paper presets the maker has not yet modelled. App Store review can block image-processing apps if the maker adds export features without thinking through policy.
