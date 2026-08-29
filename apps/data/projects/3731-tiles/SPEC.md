---
id: "3731"
slug: tiles
title: Tiles
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/tiles-5"
category: product-launch
date: "2026-08-22"
tags: [ProductHunt, Product Launch]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Tiles

## Problem

Single-monitor users who context-switch between unrelated kinds of work — app development, UI design, writing / research — accumulate window clutter that no "snap-to-grid" window manager can solve. The maker of Tiles (a single-monitor power user who runs That Apple Guide) describes his day as a routine of "jumping between app development, UI design, and writing / researching articles," each with a different expected layout, and reports that constantly dragging, resizing, hunting for buried windows, and rebuilding layouts after every alt-tab derailed his focus. macOS already ships a Spaces feature that exposes multiple desktops, but the layouts inside each Space are not preserved — when a Space is left, the windows scatter, and when it returns the user has to redo the arrangement. The ProductHunt listing pitches Tiles as the missing layer on top of Spaces: a workspace manager for macOS that captures not just the windows but their positions, so a curated desk can be summoned back with a single click, shortcut, or widget instead of being rebuilt by hand.

## Objective

Ship a native macOS workspace manager that lets a user save and restore an entire window layout as a named "Space," and switch between layouts (each tied to a different mode of work) with a single shortcut, click, or widget. The MVP is the Tiles product as described in the ProductHunt listing: capture ideal desktop layouts, bring them back with a single action, support menu-bar and widget entry points. The product's job is not to manage a single window, but to manage the layout as a unit, so the user never has to rebuild their workspace when they change tasks.

## Target Users

- **Primary:** single-monitor macOS power users who run several unrelated kinds of work in a day (development, design, writing / research, support, marketing) and lose focus to context-switching between them.
- **Secondary:** macOS users who already use Spaces but want their layouts preserved per Space rather than rebuilt every time they return.
- **Tertiary:** macOS users coming down from multi-display setups, who felt productive on two monitors and want to recover that feeling on one monitor via fast, named layout switching.

## MVP Scope

- A native macOS app that detects the open windows of supported apps, captures their positions and sizes, and saves the resulting layout as a named workspace ("Tile" or "Space" within Tiles).
- A switcher UI that lists the saved layouts and recalls them with a single click or a keyboard shortcut, restoring every remembered window to its captured position and size.
- A menu-bar entry point so the switcher is one click away regardless of which app is in front.
- A home-screen / desktop widget that exposes one or more layouts for one-tap recall (the widget is named explicitly in the ProductHunt listing).
- A scheduling layer for time-of-day layouts (the listing says "Schedule layouts based on time of day, like having Tiles activate Work in the Morning and Personal in the Evening"), but the listing also says scheduling is on the roadmap — keep it out of MVP unless the source pins it as shipped.
- Persistence of layouts on-device; the listing does not advertise a cloud sync.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Native macOS only — the listing pins the launch tags as Productivity, Menu Bar Apps, Apple. iPad / iPhone versions are not advertised and not in scope.
- Layout fidelity depends on macOS accessibility / window-list APIs. Apps that do not cooperate with those APIs (some games, some Electron apps, sandboxed apps) cannot be reliably captured or restored; the MVP must at minimum detect this and tell the user which apps did not participate.
- The product must avoid competing with macOS Mission Control: it is a complement (named, switchable layouts), not a replacement for the system-level overview.
- Pricing: the listing shows "Payment Required" without a number, so the team should ship a free trial / paid unlock plan, but the exact price is not stated in the source and `wtp` is left `absent` rather than invented.
- Made by a single maker ("Zach Olsen" in the "Launch Team" rail) using Xcode and Figma — runtime stack is native macOS (SwiftUI / AppKit), not the JavaScript stack implied by the captured `tech` default.
