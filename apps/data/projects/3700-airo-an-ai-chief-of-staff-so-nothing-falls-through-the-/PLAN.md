---
id: "3700"
slug: airo-an-ai-chief-of-staff-so-nothing-falls-through-the-
title: Airo – An AI chief of staff so nothing falls through the cracks
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/useairo?utm_campaign=startup-175029&utm_medium=atom&utm_source=newsfeed"
  captured: "2026-08-28"
category: beta
date: "2026-08-28"
tags: [BetaList, Beta, Product]
tech: [Python (FastAPI backend), TypeScript (Next.js chat UI), Postgres, OAuth integrations (Google Workspace, Stripe, QuickBooks, Notion)]
---
# Airo – An AI chief of staff so nothing falls through the cracks

## Tech Stack

- **Frontend:** Next.js (React + TypeScript) on Vercel. Single-page chat surface with a left rail of past instructions, a centre pane for the live plan + execution trace, and a right rail for the assembled artefact.
- **Backend:** Python + FastAPI service exposing the planner, executor, and connector registry. Auth via email magic link (or Google OAuth).
- **Database:** Postgres for workspace state, instructions, plans, audit log, and connector credentials (encrypted at rest). Drizzle or SQLAlchemy as the ORM.
- **Planner / executor:** an LLM-driven planner that turns the instruction into a step list (which connector + which verb + which resource); an executor that runs each step against the connector registry and persists intermediate artefacts. Each step is logged with the tool, verb, and target resource.
- **Connectors:** OAuth integrations against Google Workspace (Gmail, Calendar, Drive, Docs), Stripe, QuickBooks, and Notion. Each connector exposes a typed verb interface (`send_email`, `create_invoice_draft`, `draft_doc`) so the executor does not have to know each provider's API surface.
- **Approval gate:** a middleware between the executor and any connector verb with an external side effect (`send_*`, `create_*`, `share_*`). The verb only runs after the operator clicks "approve" on the assembled artefact; the click is recorded in the audit log.

## Architecture

A single FastAPI service hosts the planner, executor, and audit log. The Next.js UI talks to it over a JSON API and a server-sent event stream for live progress. Connector credentials live in Postgres, encrypted at rest, and resolved at executor time. The approval gate is enforced at the connector layer, not the UI: a connector verb with an external side effect refuses to run unless its call carries an approval token issued against the current instruction's assembled artefact.

```
Operator (browser)
       │  instruction in plain English
       ▼
Next.js chat UI ──▶ FastAPI planner
                          │
                          ▼  step list (tool, verb, resource)
                       Executor ──▶ Connector registry
                          │            │
                          │            ├─▶ Gmail (read / draft / send*)
                          │            ├─▶ Calendar (read / create*)
                          │            ├─▶ Drive / Docs (draft / share*)
                          │            ├─▶ Stripe / QuickBooks (draft / create*)
                          │            └─▶ Notion (draft / share*)
                          │
                          ▼  artefacts assembled
                  Approval gate (per side-effect verb)
                          │
                          ▼  operator click "approve"
                       Audit log (Postgres)
```

`*` = side-effect verb, blocked until approval.

## Milestones

1. **M0 — Spec freeze.** SPEC.md approved; connector-verb interface locked; side-effect taxonomy documented. End of week 1.
2. **M1 — Chat + planner.** Next.js chat UI; planner returns a step list for a sample instruction; executor runs read-only verbs end-to-end. End of week 3.
3. **M2 — Connector bundle v1.** Google Workspace + Stripe + Notion connectors, each with read + draft verbs (no send / create / share yet). End of week 5.
4. **M3 — Approval gate.** Side-effect verbs implemented behind the approval middleware; audit log records every approval grant and denial. End of week 6.
4. **M4 — Beta.** Onboard 25 solo founders; weekly review of approval rates and connector adoption. End of week 9.
5. **M5 — Pricing + paid plan.** Free tier (limited instructions/month) + paid tier; payment via Stripe. End of week 11.
6. **M6 — Mobile surface (text).** Same approval gate, same audit log, on a phone-based IM surface. End of week 14.

## Risks

- **Approval-gate bypass.** A single side-effect connector that ships without the gate breaks the brand. The risk is highest during fast connector rollouts: every new connector needs an enforcement test that confirms its side-effect verbs refuse to run without an approval token. The audit log must record every side-effect call attempt and the approval status, with alerts on unapproved calls.
- **Planner hallucination.** The planner might propose a step the operator did not intend ("email the wrong client"). The UI must expose the plan to the operator before execution begins, so a wrong step is rejected at planning time. Editing the plan should be a first-class action, not a hidden escape hatch.
- **Connector scope creep.** Each connector is a new OAuth scope, a new failure mode, and a new place the approval gate could leak. A connector-inclusion rubric (which connectors ship in v1, which wait for v2) is required before connector work starts.
- **"By text" mobile surface.** The BetaList listing promises a text-based mobile surface "coming soon". A mobile approval UX is harder to design — accidental approvals from a notification are a real risk. The mobile surface must use the same audit-logged approval gate, even if it costs convenience.
- **Solo-operator data sensitivity.** A chief of staff reads the operator's inbox, calendar, accounting, and docs. A data-breach incident is existential for the product; connector credentials must be encrypted at rest, connector access must be revocable from the UI, and access logs must be available to the operator.
