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

## Problem

Solo founders and one-person businesses accumulate follow-up work that never gets a clean home — invoices to chase, proposals to revise, decks to refresh, contracts to file. By the end of the day the work that "just needs a quick pass" piles up and is finished at midnight. The BetaList listing pitches Airo as the chief of staff a solo operator would hire if they could afford one: the user types a sentence ("chase the invoice for the May engagement", "draft the proposal for the new client", "build the Q3 deck"), and Airo figures out the steps, pulls current information, works across the operator's existing tools, and returns the finished result for the operator to approve. The product's stated contract is hard: "Nothing goes out without your approval, not drafts or suggestions, just the completed work." For a solo operator whose bottleneck is not generation but follow-through and approval-ready execution, that contract is the value — the operator still signs off on every artefact, but the work that used to take an evening now takes an afternoon.

## Objective

Ship an AI chief of staff that takes a single-sentence instruction from a solo operator, breaks it into a plan, executes the steps against the operator's connected tools (inbox, calendar, docs, accounting, CRM), and returns a finished artefact for explicit human approval before anything leaves the operator's account. The MVP is reachable from a desktop chat surface today, with a "by text" mobile surface listed as "coming soon" in the source.

## Target Users

- **Primary:** solo founders and one-person businesses whose bottleneck is not ideation but execution follow-through — invoices, proposals, decks, contracts that pile up because no one is reminding them to act.
- **Secondary:** very small agencies (2–5 people) where a chief of staff would be the first hire, but the budget for that role is not yet justified; the AI chief of staff fills the role until headcount catches up.
- **Tertiary:** independent consultants (coaches, fractional CXOs, freelance designers) who want a single queue of "things to handle today" rather than scattered to-dos across email, docs, and accounting tools.

## MVP Scope

- A chat-style web app where the operator types an instruction in plain English.
- A planning layer that converts the instruction into a multi-step plan, listing which connected tools it will touch and what it will do at each step.
- A connector layer with OAuth integrations against the tools the BetaList listing implies the product will touch: Google Workspace (Gmail, Calendar, Drive, Docs), a payments / invoicing tool (Stripe or QuickBooks), and a docs surface (Notion). Each connector exposes the verbs the planner needs (read inbox, draft doc, draft invoice, etc.).
- An execution layer that runs the plan step-by-step against the connectors, persists intermediate artefacts, and assembles the final deliverable.
- An explicit human-approval gate: nothing leaves the operator's account (no email is sent, no invoice is created in Stripe, no doc is shared) until the operator clicks "approve" on the assembled artefact.
- An activity log of every action taken and every approval granted or denied, for audit and trust.
- Desktop web surface for the chat UI; mobile (text/IM) listed as "coming soon" in the source and out of scope for v1.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- "Nothing goes out without your approval": the product must enforce, at the integration layer, that no connector verb that has an external side effect (send email, create invoice, share doc) runs without an explicit human click on the assembled deliverable.
- Each connected tool requires its own OAuth scope; the operator must see and consent to every scope before the connector is enabled.
- Solo-operator scope in v1: one user per workspace, no multi-seat billing, no team admin roles.
- The mobile / text surface is "coming soon" per the source; the MVP ships desktop web only and explicitly says so in the UI.
- Action auditability: every connector call must be logged with timestamp, tool, verb, target resource, and approval status, so the operator can answer "what did Airo do this week?"
