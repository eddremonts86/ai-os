---
id: "245"
slug: a-pre-check-of-the-approval-chances-for-a-construction-
title: A pre-check of the approval chances for a construction project with the Australian council before making significant investments
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/realty/38t2m50py1-a-pre-check-of-the-approval-chances-for"
category: realty
date: "2026-01-18"
tags: [Business, Other]
country: Australia
tech: [Next.js 14, TypeScript, PostgreSQL, Python PDF parsers, Stripe, S3-compatible storage, SendGrid]
---
# A pre-check of the approval chances for a construction project with the Australian council before making significant investments

## Tech Stack

Next.js 14 (TypeScript) for the marketing site, intake form, and report viewer. Python for the planning-scheme ETL and report generation (chosen for the rich PDF / HTML parsing ecosystem). PostgreSQL for properties, councils, planning schemes, reports. S3-compatible storage for report PDFs. Stripe for one-time payment. SendGrid for report delivery.

## Architecture

Three services: a Next.js intake and report viewer, a Python ETL pipeline that ingests each council's planning scheme and decision history, and a Python report-generation worker that combines council data with the user's project description to produce a structured PDF.

## Milestones

M1: Intake form and Stripe payment. M2: ETL pipeline for the 5 largest Australian councils. M3: Report-generation template and PDF rendering. M4: Report viewer in Next.js. M5: Expansion to 20 councils.

## Risks

Australian council data formats vary widely and require per-counsel work. Legal-advice disclaimer must be prominent. Calibration of the approval-likelihood score is hard without ground-truth data; needs ongoing feedback loop with customers.
