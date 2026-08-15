---
id: "614"
slug: i-built-a-simpler-alternative-to-an-ats-for-teams-that-
title: I built a simpler alternative to an ATS for teams that receive CVs by email
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vp0wp4/i_built_a_simpler_alternative_to_an_ats_for_teams/"
  captured: "2026-08-15"
category: saas
date: "2026-08-15"
tags: [saas, recruitment, cv-parsing, b2b, freemium]
scores:
  money: 6
  learn: 5
  fun: 5
tech: [Python, FastAPI, PostgreSQL, OpenAI API (CV extraction), IMAP/Graph email ingestion, Next.js]
---
# I built a simpler alternative to an ATS for teams that receive CVs by email

## Problem

Many small companies and recruitment agencies still handle incoming CVs by hand: opening the email, downloading the PDF, copying the candidate's name, experience, skills, technologies, languages and role context into a spreadsheet, and then doing that again the next time someone applies. It is repetitive, easy to get wrong, and it means the CV sits in the inbox or in a folder until a recruiter has time to read it. The poster built RecrutFlo (recrutflo.com) to remove that loop: the product connects to a recruitment mailbox and turns incoming CVs into structured, searchable candidate records. The author is explicit that this is deliberately not a full ATS — no hiring pipelines, no candidate rankings, no automated hiring decisions. AI organises the information; recruiters stay in control. The free plan has no time limit and no payment details required, so teams can keep using it inside the plan limits indefinitely and only upgrade if it proves useful.

## Objective

Replace the manual "open email → download CV → copy fields into a spreadsheet" loop for teams that receive CVs by email, by connecting to a recruitment mailbox and turning each incoming CV into a structured, searchable candidate record (experience, skills, technologies, languages, role context). The product organises information; the recruiter still decides who to contact.

## Target Users

Small companies and recruitment agencies whose hiring process is centred on a shared recruitment mailbox and who currently move CVs from that inbox into a spreadsheet by hand. The poster specifically names "small companies and recruitment agencies" as the audience.

## MVP Scope

- Connect to a recruitment mailbox (IMAP or Microsoft Graph) using credentials the team owns.
- For each incoming email with a CV attachment (PDF, DOCX), extract candidate fields — experience, skills, technologies, languages, role context — and store them as a structured candidate record.
- Provide a searchable candidate library the team can filter by skill, technology, language or role context.
- Out of scope by design (the poster is explicit): hiring pipelines, candidate ranking, automated hiring decisions, scoring, or any feature that would make RecrutFlo behave like a full ATS.
- Pricing tier that exists at MVP: a free plan with no time limit and no payment details, so a team can stay on it inside the plan limits as long as they want.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The product is deliberately scoped to be "not a full ATS": no pipelines, no rankings, no automated decisions. Any feature creep in that direction would break the positioning.
- Email credentials are sensitive. The team must own the mailbox connection and trust the product with read access to incoming recruitment mail.
- CV parsing quality is uneven across languages, formats and CV styles. The product has to surface what it extracted so a recruiter can correct it, because recruiters stay in control.
- Free plan has no time limit and no payment details, so there is no forced conversion timer — useful as a trust signal, but it also means upgrades must be earned by clear value, not by trial expiry.
- Founder is doing direct outreach ("I'd appreciate honest feedback") — the constraint is distribution and validation, not engineering.