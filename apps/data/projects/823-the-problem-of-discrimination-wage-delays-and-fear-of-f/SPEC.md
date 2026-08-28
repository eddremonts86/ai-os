---
id: "823"
slug: the-problem-of-discrimination-wage-delays-and-fear-of-f
title: "The problem of discrimination, wage delays, and fear of firing/deportation among immigrant construction workers in the USA"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ydplsur631-the-problem-of-discrimination-wage-delay"
category: other
date: "2025-12-01"
tags: [Immigration, Career, Legal, Other]
country: USA
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# The problem of discrimination, wage delays, and fear of firing/deportation among immigrant construction workers in the USA

## Problem

The captured source for this plan is a placeholder: the Problem section was not populated and only the title was scraped into SPEC.md.

## Objective

Give immigrant construction workers in the USA a way to track wage promises, log incidents of discrimination or wage theft, and access legal help without putting their status at risk.

## Target Users

Immigrant construction workers in the USA who face discrimination, delayed wages, or fear of retaliation and deportation if they complain.

## MVP Scope

A private logbook for hours worked, wages owed and incidents, plus a vetted legal-aid directory filtered by language and immigration-sensitive cases.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Source is thin: only the title is available, so scope is derived from the title signal alone.
- Privacy and physical-safety stakes are the highest in this corpus; any MVP that stores data must make export-and-delete trivial.
- Vetted legal aid is a thin supply in many US states and the directory must not overstate it.
