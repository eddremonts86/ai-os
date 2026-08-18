---
id: "253"
slug: parents-lack-precise-warnings-about-violent-scenes-in-m
title: Parents lack precise warnings about violent scenes in movies to safely watch films with their children
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/media/ar3ebnm6c1-parents-lack-precise-warnings-about-viol"
category: media
date: "2026-01-10"
tags: [Media, Other]
country: India
---
# Parents lack precise warnings about violent scenes in movies to safely watch films with their children

## Problem

In India, parents who want to watch a film with their children — at home on a streaming service, on TV, or in a cinema — have no precise way to know what violent content is in the film before pressing play. Age ratings exist (U, U/A, A, S in India; PG, PG-13, R abroad), but they collapse very different content into one bucket: a "U/A" film can contain a single intense scene or a sequence of disturbing ones, and the parent has no way to tell which.

The poster frames the missing piece as a *precise* warning — the parent wants to know "this film has a graphic torture scene at minute 47 and a child-in-peril scene at minute 92," not "this film is rated U/A 12+."

The post is short. It does not quote specific streaming services, films, or incidents. The framing is that the gap exists between coarse age ratings and the actual content a parent needs to evaluate.

## Objective

Build (or assemble) a database of timestamped content warnings for films — violent scenes and other categories that parents commonly gate on (sexual content, substance use, peril, language) — that a parent can check before deciding whether to watch with their child. The deliverable is a per-film report: what is in the film, where in the film it happens, and how severe it is.

The MVP focuses on a small, hand-curated catalogue of films popular with Indian families (Hindi, Tamil, Telugu, Malayalam, English-with-Indian-dub) and a small set of warning categories. Algorithmic generation is intentionally not in the MVP.

## Target Users

- Indian parents who want to decide whether a film is appropriate for a specific child before watching it together.
- Indian parents who want a "movie night" with mixed-age children and need to know which scenes to skip or preview.
- Schools, libraries, and parent-teacher associations in India that organise film screenings for children and need an evidence-backed screening decision.
- Streaming platforms in India that want a third-party content-warning layer to supplement their own age ratings.

The source frames the user as the parent. The child is named as the recipient of the parent's decision, not as a buyer of the service.

## MVP Scope

- A per-film page that lists timestamped warnings: scene type, severity (mild / moderate / severe), and a one-line description (no spoilers of plot, only what would disturb a child).
- A small seeded catalogue of 50–100 films popular with Indian families across Hindi, Tamil, Telugu, Malayalam, and English-with-dub.
- A small set of warning categories: violence (with sub-tags: weapons, blood, peril, torture), sexual content, substance use, language, and peril / threat to a child character.
- A search and filter surface: by film title, language, year, and category. Severity tags are filterable so a parent can hide severe content and only see mild/moderate.
- A "scene-skip" view: a parent who has already decided to watch the film can use the timestamp list to skip specific scenes on a streaming platform.

The MVP does not include automatic scene detection (no ML in v1), review aggregation, or streaming-platform integration. The catalogue is human-curated.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/media/ar3ebnm6c1-parents-lack-precise-warnings-about-` follows the constraints in `253-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in India.

For India, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Spoiler discipline is non-negotiable. The page must say *what* is in the scene (a graphic injury, a child in peril) without saying *why* it happens in the plot. Parents use this to decide; children who overhear the page must not learn the plot.
- Cultural fit: warnings must reflect what Indian parents gate on, which is not always identical to what Western parents gate on (e.g., depictions of disrespect to elders, superstition, or specific phobias are parents' concerns in India but rarely tagged by Western services).
- Severity is a judgment, not a fact. Two curators may disagree on whether a scene is "moderate" or "severe." The MVP must surface the curator's name and the date of the review, not pretend severity is mechanical.
- Catalogue coverage is finite. The MVP must not pretend it covers every film; an "unreviewed" film is shown as such, not glossed over.
- Multi-language: films popular in India span at least five languages; the catalogue must support each, and the warnings should be available in English at minimum.
