---
id: "856"
slug: need-simple-application-testing-tool-without-programmin
title: Need simple application testing tool without programming
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/dev/ved547b251-need-simple-application-testing-tool-wit"
category: dev
date: "2025-11-04"
tags: [Dev, AI, No-Code, Other]
country: Kenya
tech: [Tauri (Rust + WebView), TypeScript, Node.js (Fastify), SQLite, Playwright (CDP), WireMock, Sentry, Cloudflare R2, M-Pesa (Daraja API sandbox), Coolify, Docker]
---
# Need simple application testing tool without programming

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A record-and-replay application testing tool for Kenyan developers and small teams, with a desktop client and a small self-hosted backend, that lets a user record a click-and-type journey through their own application in a real browser, save it as a named test, replay it as a regression run, and see failures in plain language with a screenshot, a step description and the moment the journey diverged from the recording. The tool requires no test code from the user — the recording is the test.

The product is deliberately scoped. It does not perform load testing or security testing, it does not host a multi-browser grid, and it does not require a CI pipeline to be useful. What it does is give a Kenyan developer or small team a regression check they can leave running on their own machine, with results they can read and screenshots they can show.

**One-liner:** A record-and-replay application testing tool for Kenyan developers and small teams that turns a click-and-type journey into a regression test, with failures explained in plain language and screenshots — and no test code required from the user.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Kenyan solo developers and small-team developers | Ship features without a maintained regression suite and need a no-code entry point. |
| Kenyan junior developers and graduates | Have been told to "write tests" without a working tool and need a way to start in week one. |
| Kenyan software bootcamps and instructors | Need a tool their students can use without a programming prerequisite. |
| Kenyan product teams at non-tech firms | Maintain internal apps and need a regression check that does not require a dedicated QA hire. |
| Kenyan freelance developers | Need a repeatable QA artefact to hand back with each delivery to an international client. |
| Kenyan hackathon and weekend-project builders | Want a regression check they can leave running without committing to a CI pipeline. |

## Jobs To Be Done

1. **Functional job** — Record a click-and-type journey through my application and save it as a named test.
2. **Functional job** — Replay a saved test against the same or a different environment and see plain-language failures with screenshots.
3. **Functional job** — Run a single test, a folder of tests, or the whole project on a schedule.
4. **Functional job** — Hand a colleague a runnable test artefact they can replay on their own machine.
5. **Emotional job** — Stop worrying about regressions in features I shipped last week.
6. **Social job** — Be able to show my client a passing regression run alongside a feature delivery.

## Success Metrics

- **Test creation rate** — share of new projects that contain at least one recorded test within the first week, which is the proxy for whether the no-code entry point is actually used.
- **Run success rate** — share of scheduled runs that complete without infrastructure failure, separate from test pass rate.
- **Test pass rate** — share of replayed tests that pass, tracked over time as a proxy for suite health rather than a vanity number.
- **Selector stability** — share of recordings whose selectors survive a single application redeploy, since brittle selectors are the failure mode the no-code strategy exists to prevent.
- **Failure explanation usefulness** — share of failures where the plain-language explanation included the divergent step and a screenshot, since vague failures are the reason test suites get abandoned.
- **Disclaimer acknowledgement** — share of runs for which the non-load-testing disclaimer was visibly rendered.

## Pricing & Monetization

The capture names no price, no tier and no business model; the only ground truth available is the title, the country and the category tags. What the architecture does fix is a cost shape: the desktop client is local, the backend is small, and the marginal cost per project is dominated by storage of recorded journeys and screenshots rather than per-test compute. A plausible paid shape is therefore a one-time licence for the desktop client with an optional paid cloud sync for teams, or a per-team subscription for the self-hosted backend with usage included; the actual price is left as an open question because the source gives no number to quote, and an African-market price band must reflect Kenyan purchasing power rather than a US default.

## Competitive Landscape

- **Selenium, Cypress and Playwright in script mode** — the mainstream tools, but require programming skill to use and maintain. The product competes on the no-code entry point and on plain-language failures.
- **Generic record-and-replay tools** — exist, but tend to be code-generating or hosted-cloud-first. The product competes on local-first storage and on the explicit non-load-testing positioning.
- **Manual QA on a checklist** — the incumbent for small teams. The product competes on repeatability and on the artefact that can be handed to a colleague or client.
- **CI-only test runners** — useful in mature teams but require the user to have a CI pipeline, which most small Kenyan teams do not.

The capture names no competitor by name, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the disclaimer language is sufficient for a regression-check tool; the capture gives no legal sign-off.
- [ ] Establish the default browser and device matrix for the Kenyan market on day one, given the capture names no specific combination.
- [ ] Decide how selector-stability feedback reaches the developer during recording, since the no-code strategy only works if brittle selectors are flagged.
- [ ] Set the retention policy for recorded journeys and screenshots, which may contain credentials typed into the developer's own app; the capture gives no data-retention rule.
- [ ] Determine who maintains the project-local selector taxonomy (data-testid conventions) long-term — the operator, the developer community, or the developer's own team — because the tool only works if the conventions are adopted.
- [ ] Confirm whether M-Pesa (Daraja API) integration for any paid tier is in scope at MVP, and under which Kenyan payment-processor partner.
