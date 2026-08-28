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

## Problem

The maker is interested in simulating physical processes in software, so built an iPhone app that simulates film negatives and paper. The pipeline runs in two stages — scene light → colour negative → print reflectance — with per-dye-layer H&D curves on the negative and a separate response curve on the paper. He is asking darkroom-experienced users to try the app and share their opinion (App Store link in the post).

## Objective

Get feedback from people who have actually worked in a real darkroom, so the model can be calibrated against practitioner expectations rather than the maker's own. The post's success signal is qualitative feedback, not installs or revenue.

## Target Users

People who have spent time in a real darkroom and care about whether the simulation matches how film and paper actually behave. The maker explicitly invites this audience's opinion.

## MVP Scope

The two-stage pipeline (scene light → colour negative → print reflectance), per-dye H&D curves on the negative, response curves on the paper, and the iPhone app shell already on the App Store. Everything else (curated film/paper presets beyond the existing set, sharing, export) is out of scope unless feedback demands it.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

The app runs on iPhone, so the H&D and response-curve maths have to stay performant on mobile GPU/CPU — Metal or Accelerate is the obvious fit. The post does not state whether the simulation runs live on device or pre-renders — flag that as an open question. App Store review policies apply to whatever ships.
