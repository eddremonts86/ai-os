---
id: "815"
slug: indian-small-scale-waste-processors-lack-simple-b2b-too
title: Indian small-scale waste processors lack simple B2B tools for finding suppliers and controlling copper quality
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/business/2ge6lbk8e1-indian-small-scale-waste-processors-lack"
category: business
date: "2025-12-07"
tags: [Business, Other]
country: India
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Indian small-scale waste processors lack simple B2B tools for finding suppliers and controlling copper quality

## Problem

The captured source for this plan is a placeholder: only the country (India) and the title were scraped into SPEC.md. No body text was captured from the ProblemHunt post.

## Objective

Give small-scale waste processors in India a simple B2B surface to find suppliers and check the quality of the copper they buy.

## Target Users

Owner-operators of small scrap and recycling businesses in India who handle copper and need a faster way to source material and judge its grade.

## MVP Scope

A supplier directory for Indian scrap sources plus a simple copper-quality intake (photos and basic tests) that produces a consistent grade label the user can keep on file.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Source is thin: only the title and country are available, so scope is derived from the title signal alone.
- Connectivity in many Indian scrap yards is mobile-only and intermittent.
- Pricing is in INR; the MVP must handle small-ticket transactions cleanly.
