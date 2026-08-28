---
id: "262"
slug: immigrants-lack-an-ai-service-for-finding-familiar-and-
title: "Immigrants lack an AI service for finding familiar and verified places (pharmacies, doctors, banks) in a new country, causing daily stress and time loss"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/zlt9tnxv31-immigrants-lack-an-ai-service-for-findin"
category: other
date: "2026-01-03"
tags: [Immigration, AI, Other]
country: Serbia
---
# Immigrants lack an AI service for finding familiar and verified places (pharmacies, doctors, banks) in a new country, causing daily stress and time loss

## Problem

An immigrant who has just arrived in a new country cannot reliably find familiar and verified places: a pharmacy that stocks the medicine they used back home, a doctor who speaks their language, a bank that understands their documentation, a hairdresser who knows their hair type. Generic maps and review sites rank by proximity and star rating; they do not rank by "this place has served people like me."

The poster frames the missing piece as an AI service that ranks places by fit for the immigrant's specific situation, not by generic popularity. The pain is daily: every errand is a search, and every search is a gamble.

The post is short. It does not name a specific origin country, destination city, or category beyond pharmacies / doctors / banks. The framing is structural.

## Objective

Build a service that lets an immigrant describe their situation (origin country, languages spoken, medical needs, banking history, etc.) and returns a ranked list of nearby places that have served immigrants with a similar profile. The ranking is by evidence the service can cite, not by a star rating the service invents.

The MVP focuses on a single destination country (Serbia, named in the post) and three categories (pharmacies, doctors, banks), with place profiles that carry a "served immigrants from [origin country]" evidence tag rather than a fake star rating.

## Target Users

- Immigrants in Serbia who have just arrived and need to find pharmacies, doctors, and banks they can trust.
- Long-term immigrants in Serbia who need a place that handles a specific need (a prescription, a documentation type, a language).
- Diaspora networks and expat community organisations that would point newcomers to the service.
- Local pharmacies, doctors, and banks in Serbia that want a steady inbound flow from immigrant communities.

The source frames the user as the immigrant. The local business is named as a recipient of the immigrant's search, not as a buyer of the service.

## MVP Scope

- A small destination directory per category (pharmacies, doctors, banks) in Serbia's main cities (the post does not name a city; the MVP picks Belgrade and one secondary city).
- A place profile per listing: name, address, languages spoken, accepted documentation types, "served immigrants from [origin country]" evidence tag with date, contact.
- An immigrant-side search: the immigrant enters their origin country, languages, and category; the service returns a ranked list of places that match.
- An evidence flow: when a place reports having served a new immigrant, the immigrant confirms via a one-tap "I was helped here" action; the confirmation updates the place's evidence tag.
- A community Q&A surface: a small thread per place where immigrants ask and answer practical questions in their own language.

The MVP does not include booking, e-payment, or prescription handling. It is a directory with evidence, not a transactional platform.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/zlt9tnxv31-immigrants-lack-an-ai-service-for-findin` follows the constraints in `262-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Serbia.

For Serbia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Evidence must be real. A "served immigrants from [origin country]" tag the platform invents is a marketing surface, not evidence. The MVP must source the tag from a confirmation flow the immigrant triggers.
- Multilingual matters. Immigrants in Serbia come from many origins (Russia, Syria, China, elsewhere); the MVP must support searches in the immigrant's language, with results in Serbian and English where relevant.
- Category coverage is finite. The MVP is honest about the three categories (pharmacies, doctors, banks); it does not pretend to cover every category.
- Geographic coverage is finite. The MVP is honest about which cities it covers; it does not pretend to cover all of Serbia.
- Local-business trust: a pharmacy or a bank that learns it is listed on the platform must not be misled about what the listing says. The MVP publishes what the listing includes (evidence tag, languages, documentation accepted) and what it does not (a star rating the platform invents).
