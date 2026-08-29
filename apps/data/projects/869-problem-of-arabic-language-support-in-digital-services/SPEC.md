---
id: "869"
slug: problem-of-arabic-language-support-in-digital-services
title: Problem of arabic language support in digital services
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/other/taootfgpp1-problem-of-arabic-language-support-in-di"
category: other
date: "2025-10-29"
tags: [Other]
country: Morocco
tech: [Go, go-i18n, ICU4C, PostgreSQL, SvelteKit, Docker]
---
# Problem of arabic language support in digital services

## Problem

The capture names a problem and a country and nothing else: the problem of Arabic language support in digital services, filed from Morocco under other with a generic Other tag. It is a category-level statement from ProblemHunt, so there is no poster narrative, no specific service the poster was trying to use, no user count and no quoted failure. What follows reasons from the title, the country and the general engineering facts that are safely knowable about Arabic in software.

Arabic has a small set of well-defined properties that the rest of computing has to handle correctly, and each one is a real, specifiable problem rather than a complaint. Right-to-left layout and bidirectional text is the headline: the Unicode Bidirectional Algorithm decides for every run of characters whether it flows right-to-left, left-to-right, or is mixed, and most rendering pipelines still get the mixed case wrong somewhere. Arabic script shaping is a separate problem: each letter has up to four forms depending on position, and a font that ships glyphs for the isolated form but not the medial form produces visible gaps in connected text. Diacritics are optional in Modern Standard Arabic and rare in everyday writing, so search and indexing systems that strip them must strip them consistently, and systems that keep them must rank them correctly. Digit forms differ across the region, with Eastern Arabic-Indic digits in some countries and Western Arabic-Indic digits in others, and the choice has to be made explicitly rather than inherited.

The country in the frontmatter is Morocco, which the design has to take seriously. Modern Standard Arabic is the formal written standard; Moroccan Darija is the everyday spoken and increasingly written variety, and the two are materially distant. Anything in the pipeline that touches a language model or a search index — autocomplete, intent matching, search ranking — has to decide which one it serves, because serving neither correctly is the failure the title names. The country shapes the deployment, not the design.

The capture does not name a specific service that fails, a user count or a market size, so the plan scopes to the narrowest thing that addresses the engineering surface above: a diagnostic layer that a developer can point at a digital service and see where Arabic handling is wrong, and the documentation that lets the developer fix it.

## Objective

Build a developer-facing diagnostic layer that takes a digital service's text and layout inputs and reports where Arabic handling is broken, with a fix-it recipe for each finding. The layer owns the rendering, the bidi analysis and the index checks; it does not own the digital service the operator is building, and it does not pretend to know what the operator's product does.

## Target Users

- Front-end developers in Morocco and the broader Arab region who ship interfaces that handle Arabic and need a tool that names exactly what is wrong.
- Localisation leads reviewing a service's Arabic output, who need a checklist that separates bidi problems from shaping problems from indexing problems.
- Backend engineers integrating Arabic into a search index or a language-model pipeline, who need to know which Arabic variant their system is actually serving.
- QA engineers writing test cases for Arabic support, who need reproducible inputs that exercise the bidi, shaping and diacritics cases that fail most often.
- Product managers deciding whether to ship Arabic support at all, who need a defensible scope and a list of the parts of their service that will need fixing.

## MVP Scope

- A bidi analyser that takes a string of mixed Arabic and Latin text and reports the resolved direction for every run, with a reproducible input set that exercises the cases the Unicode algorithm handles worst.
- A shaping checker that takes a string and the font the operator is using and reports which letter forms are missing from the font's glyph table.
- A diacritics inspector that reports which marks are present, which are missing, and how the operator's index strips or keeps them, so the operator can decide which behaviour matches their product.
- A digit-form checker that reports whether the operator's interface is using Eastern, Western or mixed Arabic-Indic digits, with a documented switch for the operator's target market.
- A variant selector that lets the operator declare Modern Standard Arabic, Moroccan Darija, or both, and reports which downstream component is serving which variant.
- A web surface built in SvelteKit that renders the report and links each finding to a documented fix-it recipe.
- A reproducible fixture set for the test cases named above, stored in the repository and runnable without the web surface.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The source names neither a specific service, a user count nor a market segment, so the diagnostic must not assume an industry, a region or a product shape. Everything the operator varies stays operator input.
- Bidi and shaping are not subjective. The diagnostic must produce deterministic outputs that match the Unicode standard, and disagreements with the standard are bugs in the diagnostic rather than disagreements to debate.
- Fonts are an operator choice, and a shaping checker that pretends the font does not matter is a checker that lies. The diagnostic must require a font and report on the one the operator gave it.
- The Modern Standard Arabic / Moroccan Darija split is the kind of decision that quietly accumulates bugs, so the diagnostic must surface it explicitly rather than let the operator pick one and forget.
- The web surface is for developers, not for end users, and it must not be designed to be pretty at the expense of being correct.
- Morocco is the named market, so the deployment must run on the operator's own infrastructure without depending on a third-party service that is unavailable or unfit for that market.
