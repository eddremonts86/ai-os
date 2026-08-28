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

## Problem

The poster open-sourced Kuma Voice (github.com/itsperini/kuma-voice), a voice assistant that runs on the Apple Watch without needing an iPhone nearby. The HN post body contains no further detail beyond the repo.

## Objective

Run a voice assistant directly on an Apple Watch without needing an iPhone to be present.

## Target Users

Apple Watch owners who want a hands-free assistant on the watch itself, not on a paired phone.

## MVP Scope

Open-source watchOS app that listens for a wake word, does speech-to-text and intent on-device, and speaks a reply.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

watchOS constraints on memory, audio, and background execution are tight.
