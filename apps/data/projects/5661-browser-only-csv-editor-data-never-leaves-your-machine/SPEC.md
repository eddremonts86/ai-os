# SPEC.md — Browser only CSV editor, data never leaves your machine

## Problem

The current software I am working upon as part of my full time job, I have to deal with very long JSONs and lot of CSVs. For editing or viewing JSONs my first and obivous choice was jsonher.io, it’s the most wonderful JSON viewer I have ever seen. But I wish I could the same for CSVs too, when I googled it, I couldn’t find anything good.<p>Most of the tools were asking me to sign up, some of them allowed me to open CSV but then came a big popup asking for my credit card so that I can edit it or use some filters, and lot of them were sending CSV to server in case it was large. I will be honest, there were some which were no signup or no server, but their UX was bad - sublime was showing the content better than those.<p>Then I started building one for myself, and it turns out building no signup,  browser only CSV tool is actually possible even for managing large CSVs;  I was able to make it up and running within days and it turns out to be awesome - apologies for shameless bragging.<p>Later I added support for downloading content in JSON and other alternatives of CSV like PSV, TSV, SSV, etc. It has all the basic functionalities for working with CSVs - filtering, sorting, editing, deleting, downloading in your desired format.<p>In near future, I am planning to make it one shot CSV editor for all kinds of platform - browser extensions, desktop app and hopefully mobile apps too ( I am bad at building mobile apps, but I will try my best ). Do check it out and let me know in comments, what you feel about it.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49605314)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-08T03:13:03Z

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
