---
id: "830"
slug: the-problem-of-manual-processing-of-logistics-documenta
title: The problem of manual processing of logistics documentation and lack of unified databases in a Mexican company
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/logistics/phshnmzd51-the-problem-of-manual-processing-of-logi"
category: logistics
date: "2025-11-20"
tags: [Logistics, Business, Other]
country: Mexico
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# The problem of manual processing of logistics documentation and lack of unified databases in a Mexican company

## Tech Stack

React + TypeScript front end, TanStack Start API, SQLite via Drizzle ORM, deployed on Coolify / Docker. Same stack as the rest of the AI-OS apps so the intake, database, and shipment view ship alongside the other corpus apps on the existing VPS.

## Architecture

The system is one intake and one database. Every logistics document is captured against a shipment, a customer, and a document type, indexed at the point of capture, and surfaced again from a shipment view. A short export covers the cases the customer or carrier needs outside the system.

```
document intake (scan / photo / upload)
        ↓
indexed by shipment + customer + document type
        ↓
shipment view shows every tied document
        ↓
export per document for customer / carrier
```

## Milestones

1. Document intake that accepts scan, photo, and upload against a shipment event.
2. Database keyed by shipment, customer, and document type.
3. Shipment view that lists every document tied to that shipment.
4. Export per document for the cases the customer or carrier needs outside the system.
5. Audit trail of who captured what and when.

## Risks

- Country of submission is Mexico; customs forms and carrier paperwork are local and not covered by the source.
- The post names no document type; an MVP document set invented to look complete would distort the intake.
- "Manual processing" implies operator behaviour that may resist capture at the point of event; rollout needs a workflow story, not just a database.
- The post names no volume; SLA and storage assumptions should be confirmed before launch.
