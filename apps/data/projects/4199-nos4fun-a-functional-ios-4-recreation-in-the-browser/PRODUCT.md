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

## Value Proposition

A browser-native recreation of iOS 4 at nos4.fun, built with TypeScript + SolidJS 1.9 + Vite 6 + Tailwind 4 + pnpm. Twenty-three apps (Safari, Mail, Messages, Phone, Maps, iPod, Photos, Camera, Notes, Weather, Stocks, Clock, Calculator, Compass, Voice Memos, Contacts, Settings, App Store, iTunes, Game Center, plus two games) on top of sixteen frameworks with a strict structural hierarchy that mirrors the real iOS: nothing imported upward, Foundation → CoreGraphics → UIKit → SpringBoard → apps.

Game Center is the only surface that needs a server (Postgres); everything else works without one. Maps use OpenStreetMap tiles with Nominatim geocoding and OSRM routing; weather comes from Open-Meteo; the App Store and iTunes read Apple's public iTunes Search and RSS feeds. The asset catalogue comes from The OldOS Project by Zane, with nOS4 sharing no code with it and every screen rewritten from scratch.

**One-liner:** A browser-native recreation of iOS 4 with twenty-three apps on sixteen frameworks, structural hierarchy Foundation → CoreGraphics → UIKit → SpringBoard → apps, and the only server requirement being Game Center's Postgres.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Developers who want to study iOS 4 | Need a browser-native target with a structural hierarchy that mirrors the real iOS. |
| Educators and students | Need a browser-native target for studying mobile OS architecture without an iPhone or a simulator. |
| TypeScript + SolidJS + Vite + Tailwind developers | Want a working reference of a complex browser app at that scale. |
| Game Center users | Want a browser-native Game Center with a Postgres backend for leaderboards. |
| Nostalgia users | Want to use a recreation of iOS 4 in the browser and explore the apps. |

## Jobs To Be Done

1. **Functional job** — Use a recreation of iOS 4 in the browser, with the home screen, multitasking, folders, the lock screen, the dock, and the per-app rendering.
2. **Functional job** — Study the iOS 4 architecture end-to-end by reading the sixteen-framework hierarchy, with the strict "nothing imported upward" rule.
3. **Functional job** — Use Game Center with a Postgres-backed leaderboard, opt-in by setting `DATABASE_URL`.
4. **Functional job** — Build the project locally with `pnpm -C apps/Phone dev`, typecheck with `pnpm typecheck`, bundle with `pnpm build`, and regenerate the marketing images with `pnpm banner`.
5. **Emotional job** — Stop the feeling that understanding iOS 4's structure requires an iPhone, a simulator, or a third-party recreation with hidden complexity.
6. **Social job** — Be the developer who uses a browser-native target for studying mobile OS architecture and points other developers at the sixteen-framework hierarchy.

## Success Metrics

- **Framework-import-direction adherence** — share of framework imports that follow the Foundation → CoreGraphics → UIKit → SpringBoard → apps direction. An upward import is a structural failure.
- **App coverage** — share of the twenty-three named apps that ship functional in the browser. An app that does not render is a coverage gap.
- **Game Center opt-in rate** — share of users that set `DATABASE_URL` and reach Game Center. The metric is the optional surface's adoption.
- **Strict-typecheck pass rate** — share of `pnpm typecheck` runs that pass. The metric is the codebase's strict-typecheck health.
- **Third-party service availability** — share of third-party services (OpenStreetMap, Nominatim, OSRM, Open-Meteo, iTunes Search, iTunes RSS) that respond when the app requests data. A service outage is a third-party risk.
- **Asset-catalogue attribution accuracy** — share of assets with the correct attribution to The OldOS Project by Zane. An unattributed asset is a license violation.
- **Trademark-notice presence** — share of surfaces (README, the deployed site, the per-app footer) that include the iPhone / iOS / Apple trademark notice. A missing notice is a trademark risk.

## Pricing & Monetization

The source names no fee, no tier, and no commercial plan. The project is open source at the GitHub repo and deployed at nos4.fun. The asset catalogue is from The OldOS Project by Zane, with nOS4 sharing no code with it. iPhone, iOS, and the recreated app designs are trademarks of Apple Inc.; the project is an independent tribute. The plan does not invent a monetization the source does not name. Any future monetization has to be measured against the framework-import-direction adherence and the app coverage, because those are the metrics the source ties to the recreation's value proposition.

## Competitive Landscape

- **iOS simulators (the names the source does not provide)** — run real iOS in a sandboxed environment, not in the browser; require a macOS host and the iOS SDK.
- **The OldOS Project by Zane** — the inspiration; nOS4 shares no code with it, every screen was rewritten from scratch, the asset catalogue is the same.
- **Browser-based OS recreations (the names the source does not provide)** — exist; the source's pitch for nOS4 is the structural hierarchy that mirrors the real iOS and the twenty-three-app breadth.
- **Documentation and reverse-engineering write-ups (the names the source does not provide)** — describe iOS 4; the source's pitch is a runnable artifact in the browser, not a write-up.

The post names The OldOS Project by Zane as the explicit inspiration.

## Risks & Open Questions

- [ ] Confirm the structural hierarchy is enforced by a lint or a CI check. The README states the hierarchy; the open question is whether the codebase ships an automated check that refuses an upward import.
- [ ] Validate the strict-typecheck (`pnpm typecheck`) is the codebase's CI gate. The README names the script; the open question is whether CI fails the build on a typecheck regression.
- [ ] Define the policy on a third-party service outage. The apps depend on OpenStreetMap, Nominatim, OSRM, Open-Meteo, iTunes Search, iTunes RSS; the open question is whether the apps surface a graceful fallback or fail visibly.
- [ ] Confirm the asset-catalogue attribution is correct for every asset. The OldOS Project by Zane is the inspiration; the open question is whether every asset in the codebase has the attribution, or whether a per-asset audit is needed.
- [ ] Decide the policy on a trademark-notice gap. iPhone, iOS, and the recreated app designs are Apple trademarks; the open question is whether the trademark notice is in every surface (README, deployed site, per-app footer) and whether CI checks the notice.
- [ ] Define the policy on Game Center's Postgres dependency. Game Center needs `DATABASE_URL`; the open question is whether the project ships a docker-compose for a local Postgres, or whether the user is expected to bring their own.
- [ ] Establish a documented upgrade path when a new app is added. The app list is twenty-three plus two games; the open question is whether the project adds a twenty-fourth app, and how the per-app rendering adapts.
