---
id: "214"
slug: "5-partners-5-different-cv-templates-managers-spend-2040"
title: "5 partners — 5 different CV templates. Managers spend 20–40 minutes on each adaptation, up to 15 times a month."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: hr
date: "2026-03-13"
tags: [HR, Productivity, Recruiting]
country: Russia
tech: [Python, FastAPI, PostgreSQL, Vue.js, docx, Playwright]
---
# 5 partners — 5 different CV templates. Managers spend 20–40 minutes on each adaptation, up to 15 times a month.

## Problem

A recruiting team in Russia works with five partner companies, each of which requires a different CV template. Managers spend 20–40 minutes per adaptation, repeated up to 15 times a month, copying the same candidate data into five different shells. The work is not judgment — it is text-marshalling, and the same candidate pays the cost in lost time. No off-the-shelf ATS (Greenhouse, Lever, Workable) handles this automatically because partner-specific templates are not a standard feature. Internal scripts do this for one or two templates and then break. The result is a hidden productivity tax that nobody tracks because the candidates feel the delay, not the recruiters.

## Objective

A small pipeline that takes a single canonical CV and produces the five partner-specific variants automatically, with a one-page human review per candidate before submission.

## Target Users

Recruiting teams in Russia and Eastern Europe working with 3-10 partner companies, each with a different CV template. Also executive-search firms with the same multi-template pain.

## MVP Scope

Web app where a manager uploads a canonical CV (or selects a candidate from the ATS). Pipeline produces five variants matching the partner templates. Recruiter reviews a single one-page summary per candidate. Output: five PDF files ready to submit. Five templates in v1, configurable later.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/` follows the constraints in `214-.../SPEC.md` and the chosen stack (Python, FastAPI, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Must NOT alter the candidate's substantive content without manager approval. Each partner template must be configurable (margins, font, section order). Output must match the partner's intended visual style. No data leaves the tenant's storage.
