# SPEC.md — Locksmith: Store Maven Secrets in the macOS Keychain (Or a Unix Socket)

## Problem

Hello HN,<p>In the age of LLMs sucking in random secrets, sandbox escapes, and RCE orbital bombardment, I thought it&#x27;d be a good idea to create a Maven Extension that defers to the MacOS keychain for resolving secrets. In general, it&#x27;s a good idea to not have any secrets (passwords, tokens, etc) stored in plaintext files. Also, this allows your machines to be FIPS-140 complaint, if thats a thing for your job.<p>Locksmith is a Maven Core Extension that defers to the MacOS Keychain. The entry format in settings.xml looks like:<p>`{[type=locksmith]nexus.superbiz.example.com&#x2F;username}`<p>This was a fun project and I used the Project Panama FFM with jextract for the first time. The FFM is a great iteration on JNI (which still has it&#x27;s place) and was pretty much brainless to use.<p>Setup is quick and easy and I tried to make the readme as friendly as possible.<p>As an aside, I&#x27;ve also architected the core Library indecently from the Maven bits, so if you do need to read from the MacOS keychain in a project, you could pull the core Library in without dragging in Maven.<p>Being 2026, of course Claude was used to assist in the creation of the project, however Locksmith is not vibecoded top-to-bottom. I personally loathe AI slop. I use LLMs as a tool, not a crutch.<p>Enjoy!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49628707)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-09T16:01:47Z

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
