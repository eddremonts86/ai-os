---
id: "3718"
slug: snippety-a-native-text-expander-for-mac-and-iphone
title: Snippety – a native text expander for Mac and iPhone
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49488310"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, macOS, iOS, Productivity]
tech: [Swift, SwiftUI, AppKit, CloudKit, Apple Shortcuts]
---
# Snippety – a native text expander for Mac and iPhone

## Problem

Off-the-shelf text expanders paste static text. Real workflows need more: a single snippet that asks for a name, picks a branch on whether the customer is on the Free or Premium plan, calculates a follow-up date dynamically, and inserts the right wording in one keystroke. The Show HN post [https://snippety.app](https://snippety.app) is for Snippety, a native macOS + iOS text expander the author has spent six years building on user feedback. The product page documents a 20-placeholder templating engine with conditional blocks (`{@if|Plan == Premium@}...{@else@}...{@endif@}`), the ability to run shell scripts inside a snippet, a CLI for automation, Apple Shortcuts and Siri integration, on-device AI (including local models), a custom iOS keyboard, 250 built-in themes, and a comparison table against TextExpander, Typinator and Raycast that highlights conditional blocks, the CLI, and shell-in-snippet as table-stakes Snippety features.

## Objective

Ship a native macOS + iOS text-expander app where one snippet adapts to every situation through a 20-placeholder templating engine with conditional blocks, can call out to shell scripts, integrates with Apple Shortcuts and Siri, and never requires an account — snippets live on the device or in the user's own iCloud. The MVP must work on macOS and iOS in parallel, support the templating language, ship with the CLI, and include the custom iOS keyboard.

## Target Users

- Primary: power users and developers on macOS who already use a text expander and want conditional logic, shell-out, and no subscription pressure.
- Secondary: iOS-first knowledge workers who want to expand the same snippets on their phone via a custom keyboard.
- Tertiary: small-team admins and support agents who maintain shared email templates and want one snippet per scenario with branching.

## MVP Scope

- Native macOS app (AppKit/SwiftUI) and native iOS app with a custom keyboard extension.
- 20 templating placeholders (text input, selectable, calculated-date, if/else, etc.) plus conditional blocks.
- Local-first storage; optional iCloud sync through the user's own iCloud account.
- A `snippety` CLI for listing, expanding, and triggering snippets from the shell.
- Apple Shortcuts and Siri actions that invoke named snippets.
- Shell-script invocation inside a snippet, with a per-snippet allow-list of safe commands.
- 250 built-in themes with configurable colours.
- No account, no server, no email capture; no telemetry that leaves the device.

## Design Direction

See `DESIGN.md` for this project's design tokens. Snippety is a single-window utility on macOS and a custom-keyboard surface on iOS. Neutral system colours that respect light and dark mode, one accent for the snippet-trigger chevron, and one muted accent for the placeholder hints. Type is system font on both platforms so the expanded text reads as if the user typed it. No third-party tracking or analytics.

## Constraints

- App must be 100% native (no Electron, no web views).
- Snippets must never leave the user's device unless the user opts into iCloud sync.
- Templating engine must support conditionals, otherwise the central differentiator disappears.
- Custom iOS keyboard must include all snippets (not a stripped-down viewer for the Mac library).
- Free tier + low monthly plan + one-time purchase with lifetime updates — no forced subscription.
