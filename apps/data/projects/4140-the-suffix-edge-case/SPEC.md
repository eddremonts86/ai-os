---
id: "4140"
slug: the-suffix-edge-case
title: The Suffix Edge Case
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49511992"
category: ask-hn
date: "2026-08-31"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# The Suffix Edge Case

## Problem

Holders of name suffixes (Jr., Sr., II, III, IV, PhD, MD) keep seeing title-case routines mangle the trailing token: "II" becomes "Ii" and the same for any other short suffix. The poster notes this has been an issue for years and lists government systems and LegalZoom as repeat offenders — on LegalZoom there is no Suffix dropdown on the legal document form, so the suffix has to be shoehorned into the Last Name field, which then gets mangled downstream and breaks the produced document. The poster spent roughly forty minutes on a support call getting LegalZoom to resolve the issue manually. The root cause is that title-casing code paths treat every word in a full name as a generic word and apply a capitalise-first-letter rule to all of them, with no awareness of a curated suffix list or a dedicated suffix slot in the form schema.

## Objective

Capture the failure mode as a reusable piece of knowledge for name-handling code, so that any future intake form, document generator, or downstream normalisation step can avoid the II/III/IV/Jr/Sr/PhD/MD mangling without re-deriving the rule.

## Target Users

Engineers building intake forms, KYC flows, legal document generators, and any system that has to preserve the case of short trailing tokens in a personal name. Secondary reader: product managers triaging bug reports that look like "my name is broken on screen".

## MVP Scope

A reference note: a small set of canonical English-language personal-name suffixes (generational: Jr, Sr, II, III, IV, V; professional: PhD, MD, DDS, Esq; honorific: Hon, Rev) and a checklist for forms and pipelines that explains when a dedicated Suffix slot is mandatory and when a suffix-preserving tokeniser is acceptable. Format is a written document with examples.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

The post describes the symptom and one concrete vendor incident but does not enumerate every suffix class that needs preserving, and does not cite any standard (US, UK, EU) that codifies the list. The reference note must label its suffix list as a starting point rather than exhaustive.