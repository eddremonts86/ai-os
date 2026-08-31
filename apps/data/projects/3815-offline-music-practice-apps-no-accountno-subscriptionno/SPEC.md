---
id: "3815"
slug: offline-music-practice-apps-no-accountno-subscriptionno
title: "Offline music practice apps – no account,no subscription,no analytics"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49495786"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [iOS app family, SwiftUI, on-device storage only, backing jam tracks, guitar tuner, tip jar monetization]
---
# Offline music practice apps – no account,no subscription,no analytics

## Problem

The capture is a URL-only Show HN pointing at music-buddha.com, whose title ("no account, no subscription, no analytics") is the product's entire promise. The site describes a family of four iOS apps — Guitar Buddha, Ukulele Buddha, Drum Buddha and Bass Buddha — under one philosophy: "Learn a song. Capture an idea. Sit down and play." Three rules govern every app. First, your music stays yours: everything lives on the device with no server, no account and no cloud, and analytics are opt-in and anonymous. Second, practice isn't a game: no streaks, goals, badges or guilt; each app quietly remembers what you have practiced, nothing more. Third, free means free: every feature forever, with an optional tip jar that unlocks nothing. The site adds that the whole family is built by one musician (Gabe) and supervised by his dog Kylo — explicitly no growth team — that Guitar Buddha covers songs, riff capture, jamming with a backing band and tuning across 95 hand-built screens, and that Android is coming, announced through a single-email list hosted on Cloudflare.

## Objective

Build a coherent solo-developer product line: one calm, offline-first practice app per instrument, sharing the same three-rule philosophy and the same on-device data model, sold through an honest free-forever plus tip jar stance.

## Target Users

- Amateur guitarists, ukulele players, drummers and bassists who want low-pressure practice tools.
- Privacy-first musicians who refuse accounts, subscriptions and always-on analytics.
- Learners burned by gamified practice apps (streaks, badges) who want calm repetition instead.

## MVP Scope

- Four instrument apps sharing one philosophy and one on-device storage model.
- Guitar Buddha's listed feature set as the template: learn songs, capture riffs, jam with a backing band, tuner, 95 screens.
- No account, no server, no cloud; analytics only if opted in, and anonymous.
- Practice memory: each app quietly records what has been practiced, without streaks or scores.
- Optional tip jar that gates nothing.
- Android waitlist via a single-email notification list.

## Constraints

- Free means free: the site states every feature in every app is free forever; no paywall may be introduced without breaking the stated promise.
- No analytics by default, and any analytics are opt-in and anonymous — a hard product rule, not a setting.
- Solo developer (one person, one dog, no growth team) bounds velocity and platform coverage; iOS ships first, Android is a waitlist.
- Everything on-device means sync and multi-device features are out of scope by design.

## Design Direction

See `DESIGN.md` for this project's design tokens.
