---
id: "4198"
slug: hybrids-a-daily-flower-logic-puzzle
title: "Hybrids – a daily flower logic puzzle"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509199"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Hybrids – a daily flower logic puzzle

## Tech Stack

- React + TypeScript single-page app, mobile-first
- TanStack Start as the Node.js API for daily puzzle fetch
- SQLite with Drizzle ORM for puzzle storage and a future archive
- Coolify + Docker to self-host the API and front-end
- Static asset CDN for art assets (SVG flowers)
- Cron or scheduled function for daily puzzle release

## Architecture

A small API serves the current day's puzzle by date key; the client renders the flower grid, the hybridisation rule, and a shareable result grid on solve. The artist defines each puzzle in advance (rules, flowers, answer); the API is read-mostly, with one cron job per day flipping the active puzzle. No account, no state on the server beyond the puzzle content; client-side state holds the in-progress attempt and the streak.

## Milestones

1. Hand-authored puzzle data format with one example puzzle
2. Single-page React app with daily fetch, flower grid, and hybrid tap interaction
3. Solve detection and a shareable emoji grid
4. Cron job for daily puzzle release
5. Mobile-first layout and offline-capable service worker
6. Optional: archive mode with locked streak view

## Risks

- One puzzle per day caps retention after the novelty fades
- Hand-authored puzzles do not scale; need a generative system if growth happens
- Mobile browser compatibility for SVG art across iOS and Android
- Ad or commerce model unclear from the source