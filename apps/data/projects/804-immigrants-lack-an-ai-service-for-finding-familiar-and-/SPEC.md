---
id: "804"
slug: immigrants-lack-an-ai-service-for-finding-familiar-and-
title: "Immigrants lack an AI service for finding familiar and verified places (pharmacies, doctors, banks) in a new country, causing daily stress and time loss"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/zlt9tnxv31-immigrants-lack-an-ai-service-for-findin"
  captured: "2026-01-03"
category: other
date: "2026-01-03"
tags: [Immigration, AI, Other]
country: Serbia
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Immigrants lack an AI service for finding familiar and verified places (pharmacies, doctors, banks) in a new country, causing daily stress and time loss

## Problem

A newly arrived immigrant in a host country needs to find a pharmacy, doctor, or bank account they can trust without spending hours cross-referencing Google Maps reviews, Facebook groups, and word-of-mouth. Generic maps surface tourist-heavy results or chains that don't speak the immigrant's language; community Facebook groups answer one-off questions but the answers don't stick. The post names the daily cost: time lost, mistakes made (wrong pharmacy stock, bank account fees that don't apply to the immigrant's status), and the recurring low-grade anxiety of not knowing whether a place is reliable or a scam.

## Objective

Ship a host-country directory that surfaces verified, community-rated pharmacies, doctors, and banks filtered by the immigrant's language, insurance status, and location — with persistent ratings and a way for trusted community members to vouch for a place rather than just star-rate it.

## Target Users

- Primary: first-90-days immigrants in any host country who need a reliable shortlist of everyday-service providers in their own language.
- Secondary: longer-tenure immigrants and expats who want a maintained, community-curated map rather than relying on stale Facebook threads.

## MVP Scope

- Country-scoped directories (start with 3 high-volume host countries: Germany, USA, UK) with categories: pharmacy, doctor (GP + specialists), bank, plus "verified by community" badge.
- Per-place page: address, hours, languages spoken, insurance accepted, community vouch count, recent immigrant reviews.
- Filter by spoken language and accepted insurance.
- A vouch model: a registered community member can vouch for a place once, weighted by their own tenure in the host country.
- No booking, no payment, no telemedicine in v1; the product is the directory.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/zlt9tnxv31-immigrants-lack-an-ai-service-for-findin` follows the constraints in `804-.../SPEC.md` and the chosen stack (React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM). The visual language follows `DESIGN.md`: neutral surface, single primary accent, dense table-driven listings and generous spacing on per-place detail.

For Serbia (founder's likely host), the defaults lean toward Cyrillic + Latin bilingual support, RSD currency glyph, and DD/MM/YYYY date format. The product itself is multilingual on launch, with language toggle top-right. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface, one accent for the "verified by community" badge, one muted accent for unverified entries. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for place codes and insurance IDs. Type scale is small (4 steps).

**Density** — table-driven for category listings; generous spacing for the per-place detail view.

**Motion** — minimal: page transitions only when the user explicitly navigates.

## Constraints

- A place cannot appear as "verified" without at least 3 vouches from registered community members with tenure ≥ 30 days.
- Reviews are visible only if the reviewer has a verified tenure ≥ 14 days.
- Place data is sourced from public registries where available (e.g. UK CQC for doctors, Apothekenverzeichnis for pharmacies) and never from scraped Facebook posts.
- Must run on a $5/month VPS via Coolify + Docker; no managed services that would push infra cost above that ceiling.