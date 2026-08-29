---
id: "740"
slug: research-existing-solutions-cover-only-30-of-small-busi
title: "Research: existing solutions cover only 30% of small businesses' concerns about potential legal risks. They need a different product."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/validated/hmj0kxg8c1-research-existing-solutions-cover-only-3"
  captured: "2026-05-15"
category: validated
date: "2026-05-15"
tags: [Validated, Legal, Business, Other]
wtp:
  raw: $99 one-time for the research document
  currency: USD
  min: 99
  max: 99
  period: one-shot
tech: [Next.js, Postgres, Playwright site crawler, LLM risk-classification pipeline, Resend, Stripe]
---
# Research: existing solutions cover only 30% of small businesses' concerns about potential legal risks. They need a different product.

## Problem

The starting point was a conversation with the owner of a small online furniture store, who carried a background worry that his website might hold legal risks leading to fines and other problems. Working through it made the gap concrete: the tools on the market — Termly, iubenda, CookieYes and others — are built around privacy policies, cookie consent and basic legal documentation, and cover at most 20-30% of what that owner was actually worried about. Over the following month the ProblemHunt team found and personally spoke with 28 small business owners across different niches and countries, and all of them described the same problem. Their conclusion: no solution on the market fully addresses the real concerns. The market context they cite is roughly 358 million small business owners worldwide, 73% of whom have a website, against a Legal AI market already valued at $3.11 billion and growing. The research is packaged as a document sold for $99, with all 28 respondents willing to use a future solution, and the first three developers who build a working MVP getting a personal presentation to those respondents plus their direct contacts.

## Objective

Build the legal-risk product for a small business website that the compliance-document tools do not cover — the other 70% of what the owner is worried about — and validate it against the 28 named respondents who already agreed to use it, rather than against a general SMB market assumption.

## Target Users

- Primary: owners of small online businesses with their own website — the furniture-store owner who started this is the archetype: no in-house counsel, a live storefront, and a persistent worry about fines they cannot name precisely.
- Secondary: the 28 interviewed owners across different niches and countries, who are both the validation cohort and the first users, and who the research says are ready to use the solution.
- Tertiary: the freelancers and small agencies who build and maintain those websites, and who inherit the owner's legal exposure as an unpaid support obligation.

## MVP Scope

- Scan a live website and produce a ranked list of legal-risk findings, not a document generator. The stated gap is coverage, so the MVP's job is to surface risks the incumbents never look for.
- Per-finding explanation in plain language: what the risk is, what triggers it, and what a fine would attach to — since the owner's worry is unnamed exposure, naming it is the product.
- Remediation guidance per finding, with the distinction between what the owner can fix themselves and what needs a lawyer made explicit.
- Re-scan on a schedule, because a storefront changes and a one-time audit expires.
- Jurisdiction awareness at the level the research supports: the respondents span different countries, so a finding must state which jurisdiction makes it a risk.
- Interview-driven scope validation: before building beyond the scan, take the finding categories back to the 28 respondents.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The exact product the respondents want, their preferred monetization model, and the competitive analysis all sit inside the $99 research document, which is not in hand. Building the full scope without it means guessing at findings the research already contains.
- This is legal-risk detection, not legal advice. Every finding needs framing that keeps it informational, or the product acquires the liability it was built to reduce.
- The 20-30% coverage figure is the team's assessment of Termly, iubenda and CookieYes against one owner's concerns, later corroborated across 28 interviews. It is a research conclusion, not a measured benchmark, and should be treated as the hypothesis to test.
- Respondents span different niches and countries, so any risk rule is jurisdiction-scoped from the start. A finding that is a fine in one country and irrelevant in another is worse than no finding.
- The offer of a personal presentation applies to the first three developers with a working MVP, which puts a real deadline on shipping something demonstrable rather than complete.
- The research's market figures (358 million small business owners, 73% with a website, a $3.11 billion Legal AI market) are quoted from the source and must not be restated as this product's own addressable market.

## Out of Scope

- Generating privacy policies, cookie banners and terms documents. That is the 20-30% the incumbents already cover, and competing there is competing on the part that is solved.
- Acting as counsel or filing anything on the owner's behalf.
