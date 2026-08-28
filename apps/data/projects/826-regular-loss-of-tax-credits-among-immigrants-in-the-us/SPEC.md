---
id: "826"
slug: regular-loss-of-tax-credits-among-immigrants-in-the-us
title: Regular loss of tax credits among immigrants in the US
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/unnnxi3m71-regular-loss-of-tax-credits-among-immigr"
category: other
date: "2025-11-26"
tags: [Immigration, Legal, Finance, Other]
country: USA
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Regular loss of tax credits among immigrants in the US

## Problem

Immigrants in the US regularly lose tax credits they are entitled to because the rules that govern eligibility — residency status, ITIN versus SSN, dependents, treaty positions — do not surface in the tools they already use to file. The post, filed under "Other" with Immigration / Legal / Finance tags, frames this as a recurring loss, not a one-time mistake. Source contains no figure, no specific credit name, and no filing volume.

## Objective

Catch the credits an immigrant in the US is entitled to but at risk of missing because their residency status, ITIN, or family situation is not handled by off-the-shelf tax software.

## Target Users

Immigrants in the US filing their own taxes who are at risk of losing credits because eligibility depends on status (visa, green card, naturalized), ITIN versus SSN, or dependent residency. Secondary: tax preparers and small firms that serve mixed-status households.

## MVP Scope

- A residency / status intake that captures the inputs that affect credit eligibility without storing sensitive identifiers.
- A credit-eligibility check against the rules that apply to that status combination.
- A list of credits the user is at risk of losing and the documents each one requires.
- A hand-off to a preparer or service for the cases the tool cannot resolve itself.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Country of submission is USA; this is a US federal / state tax product and cannot generalise to other jurisdictions from this post.
- Tax eligibility rules change yearly; the MVP must surface a "rules version" or last-updated marker.
- Sensitive identifiers (SSN, ITIN, address) need a clear data-handling story before any storage decision.
- The post names no credit and no preparer service; both must be researched before the MVP, not invented.
