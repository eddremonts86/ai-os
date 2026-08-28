---
id: "842"
slug: problem-of-product-selection-and-production-capacity-pl
title: Problem of product selection and production capacity planning
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: business
date: "2025-11-14"
tags: [Business, Other]
country: India
tech: [React (Vite), TypeScript, javascript-lp-solver (browser), Static hosting]
---
# Problem of product selection and production capacity planning

## Tech Stack

React (Vite), TypeScript, javascript-lp-solver (browser), Static hosting.

## Architecture

Browser-only. Inputs live in localStorage. The LP runs client-side. Output is a plan table plus a bottleneck chart.

## Milestones

- M1: input forms for capacity, SKUs, demand
- M2: LP solver integration and recommended plan view
- M3: bottleneck and sensitivity report

## Risks

Single-user spreadsheet-like UI. Optimization runs in the browser via a small JS LP library.

- Demand forecasts are usually wrong; the plan must surface this rather than hide it.
- Users may want ERP integration later; design the data model so a CSV export is clean.
