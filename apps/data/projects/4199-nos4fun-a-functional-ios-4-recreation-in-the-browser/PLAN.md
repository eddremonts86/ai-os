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

## Tech Stack

- **TypeScript** as the primary language, with `strict` mode across the whole workspace.
- **SolidJS 1.9** as the UI framework, matching the source's stack badge.
- **Vite 6** as the build tool, matching the source's stack badge.
- **Tailwind 4** as the styling system, matching the source's stack badge.
- **pnpm 10+** as the package manager, matching the source's stack badge.
- **Node 22.6+** as the minimum runtime for the build.
- **Postgres** for the Game Center backend (optional, set via `DATABASE_URL`).
- **OpenStreetMap tiles, Nominatim, OSRM** for the Maps app.
- **Open-Meteo** for the Weather app.
- **Apple's public iTunes Search and RSS feeds** for the App Store and iTunes apps.
- **Inter and Helvetica Neue** for typography.
- **The OldOS Project by Zane** as the asset-catalogue source (with attribution and the explicit no-shared-code note).

## Architecture

The architecture has a strict structural hierarchy: Foundation → CoreGraphics → UIKit → SpringBoard → apps. Nothing imports upward; a Foundation module cannot import a UIKit module; a CoreGraphics module cannot import a SpringBoard module. The hierarchy is the structural reason the recreation mirrors the real iOS, and the structural reason the project is a runnable artifact in the browser.

The sixteen frameworks underneath provide the primitives the apps use. Foundation is the notification bus and primitives. CoreGraphics is the asset manifest. CoreAnimation is timing curves and transitions. GraphicsServices is touch delivery and the scroller state machine. UIKit / TextInput are controls and the keyboard. SpringBoard is the lock screen, pages, dock, folders, and multitasking. SpriteKit / GameKit are the game runtime and leaderboards. AVFoundation, CoreLocation, CoreTelephony, SceneKit provide the rest.

The twenty-three apps sit on top of the frameworks. Safari, Mail, Messages, Phone, Maps, iPod, Photos, Camera, Notes, Weather, Stocks, Clock, Calculator, Compass, Voice Memos, Contacts, Settings, App Store, iTunes, Game Center, plus two games. The apps read from the frameworks; the frameworks never import an app.

The third-party service integrations are explicit. Maps uses OpenStreetMap tiles, Nominatim for geocoding, and OSRM for routing. Weather reads Open-Meteo. The App Store and iTunes read Apple's public iTunes Search and RSS feeds. Type is Inter and Helvetica Neue.

Game Center is the optional surface that needs a server. With `DATABASE_URL=postgresql://…` set and `services/GameCenterService/schema/*.sql` applied, `pnpm service` starts the Game Center server. Without the server, Game Center is unavailable; everything else works.

The pnpm scripts drive the workflow: `pnpm -C apps/Phone dev` (the phone on its own), `pnpm dev` (the debug page with the event monitor beside the phone), `pnpm build` (production bundle into `apps/Phone/dist`), `pnpm typecheck` (the whole workspace, strict), `pnpm banner` (regenerate the marketing images).

The asset catalogue comes from The OldOS Project by Zane. nOS4 shares no code with it; every screen here was rewritten from scratch. iPhone, iOS, and the recreated app designs are trademarks of Apple Inc.; the project is an independent tribute, not affiliated with or endorsed by Apple.

## Milestones

1. **M1 — Sixteen-framework hierarchy** — Foundation, CoreGraphics, CoreAnimation, GraphicsServices, UIKit / TextInput, SpringBoard, SpriteKit / GameKit, AVFoundation, CoreLocation, CoreTelephony, SceneKit, and the rest, with the "nothing imported upward" rule enforced by a CI check.
2. **M2 — Twenty-three apps** — Safari, Mail, Messages, Phone, Maps, iPod, Photos, Camera, Notes, Weather, Stocks, Clock, Calculator, Compass, Voice Memos, Contacts, Settings, App Store, iTunes, Game Center, and two games.
3. **M3 — Home, multitasking, folders, lock screen, dock** — the SpringBoard surface, the lock screen, pages, the dock, folders, multitasking.
4. **M4 — Third-party service integrations** — OpenStreetMap tiles, Nominatim, OSRM, Open-Meteo, iTunes Search, iTunes RSS, Inter and Helvetica Neue typography.
5. **M5 — Game Center (optional)** — the Postgres backend, the schema, `pnpm service`, the leaderboards.
6. **M6 — pnpm scripts** — `pnpm -C apps/Phone dev`, `pnpm dev` (debug page), `pnpm build`, `pnpm typecheck` (strict), `pnpm banner`.
7. **M7 — Asset catalogue attribution and trademark notice** — the per-asset attribution to The OldOS Project by Zane, the iPhone / iOS / Apple trademark notice on every surface.
8. **M8 — Deploy at nos4.fun** — the production bundle, the deployed site, the strict-typecheck CI gate.

## Risks

- **Framework-import-direction regression** — a module imports upward and the structural hierarchy breaks. Mitigation: the CI check refuses an upward import; the check is the unit of trust the codebase ships.
- **App coverage regression** — an app stops rendering after a framework update. Mitigation: the app coverage is a first-class metric; the per-app rendering is tested in CI; a regression is a release blocker.
- **Game Center Postgres dependency drift** — the Postgres connection fails and Game Center is unavailable. Mitigation: the Game Center dependency is optional; everything else works without it; the user can opt out of Game Center.
- **Third-party service outage** — OpenStreetMap, Nominatim, OSRM, Open-Meteo, iTunes Search, iTunes RSS goes down. Mitigation: the apps surface a graceful fallback where possible; the third-party service availability is a metric.
- **Asset-catalogue attribution gap** — an asset is missing the attribution to The OldOS Project by Zane. Mitigation: the per-asset attribution is enforced by a CI check; the README names the inspiration.
- **Trademark-notice gap** — the iPhone / iOS / Apple trademark notice is missing on a surface. Mitigation: the trademark notice is enforced by a CI check on the README, the deployed site, and the per-app footer.
- **Strict-typecheck regression** — a typecheck regression breaks the strict gate. Mitigation: the strict-typecheck is the CI gate; a regression is a release blocker; the workspace typecheck script is the entry point.
