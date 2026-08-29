---
id: "787"
slug: a-pre-check-of-the-approval-chances-for-a-construction-
title: A pre-check of the approval chances for a construction project with the Australian council before making significant investments
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/realty/38t2m50py1-a-pre-check-of-the-approval-chances-for"
category: realty
date: "2026-01-18"
tags: [Realty, Legal, AI, Other]
country: Australia
tech: [SvelteKit, TypeScript, Postgres, Playwright sidecar (Node), NSW Planning Portal + Victorian Planning Schemes + data.gov.au APIs, PDF text extraction (pdf-parse), Self-hosted on a single VPS, no Coolify]
---
# A pre-check of the approval chances for a construction project with the Australian council before making significant investments

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

Australian councils publish their planning controls, but they publish them across dozens of portals, in PDFs and in state-by-state formats that do not interoperate. A small developer or owner-builder who wants to know whether their project has a chance of being approved has to read the planning scheme for the relevant council, decode the overlays that apply to the address, and guess how the council will weigh them. The cost of getting it wrong falls late: drawings, consultants, a DA submission that gets knocked back.

The product collapses that pre-check into one structured read. The user enters an Australian address and a project type; the tool resolves the council, pulls the relevant zoning and overlays, extracts the controls from the published PDFs where needed, and renders a report that names each control, states whether the proposal appears to comply and indicates the confidence level. The browser-based portals are queried through a Playwright sidecar so a portal change does not take down the rest of the service.

The pre-check is explicitly not a DA assessment. The report names that distinction on every page and points the user to a registered planner for a binding assessment, because the tool's job is to stop wasted investment, not to substitute for professional advice.

**One-liner:** An Australian council pre-check tool that turns an address and a project type into a structured read of the relevant planning controls with a confidence level, so the user finds out what will fail before they spend.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Small developers and builders | They need to know whether the project is worth pursuing before they engage a designer; the tool flags the obvious blockers early. |
| Owner-builders | A knock-down rebuild or extension is a major financial commitment; the pre-check tells them whether the planning controls support it. |
| Buyers of development sites | A property's potential depends on the overlays attached to its address; the pre-check surfaces that before they sign. |
| Town planners and architects | A first-pass sanity check that reads the relevant controls for them, freeing their time for the judgment calls. |
| Conveyancers and buyers' agents | A structured summary of the planning context for an address, used to advise the client before exchange. |

## Jobs To Be Done

1. **Functional job** — Find out whether the planning controls attached to an address support the project before any money goes into drawings.
2. **Functional job** — Read the relevant overlays, zoning and design code for a council without manually parsing PDFs and portal pages.
3. **Functional job** — Get a confidence level that distinguishes a clear "no" from a "probably yes, with conditions" so the next step is obvious.
4. **Emotional job** — Stop worrying that the project will be knocked back late and expensively.
5. **Social job** — Walk into a meeting with a planner or architect with a structured summary instead of a vague impression.

## Success Metrics

- **Coverage honesty** — share of reports that name every control the tool claims to check; a report that omits a control it should have read is worse than no report.
- **Confidence calibration** — share of "probably yes" results that turn out to be approved DA outcomes, tracked at the level of councils and project types where the data allows.
- **Time to report** — median seconds from address entry to rendered pre-check report. A pre-check that takes an hour is not a pre-check.
- **Portal-uptime** — share of weekdays where the Playwright sidecar succeeded against each supported portal, since a portal change can silently break the data path.
- **PDF extraction accuracy** — share of published planning scheme PDFs the tool can extract searchable text from without manual intervention.
- **Confidence-flag rate** — share of reports that include at least one "could not verify" flag, since a confidence level that is always high is a lying confidence level.

## Pricing & Monetization

The post names no price, no tier and no business model; it is a one-line ProblemHunt problem statement from Australia. The architecture forces a particular cost shape nonetheless: portal queries via Playwright scale with the number of pre-checks performed, PDF extraction scale with the number of distinct planning schemes indexed, and the storage of public planning controls is small but real. Any paid tier would therefore have to be bounded by the number of pre-checks per month or by a per-property pre-check fee tied to a council, not by a per-seat SaaS subscription, since the user is one person asking about one address at a time.

The post names no incumbent or comparison point, so the listing above is the existing channels a buyer might already be using and is not a market survey.

## Competitive Landscape

- Manual reading of the council planning scheme — what the tool replaces: open data, free, but time-consuming and inconsistent across councils.
- Registered town planners — the professional the tool defers to on a binding assessment: expensive and slow for a pre-check but the right next step after the tool flags what to look at.
- Generic property-data sites that show zoning on a map — useful for a first glance but do not read the planning controls and do not produce a pre-check report.

The post names no competitor, so the landscape above is the existing tools a small developer typically turns to and is not a market map.

## Risks & Open Questions

- [ ] Decide which councils the MVP honestly supports and refuse an address outside that set rather than returning a low-confidence guess.
- [ ] Confirm the Playwright sidecar is isolated from the rest of the service so a portal change cannot take down the report generation.
- [ ] Establish how the tool phrases a confidence level the user can interpret, rather than a flat percentage.
- [ ] Verify the PDF extraction accuracy on the most-used planning schemes before depending on it for anything beyond search.
- [ ] Audit the wording on every report for anything that could read as a planning opinion, since the tool is a pre-check and not an assessment.
- [ ] Decide what the tool does when the planning scheme has been amended since the published PDF, since public data can lag a council resolution.
