---
id: "259"
slug: fans-of-paper-planners-lack-an-ipad-app-that-would-allo
title: Fans of paper planners lack an iPad app that would allow importing PDF layout templates and using them as a foundation for digital notes
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/productivity/l3grb6t2f1-fans-of-paper-planners-lack-an-ipad-app"
category: productivity
date: "2026-01-06"
tags: [Productivity, Other]
country: USA
---
# Fans of paper planners lack an iPad app that would allow importing PDF layout templates and using them as a foundation for digital notes

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/259-fans-of-paper-planners-lack-an-ipad-app-that-would-allo/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the notebook store in Core Data with a CloudKit-backed store so notebooks live on the iPad and in iCloud Drive; no separate account required.
- [ ] Implement PDF import via PDFKit; render each page as a background layer the user can write on top of.
- [ ] Add PencilKit handwriting and erasing; benchmark latency against the iPad stock Notes app on iPad Air (M1) and iPad Pro (M2/M4); anything worse is a regression.
- [ ] Add template labelling: the user labels each page (daily, weekly, monthly, custom); daily/weekly pages show a date badge that updates on open.
- [ ] Implement export: flatten background + handwriting into a PDF via UIGraphicsPDFRenderer; share via the standard iPad share sheet.
- [ ] Document and publish the conflict-resolution policy (last-write-wins) for iCloud Drive sync.
- [ ] Ship a TestFlight beta and validate with five iPad planner fans before App Store release.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (the chosen stack) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 259-fans-of-paper-planners-lack-an-ipad MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in USA completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for the chosen stack errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
