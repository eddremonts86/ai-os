---
id: "270"
slug: people-with-a-criminal-past-cannot-reintegrate-into-soc
title: People with a criminal past cannot reintegrate into society because their real skills are \u00abinvisible\u00bb
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/career/krxg2n1ge1-people-with-a-criminal-past-cannot-reint"
category: career
date: "2025-12-11"
tags: [HR, Other]
country: Norway
tech: [Next.js 14, TypeScript, PostgreSQL, OpenAI GPT-4o-mini, Stripe, Resend, Open Badges 3.0]
---
# People with a criminal past cannot reintegrate into society because their real skills are «invisible»

## Tech Stack

Next.js 14 (TypeScript) for the candidate and employer apps. PostgreSQL for credentials, evidence, references. OpenAI GPT-4o-mini for evidence summarisation in the credential metadata. Open Badges 3.0 for credential issuance and verification. Stripe for any paid services (employer-side premium tier in v2). Resend for transactional email.

## Architecture

Three services: a Next.js candidate app for assessment and credential earning, a Next.js employer app for verification, and a verification API that returns only the skill signal — never the criminal-record indicator.

## Milestones

M1: Skill-assessment catalogue with 10 entry-level skills. M2: Evidence upload and reference collection. M3: Open Badges 3.0 issuance. M4: Employer-side verifier app. M5: NGO onboarding flow.

## Risks

Employer adoption is the gating item and requires sustained outreach. Open Badges 3.0 verifier integration with Norwegian ATS is uneven. Privacy guarantees must be defensible — a single breach destroys the product.
