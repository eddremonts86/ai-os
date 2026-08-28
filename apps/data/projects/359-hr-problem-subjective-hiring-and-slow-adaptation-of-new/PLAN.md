---
id: "359"
slug: hr-problem-subjective-hiring-and-slow-adaptation-of-new
title: "HR problem: subjective hiring and slow adaptation of new employees"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/hr/tp6dgyysf1-hr-problem-subjective-assessment-of-candidates-and-slow"
category: hr
date: "2025-10-10"
tags: [HR]
country: Russia
---
# HR problem: subjective hiring and slow adaptation of new employees

## Tech Stack

Remix (React Router v7) for the HR dashboard and the structured interview forms, with TypeScript end-to-end. PostgreSQL via Drizzle ORM for the role library, the scorecards, the 30/60/90 plans, and the retrospectives. S3-compatible object store for any interview recordings the company wants to keep. OpenSearch for the candidate search across the scorecard history. Keycloak for SSO so the company's existing identity provider (e.g., 1С, Active Directory) is the source of truth for who is on the panel. The stack is chosen for the *form* of the problem: a long-lived internal tool with a small number of users (HR managers, hiring managers, panelists) and a high-trust audit trail.

## Architecture

- **Role library** — a starter set of structured interview kits with a custom-role builder.
- **Scorecard service** — collects notes from each interviewer, averages them, requires a written reason for the hire / no-hire decision, and stores the audit trail.
- **Onboarding service** — a 30/60/90 plan template per role, with explicit deliverables and a "definition of done" for each phase, published on day one.
- **Tracking dashboard** — a per-new-hire view with a week-by-week checklist and a manager sign-off at each phase.
- **Retrospective service** — captures what was actually delivered vs. what was planned and feeds the next hire's plan.
- **Data retention** — a per-company retention policy enforced server-side, with a clear deletion event when the retention period expires.

## Milestones

1. **Phase 0 — Scaffold**: Remix + Drizzle + Keycloak skeleton, role library starter, design tokens.
2. **Phase 1 — Core**: scorecard service, 30/60/90 plan template, tracking dashboard, retrospective service.
3. **Phase 2 — Pilot**: onboard 3 mid-sized Russian companies, run one full hire → onboard cycle per company, capture the before / after ramp time.
4. **Phase 3 — Coverage**: add the next 5 roles to the role library based on the most common custom roles in the pilot.

## Risks

- A structured scorecard does not eliminate bias; the platform must require a written reason and surface it on review, not bury it in a private summary.
- The hiring manager must publish the 30/60/90 plan before the new hire starts; the platform must refuse to let the hire start without a plan, not invent one.
- Data retention must follow the company's written policy and Russian labour law; the platform must support a clear deletion event and an audit trail of what was deleted.
- The platform must not produce a "fit score" or rank candidates; the panel's written judgement must remain the decision.
- The source did not name a company size, an industry, or a pilot city; the first cohort must pick all three honestly.
