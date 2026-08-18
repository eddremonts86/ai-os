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

## Tech Stack

Python + FastAPI for the orchestration. PostgreSQL for the template and candidate data. Vue.js for the manager UI. docx and weasyprint for the PDF and DOCX rendering. Playwright for any HTML-to-PDF steps. Airflow for the batch processing of multi-candidate runs.

## Architecture

Canonical CV → candidate store → template engine per partner → per-partner review page → output. Each template is a config (margins, font, section order, conditional inclusion). Output is a PDF or DOCX per partner.

## Milestones

M0 — five partner templates configured. M1 — canonical CV upload and per-partner variant generation. M2 — one-page human review. M3 — 30 recruiting teams in pilot. M4 — public launch with a template editor.

## Risks

Partner templates may change without notice. Subtle textual changes (e.g. removing a line) may affect the candidate's evaluation. PDF rendering must be pixel-perfect for the partner's intake system. The candidate's data must be kept confidential across partners.

## Data Model

## Integrations

Python + FastAPI for the orchestration. PostgreSQL for the template and candidate data. Vue.js for the manager UI. docx and weasyprint for the PDF and DOCX rendering. Playwright for any HTML-to-PDF steps. Airflow for the batch processing of multi-candidate runs.
