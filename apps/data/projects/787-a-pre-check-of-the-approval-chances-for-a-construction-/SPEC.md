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

## Problem

The poster wants a pre-check of how likely a construction project is to be approved by an Australian council before any significant investment is made. The phrase "pre-check" is the operative one: the goal is to find out where the project will fall down — zoning, overlays, neighbour constraints, design code — before money goes into drawings, consultants or a DA submission. The pain is discovering, late and expensively, that a piece of land or a design is not going to fly.

The capture is a one-line ProblemHunt problem statement with the country Australia as its only extra detail. The title carries the rest: the actor is a small developer, builder or owner considering a project, the pain is the late discovery that a project will not be approved, and the missing thing is a structured pre-check tool grounded in Australian planning data. The poster names no state, no council and no project type, so we cannot claim the project is residential or commercial or rural; what we can work from is the pre-check shape of the title and the Australian-council constraint, which together pin the tool to public planning data rather than to private consultant relationships.

The implied hard parts are data quality and honesty about confidence. Australian planning data is published state by state and varies in shape; a tool that claims a national coverage it does not have is worse than one that names the councils and overlays it actually understands. The other hard part is the difference between "the planning scheme says no" and "the planning scheme says probably yes, with conditions" — a pre-check that does not distinguish those two outcomes is not worth the time the user spent entering the address.

## Objective

Ship an Australian council pre-check tool that turns a project address, a project type and a sketch of the proposal into a structured read of the relevant planning controls and a clear statement of approval likelihood, with a confidence level that names which controls it could not check and why. The capture is rich enough to fix the standard: the result is a pre-check, not a DA submission, and the confidence level is part of the result rather than an afterthought.

## Target Users

- Small developers and builders considering a project in Australia who need to know whether to spend on drawings and consultants before they commit.
- Owner-builders testing whether an extension, renovation or knock-down rebuild on their own land is worth pursuing before engaging an architect.
- Buyers considering a property whose development potential depends on the local planning controls, who need a pre-check before signing.
- Town planners and architects using the tool as a first-pass sanity check before they commit hours to a manual reading of the planning scheme.
- Conveyancers and buyers' agents who want a structured summary of the planning controls attached to an address before they advise a client.

## MVP Scope

- Address lookup that resolves an Australian address to its council and the relevant state planning portal, with explicit support for the councils whose data is most reliably parseable.
- Project-type picker covering the common cases: single dwelling, dual occupancy, secondary dwelling, extension, demolition, change of use, signage.
- Pulling the local planning controls for the address: zoning, overlays, heritage, flood, bushfire, height, floor-space ratio, minimum lot size, and any council-specific overlays.
- A pre-check report that names each control, states whether the proposal as described appears to comply, indicates a confidence level and lists the items the tool could not verify from public data.
- PDF text extraction from published planning scheme PDFs so controls that are not exposed through an API can still be searched.
- A Playwright sidecar for the state portals that require a browser session to query; the sidecar is isolated so a portal change does not take down the rest of the service.
- A clear "this is a pre-check, not a DA assessment" banner on every report, with a recommended next step pointing to a registered planner for a binding assessment.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The tool is a pre-check, not a planning assessment; the wording on every report has to make that distinction explicit so the user cannot treat the result as a legal opinion.
- Coverage is honest: the councils and states the tool can check are named on the report, and the user is told which controls could not be verified from public data.
- The tool does not store user-submitted project details beyond the time needed to render the report; the planning controls themselves are public data and are not personal.
- Public planning data is the source of truth; private consultant relationships are not a substitute and the tool must not imply it has insider access.
- Confidence levels must reflect what the tool could and could not check, not a flat percentage the user cannot interpret.
- The MVP runs on a single VPS without Coolify, because the deployment shape is a small internal tool with a clear boundary, not a horizontally scaled consumer product.
- The tool never fabricates a planning control it did not read; items it cannot verify are flagged as such, not guessed at.
