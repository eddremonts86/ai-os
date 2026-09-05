# SPEC.md — Why do many websites use a sign-in code instead of a password?

## Problem

I&#x27;ve noticed several websites that exclusively a single-use login code for authentication. This is a 4-digit or 6-digit login code sent via email <i>instead</i> of a password, it&#x27;s not 2FA or a passkey. (I would rather they don&#x27;t do this as it means I have to open my email instead of using a password manager.) Some of them also send a magic link. Examples of websites that appear to do this exclusively (no password): substack.com, medium.com, geoguessr.com, bandsintown.com. There are also websites that default to this but will also accept passwords (e.g. spotify.com). There are also websites that will accept either a passwords or login code, but if you enter a password then they require a login code anyway (e.g. homedpot.com).<p>Is this becoming more common, and if so why?

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49560168)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-04T03:26:07Z

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
