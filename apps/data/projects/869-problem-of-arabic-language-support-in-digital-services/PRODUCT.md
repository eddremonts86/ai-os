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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A developer-facing diagnostic that takes a digital service's Arabic text and layout inputs and reports where the service is wrong, with a fix-it recipe for each finding. The diagnostic separates bidi problems from shaping problems from indexing problems, and surfaces the Modern Standard Arabic / Moroccan Darija split as a first-class decision the operator has to make.

The capture names no specific service that fails and no user count, and the diagnostic is honest about that. It owns the analysis, the rendering and the report; it does not own the digital service the operator is building, and it does not pretend to know what the operator's product does. The country in the frontmatter shapes where the diagnostic is hosted and which Arabic variants are first-class, not the shape of the analysis itself.

**One-liner:** A developer-facing diagnostic that names where Arabic handling is broken in a digital service, with a fix-it recipe for each finding and the dialect decision surfaced as a first-class choice.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Front-end developers in Morocco | Ship interfaces that handle Arabic and need a tool that names exactly what is wrong. |
| Localisation leads reviewing output | Need a checklist that separates bidi problems from shaping problems from indexing problems. |
| Backend engineers integrating search | Need to know which Arabic variant their system is actually serving. |
| QA engineers writing test cases | Need reproducible inputs that exercise the bidi, shaping and diacritics cases that fail most often. |
| Product managers scoping Arabic support | Need a defensible scope and a list of the parts of their service that will need fixing. |

## Jobs To Be Done

1. **Functional job** — Submit a piece of mixed Arabic and Latin text and receive a deterministic report that names every bidi, shaping and diacritics problem.
2. **Functional job** — Declare which Arabic variant the operator's service is serving and have the diagnostic surface that decision downstream.
3. **Functional job** — Run the same set of test inputs as a CI gate that fails when the operator's service regresses on Arabic handling.
4. **Emotional job** — Stop wondering whether the Arabic output the operator is shipping is correct in a way that cannot be checked by reading it.
5. **Social job** — Have a defensible answer to the question "how do you know your service handles Arabic correctly" that is not a screenshot.

## Success Metrics

- **Finding-to-fix rate** — share of findings the operator marks as fixed after acting on the recipe, which is the step the diagnostic exists to deliver.
- **CI-gate adoption** — share of operators who wire the fixture set into their build, since a diagnostic that is not in CI is a diagnostic that runs once.
- **Variant declaration rate** — share of operators who declare an Arabic variant for their service, since the dialect decision is the one most often left implicit.
- **Report determinism** — share of repeated runs over the same input that produce the same report, which is a feature the operator depends on.
- **Bidi false-negative rate** — share of mixed-direction inputs the diagnostic marks as clean that actually contain a bidi error, which the operator will check by hand.
- **Shaping coverage** — share of the Unicode Arabic block for which the operator's font has a complete glyph table, reported per font the operator uploads.

## Pricing & Monetization

The capture names no price, no payer and no business model, and the architecture is developer-facing and self-hosted, so there is no SaaS unit to charge against by default. What the design does fix is the cost shape: the expensive resource here is the operator's engineering time spent reading the report and applying the recipes, not compute, so any future paid offering has to live with that and stay optional. The honest read is that the tool is paid for by being local-first, and any revenue direction — a hosted tier with shared fixture sets, a paid font-licence integration, an institutional license for localisation teams — stays an open question rather than a plan.

## Competitive Landscape

- **Hosted translation and localisation platforms** — abundant, but the capture's complaint is about support, not translation, and a translation service does not name the bidi, shaping and indexing problems the diagnostic exists to find.
- **Bidi and shaping libraries** — produce the underlying analysis, but a library is not a diagnostic, and the work the operator does around it is the value the diagnostic sits between.
- **Manual code review and screenshot QA** — solve the same problem at human cost, and the diagnostic exists because that cost does not scale across a service's surface area.

The capture names no specific competitor, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the digital services the diagnostic should target, because the input shape differs for a web app, a mobile app and a backend pipeline and the source names none.
- [ ] Decide which Arabic variants the diagnostic declares as first-class, since Modern Standard Arabic and Moroccan Darija are two but the broader region has more and the source does not name them.
- [ ] Establish a defensible threshold for what counts as a bidi or shaping failure, because a diagnostic that fires on inputs most operators consider correct is a diagnostic nobody trusts.
- [ ] Confirm the font-upload story works for the operator's font licence, because a shaping checker that cannot see the operator's font is a shaping checker that cannot help.
- [ ] Resolve how long uploaded fonts are retained, since the operator owns the storage and the licence terms vary.
- [ ] Test whether the fix-it recipes actually fix the underlying problem, since a recipe that is plausible but wrong is worse than no recipe at all.
