# SPEC.md — How to process incoming call audio on Android / iOS?

## Problem

- use case is blocking spam calls<p>- when an incoming call arrives, the caller s audio is taken in real time and processed through an llm based on questions set by the user<p>- for example, a conversation may go like this<p>- caller: hi I am angel from XYZ spam company<p>- you: (autoresponder) who do you want to talk to?<p>- caller: ABC<p>- you: (autoresponder) validates ABC, if success next step else drop call<p>- you: (autoresponder) what is the password to talk to ABC?<p>- caller: I dont know<p>- you: (autoresponder) CALL DROPPED<p>- the user basically can set questions that the caller should answer and if the criteria is successful the call is accepted and the phone actually rings otherwise call is dropped<p>- how do I implement this on Android &#x2F; iOS?

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49712493)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-15T13:48:10Z

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
