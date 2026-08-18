---
id: "510"
slug: i-built-monito-a-native-macos-menu-bar-app-for-monitori
title: "I built Monito, a native macOS menu bar app for monitoring and managing VPS instances"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SideProject/comments/1vny42b/i_built_monito_a_native_macos_menu_bar_app_for/"
category: sideproject
date: "2026-08-14"
tech: [Swift, SwiftUI, macOS, Nezha/Komari/NodeGet APIs, SSH (NMSSH), StoreKit, TestFlight]
---
# I built Monito, a native macOS menu bar app for monitoring and managing VPS instances

## Problem

Source: [reddit.com/r/SideProject/comments/…](https://www.reddit.com/r/SideProject/comments/1vny42b/i_built_monito_a_native_macos_menu_bar_app_for/)

Original post:

> Hey r/SideProject, I previously built Monito, an iOS app for monitoring and managing VPS instances through Nezha, Komari, and NodeGet. After releasing the iOS version, several users asked whether I planned to support the iPad and Mac. My original plan was to reuse the existing Flutter codebase across every platform. Technically, that would have been the easiest option, but I wasn’t happy with the idea of putting a stretched mobile interface inside a desktop window. So I rebuilt the Mac version natively in Swift. The macOS app is designed around a desktop workflow rather than copying the phone layout. For example, frequently used servers can be pinned and checked directly from the menu bar without opening the main window. What it currently supports Nezha, Komari and NodeGet dashboards Standalone servers over SSH CPU, memory, disk, network and uptime monitoring Quick server status from the macOS menu bar SSH terminal sessions Remote file management Container management The monitoring features are free. Terminal, file-management and container-management features are included in Monito Pro. Purchases are shared between the iOS and macOS versions, so existing iOS users do not need to buy it again. The native macOS version is now available on the App Store: Monito – Server Monitor & SSH Monito is an independent third-party client and is not affiliated with these projects. If Nezha, Komari or NodeGet is new to you, please check them out as well and consider supporting their maintainers: Nezha Komari NodeGet I’d especially appreciate feedback on: Whether the menu bar workflow is useful for managing multiple servers Whether the Mac interface feels properly desktop-native Which server dashboards or integrations I should support next Thanks for taking a look. Honest criticism is welcome. submitted by /u/0x989c [link] [comments]

---

What this plan addresses: Monito: a native macOS menu-bar app for monitoring and managing VPS instances via Nezha, Komari, and NodeGet.

## Objective

Monito: a native macOS menu-bar app for monitoring and managing VPS instances via Nezha, Komari, and NodeGet, with SSH terminal, file management, and container management in Pro. When I run VPS instances via Nezha / Komari / NodeGet, I want a native macOS menu-bar app that shows status without opening the main window, so I can manage servers from the menu bar.

## Target Users

- macOS users running VPS instances via Nezha / Komari / NodeGet
- Developers who want a native menu-bar VPS monitor
- iOS Monito users who want a Mac counterpart

## MVP Scope

- Nezha, Komari, NodeGet dashboard integration
- Standalone servers via SSH
- CPU, memory, disk, network, uptime monitoring
- Quick status from menu bar without opening main window
- SSH terminal, file management, container management (Pro)

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SideProject/comments/1vny42b/i_built_monito_a_native_ma` follows the constraints in `510-.../SPEC.md` and the chosen stack (Swift, SwiftUI, macOS). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body describes Monito for macOS explicitly with the Nezha / Komari / NodeGet integration
- Plan keeps the native macOS + menu-bar framing
- Source did not name a price (Pro tier mentioned)
