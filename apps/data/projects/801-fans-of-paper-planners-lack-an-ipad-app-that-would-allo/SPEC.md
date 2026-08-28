---
id: "801"
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
tech: [Swift, SwiftUI, PencilKit, PDFKit, CloudKit]
---
# Fans of paper planners lack an iPad app that would allow importing PDF layout templates and using them as a foundation for digital notes

## Problem

The title states the gap: people who like paper planners cannot find an iPad app that imports a PDF planner template and lets them write on it as if it were paper. The post gives no quoted user, no price sensitivity, no template-format detail beyond "PDF layout templates", and no feature list beyond the import-and-write idea itself.

## Objective

Build an iPad app that takes a PDF planner template as input and renders it as a writable, layer-able note surface.

## Target Users

People who like paper planners (per the title) and already own an iPad with Apple Pencil.

## MVP Scope

iPad app that imports a PDF, shows it as a background template, and lets the user write/draw on top of it with Apple Pencil. Save and reopen notes. No multi-user sync in the MVP.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

iOS App Store distribution rules for any export/share feature; PDF import UX must tolerate templates of varying page sizes.
