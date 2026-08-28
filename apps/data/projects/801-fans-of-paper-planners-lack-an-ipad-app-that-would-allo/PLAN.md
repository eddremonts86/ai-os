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

## Tech Stack

Native iPad app in Swift and SwiftUI.
PDFKit for rendering imported PDF templates as page-sized backgrounds.
PencilKit for the on-top handwriting layer.
Local storage on-device for the MVP; CloudKit later if interviews justify it.

## Architecture

Three layers: a document store (one PDF template + one or more handwritten overlays per note), a renderer (PDFKit draws the template, PencilKit draws the strokes), and a basic library UI for opening and creating notes.

## Milestones

PDF import → Pencil writing layer → save and reopen → TestFlight → App Store submission.

## Risks

Apple Pencil latency and stroke fidelity expectations are high; reviewers will judge the app against Procreate/Goodnotes rather than against a generic note tool.
