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

## Tech Stack

- **Go** for the diagnostic core, because the bidi and shaping analysis is CPU-bound, deterministic and benefits from a single static binary the operator can run in CI without a runtime.
- **go-i18n** for message and locale handling, since the diagnostic's own output has to handle Arabic correctly to be trusted, and using the same library the operator's service is likely to use keeps the example code honest.
- **ICU4C** through its Go bindings for the bidi algorithm and the shaping tables, because the Unicode Bidirectional Algorithm and the Arabic shaping rules are not reimplemented correctly by anyone who has not read the standard, and ICU is the reference implementation.
- **PostgreSQL** as the store for reports and fixture sets, chosen because the report is structured, the fixtures need to be diffable across runs, and the operator's CI needs a stable store it can query.
- **SvelteKit** for the developer-facing web surface, because the surface is a developer tool rather than a public application, and SvelteKit ships a small server bundle that the operator can host without a heavy front-end framework.
- **Docker** as the deployment shape, because the diagnostic runs alongside the operator's service and the operator already uses containers for that service.

## Architecture

The operator submits a piece of text and a font through the SvelteKit surface or the CLI. The submission lands at the diagnostic core, which is a single Go binary that calls into ICU4C for bidi resolution and shaping. The core produces a deterministic report: a list of findings, each with a reproducible input, the standard it violates, a severity and a link to a fix-it recipe stored alongside the fixtures.

The bidi analyser resolves the input according to the Unicode Bidirectional Algorithm and reports any run where the resolved direction differs from what the operator's layout engine is producing. The shaping checker enumerates the Arabic letters in the input, looks up the position-dependent forms in the operator's font's glyph table, and reports any form that is missing. The diacritics inspector reports the marks present and the marks stripped, and the digit-form checker reports which Arabic-Indic digit set the operator's interface is using. The variant selector records the operator's declared Arabic variant for the run and surfaces it in every downstream report.

Reports are written to PostgreSQL with the run's input, the operator's font, the declared variant and the findings list. Fixtures are checked into the repository as YAML and runnable as a Go test, so the operator can wire the same checks into CI. The web surface reads the reports back and renders each finding with its recipe; the CLI does the same without the surface, so the diagnostic works in a build pipeline without a browser.

## Milestones

1. **M1 — Core diagnostic** — Go binary with bidi resolution and shaping check via ICU4C, deterministic report output, and a CLI that writes the report to JSON.
2. **M2 — Variant selector** — first-class declaration of Modern Standard Arabic or Moroccan Darija for a run, with the declared variant surfaced in every report.
3. **M3 — Fixture set** — reproducible YAML inputs that exercise the bidi, shaping, diacritics and digit-form cases the Unicode standard handles worst, runnable as a Go test.
4. **M4 — Storage** — PostgreSQL-backed report history with input, font, declared variant and findings, queryable by run.
5. **M5 — Web surface** — SvelteKit page that renders a report and links each finding to its fix-it recipe.
6. **M6 — CI integration** — a documented path for running the fixture set as a CI gate on the operator's service, with a clear contract for what a failure means.

## Risks

- **Wrong reference implementation** — bidi and shaping are not subjective, and a bug in the ICU bindings or in how the core calls them is a bug that misleads every operator, so the core must be tested against the standard's published examples.
- **Font coverage lie** — a shaping checker that reports a font as complete when it is not is a checker that costs the operator a release, so the report must distinguish glyph-table coverage from visual rendering.
- **Variant ambiguity** — Modern Standard Arabic and Moroccan Darija share a script and not much else, and an operator who declares one and serves the other is a service the diagnostic cannot save, so the declaration must be required.
- **Recipe drift** — a fix-it recipe that no longer matches the current version of the operator's library is a recipe that costs the operator time, so the recipes must be versioned alongside the library versions they target.
- **CI gate noise** — a fixture set that fires on inputs most operators consider correct is a gate that gets disabled, so the threshold has to be measured against real services rather than invented.
- **Bidi false negatives** — mixed-direction text that the diagnostic marks as clean is the worst failure mode, and a periodic manual review of the fixture set is the only way to keep the false-negative rate honest.
