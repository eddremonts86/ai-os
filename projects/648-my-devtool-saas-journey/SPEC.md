---
id: "648"
slug: my-devtool-saas-journey
title: My DevTool SaaS journey.
status: draft
source:
  name: manual
category: other
---
## Objective

A SaaS that abstracts the pain of setting up communication channels (WhatsApp, email, iMessage) for "open claw" deployments. Distributed as an npm package: `caspian-opencode-plugin`. SEO on the README got the project to GitHub trending #9, which fed a flywheel of first customers; the founder's stated open problem is converting those first customers to paid.

## Target Users

Developers / companies deploying "open claw" agents who want a single integration surface for outbound messaging channels (WhatsApp, email, iMessage). The poster's flow (pain → talk to similar users → abstract as SaaS) implies a horizontal audience of agent builders.

## MVP Scope

- npm package: `caspian-opencode-plugin`.
- Channel adapters for WhatsApp, email, iMessage with a unified outbound API.
- Per-channel deliverability primitives (rate limits, template management, opt-out handling).
- Self-serve onboarding for indie devs; team/org plan for companies.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Stated success on SEO/Readme; the README must stay scannable and link-rich.
- Open-source distribution (npm) is the wedge; monetisation layer (the SaaS) sits on top.
- Channel-provider terms of service (WhatsApp in particular) are non-negotiable.
