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

## Tech Stack

Chosen for a 100% native product: no Electron, no web views, and no server anywhere in the loop.

- **Swift / SwiftUI / AppKit:** the native macOS app and the iOS app with the custom keyboard extension.
- **CloudKit:** optional sync through the user's own iCloud account, never through Snippety infrastructure.
- **Apple Shortcuts and Siri:** system-level actions that invoke named snippets.
- **In-app templating engine:** the 20 placeholders and conditional blocks, built into the app rather than a dependency.
- **Shell-out sandbox:** a per-snippet allow-list for the shell-script placeholder.

## Architecture

- **Snippet store:** local-first on every device; iCloud-synced only when the user opts in.
- **Expansion engine:** parses a trigger, walks placeholders and conditionals, asks for missing inputs, and inserts the finished text.
- **Shell bridge:** runs allow-listed commands inside a snippet and pastes the output.
- **CLI:** `snippety` commands to list, expand, and trigger snippets from a shell.
- **Custom keyboard:** the full snippet library on iOS, not a stripped-down viewer for the Mac library.

## Milestones

1. **M0 — Templating core on macOS.** The 20 placeholders plus conditional blocks expand correctly in one app.
2. **M1 — Cross-device parity.** The iOS app and custom keyboard ship; CloudKit sync sits behind an explicit opt-in.
3. **M2 — Integration surfaces.** The CLI, Shortcuts, Siri, and the shell-out allow-list all work.
4. **M3 — Store readiness.** The 250 themes land, both apps pass App Review, and the free / low monthly / lifetime pricing tiers go live.

## Risks

- **App Review and the keyboard extension:** a "Full Access" requirement could block the custom keyboard; validated early, not at submission time.
- **Conditional-block complexity:** the conditional engine is the differentiator; a buggy evaluator erodes the whole pitch.
- **Shell-out safety:** allow-list mistakes would turn the expander into an arbitrary-code surface.
- **iCloud sync edge cases:** disabled categories must never surface on the other device.
- **On-device AI scope:** translation and rewrite features must be explicitly deferred to v2 or they will delay the core.
