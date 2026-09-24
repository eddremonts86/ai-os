# SPEC.md — KeepUp – Verified net worth rankings for everyone

## Problem

Solo founder here. I built this because of a question I couldn&#x27;t answer anywhere: Forbes tells me exactly what the ~3000 richest people are worth, but there&#x27;s no ranking for the rest of us. Not way to compare myself with normal people. Everyone privately wonders if they&#x27;re ahead or behind; the only available answers are self-reported Reddit threads, national statistics and lifestyle comparisons (which reflect income more than wealth).<p>What it does: you connect your accounts via Plaid (or add assets manually), your net worth is computed from verified balances, and you land on a global leaderboard under a pseudonym with your rank and percentile. Ranks are visible as well as net worth amounts, and the leaderboard is only visible to other KeepUp users — nobody outside can see you. Users where &gt;80% of their assets come from connected sources are considered “verified” and get a public blue checkmark. There’s also what I consider a very well-functioning personal dashboard to track all your wealth, but the leaderboard feature is the novel idea here.<p>Security and privacy is my #1 priority. The architecture is built to ensure no personally identifiable information (PII) is ever stored on our servers (date of birth, email, full name, address, etc.). Only your username is stored, which during sign-up is asked to not be identifying. We also make sure no one on the leaderboard can be identified using K-Anonymity on all quasi-attributes (country, asset classes, age bracket). This is important since the combination of a small number of quasi-attributes can quickly identify someone (famous example: combination of ZIP code, birth year and gender can uniquely identify 87% of US population).<p>The obvious question is &quot;why would I connect my bank to a solo founder&#x27;s app&quot;: access is read-only through Plaid&#x27;s OAuth flow, your bank credentials never touch the servers, I can see balances but can&#x27;t move anything, and you can delete everything anytime.<p>Business model, stated plainly: while the leaderboard is free forever, there’s a Pro tier for power users. But, more interestingly, I am working on a financial services marketplace where institutions compete for users who opt in. You stay anonymous, but your wealth is verified, so institutions can bid for your business without knowing who you are. I don&#x27;t sell data: the thesis is that verified wealth data is valuable enough that <i>you</i> should be the one monetizing it.<p>The thing I&#x27;d genuinely like this crowd&#x27;s help with: how would you game the leaderboard? Manual entries are allowed and shown on the leaderboard, but only connected accounts qualify your account to be “verified”. But even so, margin loans, business accounts, etc. can be used to “cheat” your way up the leaderboard (liabilities can also be connected but is not enforced obviously).

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49642756)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-10T12:37:04Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
