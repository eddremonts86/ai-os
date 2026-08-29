---
id: "3644"
slug: jobglance-rank-every-visa-and-remote-job-from-100-sourc
title: JobGlance – Rank every visa and remote job from 100+ sources by your resume fit live
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/jobglance?utm_campaign=startup-181405&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-28"
tags: [BetaList, Beta, Product]
tech: [Next.js, TypeScript, Python (FastAPI), PostgreSQL, Redis, Playwright (scrapers), Chrome Extension (MV3), OpenAI API, BullMQ]
---
# JobGlance – Rank every visa and remote job from 100+ sources by your resume fit live

## Problem

JobGlance is a single tool aimed at international job seekers that takes the whole job search from discovery to application in one place. The capture states the numbers and the capabilities explicitly. The catalogue is 50,000+ roles aggregated from over 100 source sites, refreshed every 24 hours. Every result is scored 0 to 100 against the user's resume, and the list re-ranks live on every search or filter change rather than only on initial load. The matching is therefore not a static filter but a continuous re-ranking as the user narrows.

Beyond ranking, the tool ships features aimed at the parts of an international search that generic boards ignore. There are dedicated filters for visa sponsorship and for work-from-anywhere roles, because those are the two filters that an international candidate uses to decide whether a result is even reachable. An ATS resume builder is included: it scores the resume, rebuilds it in an ATS-friendly format, and tailors it to a specific role. Cover letters, company research and an application tracker round out the apply side. A Chrome extension carries the user's match score onto job pages on other sites, so the score is available wherever the candidate is browsing, not only inside JobGlance.

The numbers are assets and must be quoted as they appear: 50,000+ roles, over 100 source sites, every 24 hours, 0 to 100. The implicit claim is that the score is the unit of value: every other feature exists to make the score trustworthy and to make a high-scoring role easy to act on.

## Objective

Ship a single product that takes an international job seeker from a 50,000+ role, 100+ source catalogue, scored 0 to 100 against their resume, through visa-aware and remote-aware filtering, an ATS-shaped resume, a tailored cover letter and an application tracker, with a Chrome extension that carries the same score onto job pages the candidate visits elsewhere.

## Target Users

- International candidates on work visas who need to know up front whether a role will sponsor them before spending time applying.
- Remote-first candidates who need a single view of work-from-anywhere roles pulled from across boards rather than from one board's remote tag.
- Career switchers whose resume is a poor match for most roles and who need a 0 to 100 score to decide which applications are even worth the effort.
- Candidates applying at volume who need the resume to be ATS-shaped and tailored per role without rewriting it from scratch each time.
- Candidates who browse job boards directly and want their match score carried with them onto the open web pages.

## MVP Scope

- A catalogue of 50,000+ roles aggregated from over 100 source sites, refreshed every 24 hours.
- A 0 to 100 match score against the user's resume, recomputed live on every search or filter change rather than only on initial load.
- Dedicated filters for visa sponsorship and for work-from-anywhere roles, surfaced as first-class controls rather than buried in keyword search.
- An ATS resume builder that scores the resume, rebuilds it in an ATS-friendly format, and tailors it to a selected role.
- A cover letter generator that uses the resume and the role description as inputs and produces a tailored letter.
- A company research view for the role the candidate is considering, so the apply step has context beyond the job description.
- An application tracker that records the role, the score, the tailored resume version and the current stage for each application.
- A Chrome extension (MV3) that reads the job page the candidate is on, calls the match endpoint, and overlays the 0 to 100 score on the page itself.
- Authentication and a per-user resume store, since the score is the user's score and cannot be computed without their resume on file.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The numbers 50,000+ roles, over 100 source sites, every 24 hours and 0 to 100 are stated by the source and must not be rounded, dropped or paraphrased into weaker forms.
- The catalogue is from third-party sites whose terms of scraping are not under JobGlance's control, so any source that blocks scraping must be removed from the count without silently breaking the refresh cadence.
- The score is meaningful only against an uploaded resume, so the tool must not present scores to anonymous users as if they were personalised.
- The Chrome extension must run on third-party job pages, which means it must be MV3-compliant and must respect each site's terms of service.
- Re-ranking on every filter change means the matching must be cheap enough to run on a filter change without a visible delay, which constrains the scoring pipeline.
- Visa sponsorship information is unreliable at posting time and must be presented as a signal the candidate verifies, not as a guarantee.
