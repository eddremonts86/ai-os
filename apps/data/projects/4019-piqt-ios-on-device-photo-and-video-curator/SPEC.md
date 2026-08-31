---
id: "4019"
slug: piqt-ios-on-device-photo-and-video-curator
title: Piqt (iOS) – on device photo and video curator
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49499789"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Piqt (iOS) – on device photo and video curator

## Problem

I've just released Piqt, an on-device photo/video curator. For years I've wanted to get my Apple Photos library under control, but there just aren't enough hours in the day. I started out in Jupyter notebooks to see how much I can use AI models to automate it and Piqt is the result.My goals with Piqt:- Fully on device: I use a number of ML models, Apple Vision API, clustering algorithms to rank and sort your photos. Everything runs on device.- Private and Safe: Piqt has no accounts, no cloud services, no personal identifiers. Images or personal information never leave the device. Piqt also CAN'T delete your photos. I have a test and validation step in the release process to ensure no delete APIs exist in the code. Instead, Piqt stages things you want to clear out in an album, which you can delete when you're ready.- A library you can use. I didn't just want to clean out images or clear up space. There are plenty of apps for this. My ultimate goal is to make your (and my) photos easier to navigateI'm just looking for feedback on the app and the approach. I'd love to chat about the vision models I'm using and hear from you about any research or techniques I've missed.App Store Link: https://apps.apple.com/us/app/piqt-photo-video-curator/id677...Blog with detail on technical decisions: https://piqt.app/blog/piqt-design-values/

---

## Objective

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
