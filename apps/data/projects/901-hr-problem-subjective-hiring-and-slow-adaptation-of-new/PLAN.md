---
id: "901"
slug: hr-problem-subjective-hiring-and-slow-adaptation-of-new
title: "HR problem: subjective hiring and slow adaptation of new employees"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/career/otnixd2971-hr-problem-subjective-hiring-and-slow-ad"
  captured: "2025-10-08"
category: career
date: "2025-10-08"
tags: [Career]
country: Russia
wtp:
  raw: "5,000–10,000 RUB ($55–110) per hired employee"
  currency: USD
  min: 55
  max: 110
  period: hire
  mrrMid: 82.5
tech: [Scenario-based assessment engine, Node.js backend, PostgreSQL, LLM-assisted resume structuring with human review, ATS integrations via webhook, Onboarding task orchestration]
---
# HR problem: subjective hiring and slow adaptation of new employees

## Tech Stack

- **Assessment engine:** scenario-based tasks with an explicit rubric per task. The rubric is the product — it is what makes a novice recruiter's read match a senior one's, which is the actual complaint.
- **Node.js backend:** the domain is scheduling, submissions, reviews and onboarding tasks. Nothing here is compute-heavy; it is a workflow with many participants.
- **PostgreSQL:** candidate assessments and onboarding progress are records that get audited, and in hiring the audit trail is a legal artefact, not a convenience.
- **LLM-assisted resume structuring with mandatory human review:** she says resumes are not analysed in depth. A model can extract and structure claims for a recruiter to check; it cannot be allowed to reject anybody.
- **ATS integration via webhooks:** initial screening already happens in an ATS, so the product attaches to that pipeline rather than replacing it.
- **Onboarding task orchestration:** assigning, sequencing and reviewing practical tasks, since text and video courses are the named failure.

## Architecture

One record follows a person from application to productivity, which is what joins the two halves of her problem. Screening pulls a candidate from the ATS and produces a structured summary of claims from the resume — always for a human to read, never as an automatic decision. Assessment sends a role-representative task and captures the submission against a published rubric, so two recruiters scoring it separately can be compared. After a hire, the same record opens an onboarding track of practical tasks with reviewers and dates, and time-to-productivity is measured against that track rather than assumed.

The design decision that matters is the refusal: gender and age, which she describes as current ATS filter criteria, are not implemented as filters at any point. The product deliberately does not do part of what her current tooling does.

## Milestones

1. **M0 — Rubric and lawfulness review.** Define the assessment rubric for one role, and confirm with counsel what may and may not be used as a selection criterion. End of week 3.
2. **M1 — Structured screening.** Resume structuring with human review, attached to the existing ATS by webhook, no automated rejection. End of week 6.
3. **M2 — Scenario assessment.** One role's task library, submission capture, rubric scoring, and a side-by-side candidate comparison. End of week 9.
4. **M3 — Inter-rater check.** Have a novice and a senior recruiter score the same submissions independently and measure agreement. This is the milestone that validates the whole premise. End of week 11.
5. **M4 — Practical onboarding.** Task-based onboarding track with reviewers, dates and a productivity checkpoint. End of week 14.
6. **M5 — Per-hire billing and pilot.** Bill 5,000–10,000 RUB per hire across one department's openings and measure time to productivity. End of week 18.

## Risks

- **The existing process filters by gender and age.** She reports this as current practice. Automating it would be discriminatory, so the product has to decline that capability and say why — which may read to the buyer as missing functionality rather than as a correction.
- **Objectivity is being promised where it cannot be delivered.** She notes standard methods do not give full objectivity, then asks for confidence in a candidate. What is buildable is comparable, evidence-backed assessment with a visible rubric. Selling it as objective would be false, and in hiring that falsehood has legal consequences.
- **Task libraries are role-specific and expensive.** A representative task for a warehouse supervisor has nothing in common with one for an accountant. The source names no role, so the size of the content problem is unknown and could exceed the whole build.
- **Per-hire pricing carries cost on every candidate.** Assessment costs money for everyone screened but earns only on a hire. Without hiring-volume data — which the source does not give — the unit economics cannot be checked.
- **Candidate drop-off.** Adding an assessment task lengthens the process. In a competitive market for the role, the better candidates are the ones who decline to do unpaid tasks, which would make selection worse rather than better.
- **Attributing time-to-productivity.** Adaptation takes 1 to 6 months by her account, and it depends on the manager, the team and the role as much as on onboarding design. Any measured improvement will be hard to attribute to the product alone.
