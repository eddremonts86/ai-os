---
id: "4221"
slug: a-pi-extension-to-monitor-your-quota-for-opencode-go-et
title: A Pi extension to monitor your quota for OpenCode GO et CommandCode
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49507224"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# A Pi extension to monitor your quota for OpenCode GO et CommandCode

## Problem

The post is a Show HN for a Pi extension whose job is to monitor the user's remaining quota for the OpenCode GO and CommandCode offerings, across the 5-hour and the monthly reset windows. The poster's claim is the pain: someone running OpenCode GO or CommandCode from the Pi editor does not have a single, in-editor view of how much quota is left in either window, and has to switch to the provider's web console to find out. The extension makes the two windows visible without leaving the editor. The source names the actor (a Pi user on OpenCode GO or CommandCode), the pain (no in-editor quota readout for the 5h and monthly windows), and the missing thing (a Pi extension that surfaces both windows in one place). It does not name a specific model, a specific pricing tier, or a specific refresh cadence.

## Objective

Ship a Pi extension that monitors the remaining quota for OpenCode GO and CommandCode across the 5-hour and the monthly reset windows and shows the two readouts inside the Pi editor so the user never has to leave it to check quota.

## Target Users

- Pi editor users on the OpenCode GO tier who need the 5-hour and monthly quota readouts visible without switching to a web console.
- Pi editor users on the CommandCode tier with the same need.
- Heavy Pi users who hit quota mid-session and want a heads-up before the next call fails.
- Teams running Pi on shared machines who want each seat's quota surfaced in one place.
- Engineers comparing OpenCode GO and CommandCode on quota density and wanting the two readouts side by side.

## MVP Scope

- A Pi extension that registers as an editor sidebar item or status-bar widget.
- Two readouts: the 5-hour window's remaining quota and the monthly window's remaining quota.
- A polling loop that refreshes the readouts on a configurable cadence.
- A visual warning when either readout crosses a user-set threshold (e.g. < 20% remaining).
- A click-through that opens the provider's quota page in the browser for the full breakdown.
- A settings panel for the polling cadence, the warning threshold, and the provider (OpenCode GO or CommandCode).
- Auth via the same credential the user already uses for the provider; the extension does not introduce a new account.
- A README that documents the install path, the two windows, and the warning behaviour.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The extension is read-only. It surfaces quota; it does not change the user's plan, billing, or provider state.
- The two windows are 5-hour and monthly. A window the provider does not expose is a coverage gap, not a bug.
- The polling cadence is configurable. The default is conservative enough not to be mistaken for abuse by the provider's rate limiter.
- The extension never stores the user's credential outside the Pi keychain or the platform-native secret store.
- The provider selection is OpenCode GO or CommandCode. A provider the extension does not support is an unsupported configuration, not a setup failure.
- The visual warning is a clear state, not a modal. The user reads quota, not a popup.