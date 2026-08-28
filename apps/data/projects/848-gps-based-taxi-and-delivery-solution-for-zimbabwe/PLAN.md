---
id: "848"
slug: gps-based-taxi-and-delivery-solution-for-zimbabwe
title: GPS-based taxi and delivery solution for Zimbabwe
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: logistics
date: "2025-11-14"
tags: [Logistics, Other]
country: Zimbabwe
tech: [Flutter (Android-first), Dart, Postgres, Node.js API (Fastify), Coolify, Docker]
---
# GPS-based taxi and delivery solution for Zimbabwe

## Tech Stack

Flutter (Android-first), Dart, Postgres, Node.js API (Fastify), Coolify, Docker.

## Architecture

Three thin clients (rider, driver, operator) talk to a Fastify API over HTTP. Driver and rider clients use a local SQLite store for offline actions and sync when online. Map tiles are cached on the device.

## Milestones

- M1: rider request + driver accept over a simple polling channel
- M2: offline action queue and sync
- M3: operator dashboard with live map and cash payment recording

## Risks

Offline-first is a hard requirement, not an optimization. Driver app must be a small APK.

- Map tile coverage in parts of Zimbabwe is poor; the app must degrade gracefully.
- Cash payments dominate; do not assume card rails in v1.
