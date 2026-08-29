---
id: "765"
slug: global-problem-dating-apps-fail-for-complex-lives-illne
title: "Global problem: Dating apps fail for complex lives (illness, relocation, unfulfilled youth). A platform is needed for matching based on life path compatibility."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/social/8bua20bf01-global-problem-dating-apps-fail-for-comp"
category: social
date: "2026-02-11"
tags: [Social, Psychology, Other]
country: Russia
tech: [Elixir, Phoenix LiveView, PostgreSQL, Neon, Tigris (S3-compatible), Vector embeddings, Fly.io]
---
# Global problem: Dating apps fail for complex lives (illness, relocation, unfulfilled youth). A platform is needed for matching based on life path compatibility.

## Problem

Globally, dating apps fail people whose lives are complex: chronic illness, repeated relocation, or what the post calls an 'unfulfilled youth' (people whose early adult years did not follow the conventional path). What is needed, the post argues, is a matching platform based on life-path compatibility rather than the usual photos-plus-bio model. The ProblemHunt capture is the title itself plus the tag set Social and Psychology and the country Russia as its only context — a thin source where the title is the entire problem statement.

The implied gap is that conventional dating apps optimise for present-tense signals that flatter the conventional life path: photos, current job, current city, a short headline. People whose present tense carries a chronic-illness disclosure, a recent relocation, or an unconventional history do not surface well in that model, and the apps themselves do not ask the question that would. A life-path model would treat someone's history and trajectory — what they have been through and what they are heading toward — as first-class match criteria, alongside or instead of the present-tense surface.

Beyond that one paragraph the source names no competitor, no demographic data, no market-size figure, and no specific illness or relocation pattern. The plan reasons from the title's three named groups (illness, relocation, unfulfilled youth) and the matching idea (life-path compatibility), without inventing a persona, a competitor, or a number.

## Objective

Ship a dating platform whose match scoring is anchored in a user's life path — major events, recurring context, and trajectory — rather than in present-tense photos and a short bio. The platform gives users a structured way to surface what they have been through, what they are managing now, and where they are heading, and uses that record to score compatibility with other users.

## Target Users

- A person managing a chronic illness who wants the platform to factor ongoing health context into matching, not just a current photos-and-bio model.
- A person who has recently relocated and wants the matching model to weigh their new context rather than compare them unfavourably against people whose current city is a hotspot.
- A person whose early adulthood was non-linear (described in the post as an 'unfulfilled youth') and wants the platform to treat that history as relevant context, not as a lack.
- A person whose life priorities are dominated by a long-running trajectory (career, caregiving, recovery, study) and who wants matches where that trajectory is respected.
- A person who would self-describe as 'late to dating' and would like a platform that does not rank them lower for not having a conventional recent relationship history.

## MVP Scope

- A profile shape built around life-path entries: structured fields for major life events, ongoing context (illness, caregiving, study, recent relocation), and a trajectory description.
- A matching engine that scores other users on life-path overlap, not on photos and a headline alone.
- A privacy model where life-path entries can be revealed in stages (locked, brief, full) and never become a default feed of information.
- A photo-uploads surface that exists because attraction still matters, but is ranked below life-path signals rather than above them.
- An onboarding questionnaire that the platform uses to seed the life-path record rather than asking the user to write a long bio.
- A two-way reveal step that gates exchange of contact details, so the platform owns the first interaction.
- A'what changed in your path since you joined' surface that lets users record a recent event and adjust their own match pool accordingly.
- A block, report, and verify surface, because a platform that handles sensitive disclosures needs safer-by-design moderation.
- A small operator console for the moderation team, with redaction tooling for sensitive entries that need to be examined.
- An export of the user's life-path record in plain text, so leaving the platform does not strand the user's data with it.

## Design Direction

See DESIGN.md for this project's design tokens.

## Constraints

- The capture is one sentence plus the country Russia; nothing beyond that is invented here, including specific demographic figures, illness categories, or named competitors.
- The life-path model touches sensitive data (illness, mental-health history, relocation that may correspond to a difficult life period), so privacy is a hard constraint from day one, not a feature.
- The matching engine must not regress to ranking by attractiveness or popularity; whatever score the matching engine produces has to attribute weight to life-path compatibility in a visible way.
- The platform cannot allow user-supplied life-path records to become a feed; if entries are visible across the user base, the privacy model fails.
- A two-way reveal step has to be the only path to direct contact, so the platform's moderation layer can act before either party is identifiable outside it.
- Sensitive-disclosure entries must be redactable on request without removing the user's account, because the platform is built on the user's willingness to share sensitive context.
