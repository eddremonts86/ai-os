---
id: "4199"
slug: nos4fun-a-functional-ios-4-recreation-in-the-browser
title: Nos4.fun – A functional iOS 4 recreation in the browser
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509167"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Nos4.fun – A functional iOS 4 recreation in the browser

## Problem

The best way to understand something is to rebuild it. nOS4 is a recreation of iOS 4 — the home screen, the multitasking, the folders, the lock screen, the dock, twenty-three apps, sixteen frameworks underneath — running in the browser, with nothing imported upward: Foundation → CoreGraphics → UIKit → SpringBoard → apps. The recreation shares no code with the source-of-inspiration project (The OldOS Project by Zane); every screen here was rewritten from scratch, and the asset catalogue comes from the inspiration project.

The source is the GitHub repository for `1etu/nos4`, available at nos4.fun. The stack is TypeScript + SolidJS 1.9 + Vite 6 + Tailwind 4 + pnpm. Node 22.6+ and pnpm 10+ are required to build. The twenty-three apps are Safari, Mail, Messages, Phone, Maps, iPod, Photos, Camera, Notes, Weather, Stocks, Clock, Calculator, Compass, Voice Memos, Contacts, Settings, App Store, iTunes, Game Center, and two games. The sixteen frameworks underneath include Foundation, CoreGraphics, CoreAnimation, GraphicsServices, UIKit / TextInput, SpringBoard, SpriteKit / GameKit, and others.

Maps use OpenStreetMap tiles, Nominatim geocoding, and OSRM routing; weather comes from Open-Meteo; the App Store and iTunes read Apple's public iTunes Search and RSS feeds; type is set in Inter and Helvetica Neue. Game Center needs a Postgres connection string (`DATABASE_URL=postgresql://…`); everything else works without it. Game Center is optional; the source is explicit about this.

The source names the actor (a developer who wants to understand iOS by rebuilding it in the browser), the pain (no way to study iOS 4's structure end-to-end without an iPhone or a simulator), and the missing thing (a browser-native recreation of iOS 4 with twenty-three apps, sixteen frameworks, and a structural hierarchy that mirrors the real iOS). It does not name a specific educational use, a specific deployment target, or a specific app-store distribution.

## Objective

Build the nOS4 browser-native recreation of iOS 4: twenty-three apps (Safari, Mail, Messages, Phone, Maps, iPod, Photos, Camera, Notes, Weather, Stocks, Clock, Calculator, Compass, Voice Memos, Contacts, Settings, App Store, iTunes, Game Center, plus two games) on top of sixteen frameworks (Foundation → CoreGraphics → UIKit → SpringBoard → apps) with nothing imported upward, deployed at nos4.fun.

## Target Users

- Developers who want to understand iOS 4 by rebuilding it in the browser, with a structural hierarchy that mirrors the real iOS.
- Educators and students who want a browser-native target for studying mobile OS architecture without an iPhone or a simulator.
- Developers who use the TypeScript + SolidJS + Vite + Tailwind stack and want a working reference of a complex browser app at that scale.
- Game Center users who want a browser-native Game Center with a Postgres backend for leaderboards.
- Nostalgia users who want to use a recreation of iOS 4 in the browser and explore the apps.

## MVP Scope

- A browser-native recreation of iOS 4 at nos4.fun, built with TypeScript, SolidJS 1.9, Vite 6, Tailwind 4, and pnpm.
- A structural hierarchy of sixteen frameworks with nothing imported upward: Foundation → CoreGraphics → UIKit → SpringBoard → apps.
- Twenty-three apps: Safari, Mail, Messages, Phone, Maps, iPod, Photos, Camera, Notes, Weather, Stocks, Clock, Calculator, Compass, Voice Memos, Contacts, Settings, App Store, iTunes, Game Center, and two games.
- The home screen, multitasking, folders, the lock screen, the dock, and the per-app rendering.
- Integration with OpenStreetMap tiles, Nominatim geocoding, OSRM routing, Open-Meteo weather, Apple's public iTunes Search and RSS feeds, and Inter / Helvetica Neue typography.
- A Game Center surface that is optional and requires a Postgres connection string; everything else works without a server.
- The pnpm scripts: `pnpm -C apps/Phone dev` (the phone on its own), `pnpm dev` (the debug page: event monitor beside the phone), `pnpm build` (production bundle into `apps/Phone/dist`), `pnpm typecheck` (the whole workspace, strict), `pnpm banner` (regenerate the marketing images).
- A documentation note that the asset catalogue is from The OldOS Project by Zane, that nOS4 shares no code with it, and that every screen was rewritten from scratch.
- iPhone, iOS, and the app designs recreated here are trademarks of Apple Inc.; the project is an independent tribute, not affiliated with or endorsed by Apple.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The structural hierarchy is sixteen frameworks with nothing imported upward: Foundation → CoreGraphics → UIKit → SpringBoard → apps. A framework importing upward is a structural failure.
- The supported apps are the twenty-three the source names, plus two games. An app outside the list is a scope failure.
- The browser stack is TypeScript + SolidJS 1.9 + Vite 6 + Tailwind 4 + pnpm. A framework outside the stack is a stack consistency failure.
- The minimum build versions are Node 22.6+ and pnpm 10+. The plan does not promise support for older Node or pnpm versions.
- The third-party services the apps use are OpenStreetMap (tiles), Nominatim (geocoding), OSRM (routing), Open-Meteo (weather), Apple's public iTunes Search and RSS feeds (App Store + iTunes), Inter and Helvetica Neue (typography). A third-party service outside the list is a service-scope failure.
- Game Center is optional and needs Postgres (`DATABASE_URL=postgresql://…`). Everything else works without a server; Game Center's Postgres requirement is explicit.
- The asset catalogue is from The OldOS Project by Zane (the inspiration). nOS4 shares no code with it, and every screen was rewritten from scratch; the credit is in the README and the source.
- iPhone, iOS, and the recreated app designs are trademarks of Apple Inc.; the project is an independent tribute, not affiliated with or endorsed by Apple. The trademark notice is in the README and the source.
