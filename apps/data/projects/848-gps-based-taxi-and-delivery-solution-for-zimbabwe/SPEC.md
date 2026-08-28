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

## Problem

A poster in Zimbabwe wants a GPS-based taxi and delivery solution. The poster names no specific city or fleet size. The need is a dispatch and tracking app that works on low-end Android phones and intermittent connectivity.

---

## Objective

Give Zimbabwean taxi and delivery operators a dispatch and tracking tool that works on the network and devices actually available there.

## Target Users

Small taxi associations and delivery operators in Zimbabwe, plus their drivers and the riders or senders who book them.

## MVP Scope

Three apps: a driver app (accept job, navigate, mark done), a rider/sender app (request, watch on map, pay cash), and a small operator dashboard (dispatch, monitor). Offline-first: queue actions locally, sync when online.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

Must work on Android 8 and on 2G/3G with intermittent signal. No live Google-Maps-equivalent in some areas; allow map tiles to be cached locally. Payment is cash on delivery in v1.
