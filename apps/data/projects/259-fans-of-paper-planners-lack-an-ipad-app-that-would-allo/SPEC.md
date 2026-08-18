---
id: "259"
slug: fans-of-paper-planners-lack-an-ipad-app-that-would-allo
title: Fans of paper planners lack an iPad app that would allow importing PDF layout templates and using them as a foundation for digital notes
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/productivity/l3grb6t2f1-fans-of-paper-planners-lack-an-ipad-app"
category: productivity
date: "2026-01-06"
tags: [Productivity, Other]
country: USA
---
# Fans of paper planners lack an iPad app that would allow importing PDF layout templates and using them as a foundation for digital notes

## Problem

Fans of paper planners — the audience that buys Filofax, Hobonichi, Midori MD, or printable weekly templates — want to keep their favourite layouts when they move to a digital device, but most note-taking apps for iPad (GoodNotes, Notability, NoteShelf, Apple's Notes) either lock the user into a fixed template set or treat imported PDFs as static background images with no notion of which region is a "day block," "habit tracker," or "weekly note." The poster frames the missing piece as an iPad app that imports PDF layout templates and uses them as a foundation — a real template the user can write on top of, with the layout preserved.

The pain is at the seam between paper and digital: the user has a layout they love (often purchased from an Etsy seller or designed themselves), and they want to use it on an iPad without retyping the structure every time. Existing apps do not deliver this seam; the user is stuck either with the app's templates or with a flat PDF overlay.

The post is short. It does not name specific apps, template sellers, or iPad models. The framing is structural.

## Objective

Build an iPad app that imports a PDF layout template (single page or planner template set), recognises the layout's functional regions (date blocks, habit rows, note areas, monthly overview) at least at a coarse level, and lets the user write on top of the template while preserving the layout underneath. The deliverable is a real iPad-native writing experience, not a web wrapper.

The MVP focuses on a small set of common template types (daily, weekly, monthly) and on the import-and-write loop. Smart recognition, automatic handwriting search across templates, and template marketplace integration are out of scope.

## Target Users

- iPad-owning users in the USA (and similar markets) who love the layouts they used on paper and want to use them on the iPad without giving up the writing experience.
- Productivity enthusiasts who maintain a daily / weekly / monthly planner across paper and digital devices.
- Independent template designers who sell PDF planners on Etsy or Gumroad and whose customers ask for an iPad-friendly way to use the templates.
- Students who prefer handwriting on a layout they have already learned (e.g., the Cornell note layout) but need a digital backup and search.

The source frames the user as the planner fan. The template designer is named as a downstream beneficiary, not as a buyer of the app.

## MVP Scope

- A native iPad app (iPadOS 17+) built in SwiftUI + PencilKit. PencilKit gives Apple Pencil handwriting and erasing at the lowest latency Apple supports.
- PDF import: the user drops a PDF (single page or multi-page) into the app; the app renders each page as a background layer that the user writes on top of.
- A coarse layout-recognition pass: the user (or the app) labels each PDF page as a template type (daily, weekly, monthly, custom). For pages labelled daily or weekly, the app adds a "today's date" badge that auto-updates when the user opens that template.
- A notebook structure: a notebook per template set, pages per import, with the original PDF preserved beneath the handwritten layer.
- Export: the user can export the filled template as a PDF (background + handwriting flattened) or share an image of a single page.

The MVP does not include automatic handwriting OCR across templates, automatic region detection via ML, or a template marketplace. The user labels templates by hand; the app respects the labels.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/productivity/l3grb6t2f1-fans-of-paper-planners-lack-a` follows the constraints in `259-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in USA.

For USA, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- The iPad-native experience is non-negotiable. A web wrapper that loads a PDF in a canvas is not what the user is asking for; PencilKit-level latency matters because the writing feel is the reason the user loved paper.
- Apple Pencil hover, double-tap-to-tool-switch, and low-latency ink are baseline. Anything worse than the iPad's stock Notes app on the same iPad is a regression.
- Template recognition is honest about its limits. The MVP labels templates by hand; it does not pretend to detect regions automatically. A "we detected 7 day blocks" claim that misses one is worse than no claim.
- Storage is local-first. The user's notebooks live on the iPad and in iCloud Drive; the service does not require a backend account to use the MVP.
- Privacy: the user is writing personal plans on the iPad. The MVP must not sync notebooks to a server the user did not opt into, must not OCR content server-side, and must document this clearly.
