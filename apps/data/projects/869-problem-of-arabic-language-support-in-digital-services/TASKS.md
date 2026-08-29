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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/869-problem-of-arabic-language-support-in-digital-services/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the Go binary that calls ICU4C for bidi resolution and shaping, with deterministic report output written to JSON
- [ ] Add the variant selector for Modern Standard Arabic and Moroccan Darija, required at submission time and surfaced in every report
- [ ] Implement the diacritics inspector that reports present marks, stripped marks and the index behaviour
- [ ] Implement the digit-form checker that reports Eastern, Western or mixed Arabic-Indic digit usage
- [ ] Author the YAML fixture set that exercises bidi, shaping, diacritics and digit-form cases and run it as a Go test
- [ ] Add the PostgreSQL-backed report history with input, font, declared variant and findings
- [ ] Render the SvelteKit page that shows a report and links each finding to its fix-it recipe
- [ ] Version every fix-it recipe against the library version it targets, and reject reports that reference a recipe version the operator has not declared
- [ ] Document the CI integration path for running the fixture set as a gate on the operator's service, with a clear contract for what a failure means
- [ ] Add a periodic manual review process for the fixture set so the bidi false-negative rate stays honest

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
