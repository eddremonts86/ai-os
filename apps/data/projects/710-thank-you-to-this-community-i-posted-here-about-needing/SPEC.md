---
id: "710"
slug: thank-you-to-this-community-i-posted-here-about-needing
title: Thank you to this community. I posted here about needing one stranger to buy my app before my mom let me buy a domain.
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vpylen/thank_you_to_this_community_i_posted_here_about/"
category: saas
date: "2026-08-16"
---
# Thank you to this community. I posted here about needing one stranger to buy my app before my mom let me buy a domain.

## Problem

A Reddit thank-you post from a 14-year-old founder of Receipts, a tool that records keystrokes and verifies them against 25+ motor, rhythm, and composition checks so a student can prove an essay was written by a human. The poster was accused of using AI on an essay they actually wrote and had no way to prove it. Receipts produces a keystroke record and a typing replay; premium tiers add a PDF exhibit and a personal email to the teacher. Copying from a chatbot fails the verification because the keystroke record shows pasting. Two strangers have bought it since the poster's earlier post and the poster registered receiptsproof.com. The poster is asking what the community thinks of the product and how to market it (YouTube vs. other channels).

## Objective

Document Receipts as it exists today (keystroke recording + 25+ motor/rhythm/composition checks + replay link + premium PDF/email proof) and the open question of sustainable marketing, without inventing pricing, retention metrics, or competitor positioning the poster did not state.

## Target Users

- Primary: students who need to prove an essay or assignment was written by a human (currently the poster's framing).
- Secondary: teachers and professors who receive a Receipts link and need a defensible artifact to clear an AI-use accusation.

## MVP Scope

- Keystroke recording.
- 25+ motor, rhythm, and composition checks.
- A replay link the student can send to the teacher.
- Premium tier: PDF exhibit and a personal email to the teacher (the only monetisation signal in the source).
- A landing domain: receiptsproof.com.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The poster is 14; the source is transparent about age. Any plan must respect that.
- No stated pricing for the premium tier; "premium tiers get more proof" is the only monetisation signal.
- No retention metric, conversion rate, or user count is in the source — only "two people have bought it since".
- The poster has not chosen a marketing channel; the post asks the community for advice on YouTube vs. other.
- Anti-cheating design intent: a paste from a chatbot should be visible in the keystroke record. Do not redesign this away.
