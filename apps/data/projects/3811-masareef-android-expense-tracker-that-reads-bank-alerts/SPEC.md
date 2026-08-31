---
id: "3811"
slug: masareef-android-expense-tracker-that-reads-bank-alerts
title: Masareef – Android expense tracker that reads bank alerts on-device
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49495918"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Android expense tracker, on-device SMS alert parsing, local transaction store, bank notification templates, local expense categorization, Play Store distribution]
---
# Masareef – Android expense tracker that reads bank alerts on-device

## Problem

The capture is a URL-only Show HN by mgado pointing at the Play Store listing for Masareef (package com.mohamedgado.masareef); the post text is just the link, so the product claim is the title. The title states the core design: an Android expense tracker that reads bank alerts on-device. That means transaction capture runs from the SMS or notification alerts a bank sends the phone, parsed locally rather than on a server, and the data stays on the device. The app's Arabic name translates to "expenses", and the package id suggests an Arabic-speaking author, which fits a design built around SMS bank alerts — a common banking channel in markets where card transactions trigger message alerts. Beyond the title and the store link, the capture contains no feature list, no screenshot description and no pricing; the thread has no comments to mine.

## Objective

Specify an on-device expense tracker whose single differentiator is automatic capture: bank alerts land as SMS or notifications, the app parses amount, merchant and timestamp locally, and a ledger forms without manual entry.

## Target Users

- Android users whose banks notify every transaction by SMS or push alert.
- People who want automatic expense tracking but will not connect a bank account or upload data to the cloud.
- Arabic-speaking users, given the app's name and author handle.

## MVP Scope

- Alert intake: read transaction alerts from SMS (and notification access if implemented).
- On-device parser: extract amount, merchant and time from varied bank message formats.
- Local ledger: transactions stored on the device with categories and monthly totals.
- Review flow: confirm, correct or dismiss a parsed transaction.
- Play Store release for the Android audience named by the capture.

## Constraints

- Everything on-device: the title's "on-device" is the stated privacy boundary; no server component may be assumed.
- The capture is a URL-only post, so the feature set beyond alert parsing is inferred from the title and must be labeled as such.
- Bank alert formats vary by bank and country; parser coverage is the core engineering risk.
- No pricing, revenue or user-count claims exist in the capture and none may be invented.

## Design Direction

See `DESIGN.md` for this project's design tokens.
