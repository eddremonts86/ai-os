# SPEC.md — What Has Happened to Authentication?

## Problem

So in the past we had usernames and passwords. Later we ditched the usernames for emails (it&#x27;s harder to forget your email). Then we added SMS, and later OTP for security.<p>All mail + password + OTP works incredibly well, is secure and plays great with password managers.<p>Then something happened.<p>Because of single sign on, we could no longer have password field on the same page as the email.<p>Because of passkeys, now any login screen on a computer takes ages to go through. All french banks use a fancy keyboard with scrambled buttons, but then force you to have an 8 digit password...<p>And more recently, services ditch all login methods for a daily dose of &quot;we&#x27;ve sent you a magic link that will keep you logged in for a day&quot;.<p>Claude authentication is so user hostile that I am now just waiting for my subscription to run out to ditch it, others have caught up anyway.<p>Does anybody working actively on security have an insight on how we got here? Are there any security benefits? Are there any user studies showing that what we currently use is somehow better?

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49622704)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-09T07:36:21Z

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
