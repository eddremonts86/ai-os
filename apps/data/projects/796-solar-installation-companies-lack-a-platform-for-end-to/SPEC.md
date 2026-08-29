---
id: "796"
slug: solar-installation-companies-lack-a-platform-for-end-to
title: "Solar installation companies lack a platform for end-to-end tracking of a customer's project — from sale to official approval, causing complaints and dissatisfaction"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/business/ldt9cicmy1-solar-installation-companies-lack-a-plat"
category: business
date: "2026-01-10"
tags: [Business, Marketing, Other]
country: Brazil
tech: [Elixir, Phoenix LiveView, PostgreSQL, TimescaleDB extension, Oban (background jobs), S3-compatible object storage, CPF / CNPJ validation library, Pix / Brazilian payment integration, WhatsApp Business API, Coolify]
---
# Solar installation companies lack a platform for end-to-end tracking of a customer's project — from sale to official approval, causing complaints and dissatisfaction

## Problem

Solar installation companies in Brazil lack a single platform that tracks a customer's project from the moment the sale closes to the moment the official approval is granted. The post frames the gap as end-to-end visibility: a customer who has paid for a solar installation has no shared place to see the engineering survey, the equipment order, the install crew schedule, the utility filing, the inspection, and the official approval — and the installation company has no shared place to keep the customer informed across those stages. The implication is that the customer experience is a series of phone calls and WhatsApp messages, and complaints accumulate because the customer cannot see the work.

The capture is a one-line problem statement from ProblemHunt, with country listed as Brazil and no further detail. The post does not name a specific installation company, a specific state utility, a regulator, a price, or a complaint count. What the source names is the actor (a solar installation company), the pain (no platform for end-to-end tracking from sale to official approval), and the missing thing (a tool that produces customer satisfaction by removing the visibility gap). The plan treats those bare facts as the ground truth.

What follows from those bare facts is the shape of the problem: any solution has to model the project as a state machine the customer can see, has to integrate with the Brazilian utility and inspection touchpoints the customer already has to navigate, and has to give the installation company a single place to update each stage rather than scattering updates across calls and chats. The plan scopes the narrowest honest MVP that addresses exactly the end-to-end tracking gap the source names.

## Objective

Build a project-tracking platform for Brazilian solar installation companies where each customer's project is a state machine the customer can see, each stage (sale, survey, design, equipment order, install, utility filing, inspection, official approval) has a status, an owner, and a customer-visible timeline, so the customer experiences a single shared view rather than a series of status calls, and the installation company has a single place to update each stage.

## Target Users

- Brazilian solar installation companies that run a customer's project through five-plus stages and currently track them in spreadsheets, WhatsApp threads, and the install foreman's memory.
- Customers of Brazilian solar installation companies who want to see where their project stands without calling the installer for a status update.
- Brazilian solar installation sales teams that close the sale and want a clean handoff to the operations team without losing project context.
- Brazilian solar installation operations managers who coordinate survey, install crew, utility filing, and inspection across multiple active projects.
- Brazilian solar installation field crews (surveyor, installer, electrician) who need a per-project view of what they are responsible for and when.
- Brazilian utilities and inspection authorities whose filings the installation company manages on behalf of the customer.

## MVP Scope

- A project model with stages: sale closed, engineering survey, design approved, equipment ordered, equipment delivered, install scheduled, install completed, utility filing submitted, inspection scheduled, inspection passed, official approval received, project closed.
- A per-customer tracking page the customer can open to see the current stage, the next stage, the owner of each stage, and a chronological timeline of stage transitions with timestamps.
- A per-installation-company operator console where staff move a project through the stages, attach files (survey report, design, install photos, utility filing), and record the owner of each stage.
- A WhatsApp Business API notification path that pushes a stage transition to the customer on their existing channel, so the customer sees progress without opening a separate app.
- A per-stage SLA timer that surfaces how long a project has been in the current stage, so the installation company can spot projects that are stalling.
- A document-vault surface where every attached file (survey, design, install photos, utility filing, inspection certificate) is stored against the project and accessible to the customer, the installation company, and the inspector.
- A Brazilian-Portuguese copy throughout, since the source country is Brazil and the primary user reads Portuguese.
- A documented stage definition the install company agrees to before going live, so the state machine is stable across projects.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The platform is the customer-facing tracking surface and the operator console; it does not replace the install company's engineering, design, or installation tools. The MVP integrates with those tools by attaching files and recording stage transitions, not by replacing the upstream systems.
- The customer-facing tracking page is read-only. The customer can see status, but the customer does not move stages; the install company does.
- Stage transitions are explicit events, not inferred state. A project that has not been moved by the install company stays in the previous stage until they move it, so the customer never sees a guessed status.
- WhatsApp notifications are sent on stage transitions, not on internal edits, so the customer's notification volume stays predictable.
- Document storage has to follow Brazilian data-protection rules (LGPD). The MVP confirms what is permissible before launch and the documented retention policy reflects that.
- The MVP does not file the utility paperwork itself; it tracks the filing and stores the filing receipt. The actual regulatory submission is the install company's responsibility.
- The platform does not handle the customer's payment for the project; the payment is between the customer and the install company. The platform may surface a payment-status field if the install company chooses to populate it.
