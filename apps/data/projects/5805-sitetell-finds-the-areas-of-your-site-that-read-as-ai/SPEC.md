# SPEC.md — SiteTell: finds the areas of your site that read as AI-generic

## Problem

Hey everyone, I built this product called SiteTell. You put in your website url, it returns a list of all of the things across the site that get flagged as likely to be AI-written&#x2F;AI-generic. It works against a curated rule set (which will obviously get updated as AI models update and evolve) and then you can fix these issues and get a PDF&#x2F;CSV&#x2F;JSON file that you can download to either take the suggested fixes yourself and apply them, or use the CSV&#x2F;JSON file to drop into your agent for it to fix autonomously within minutes. I actually ran it through my first copy of SiteTell and my rule set gave me an overall score of 6&#x2F;100. Woops.<p>Google updated its core rules in February 2026. The important thing to note is that it does not punish AI-written content. It instead punishes thin content, or generic content. The stuff that AI will typically write if you don&#x27;t go and edit it after. SiteTell can fix this by taking these generic, common issues such as stock AI openers (think &#x27;in today&#x27;s fast paced world&#x27;), AI vocabulary (see &#x27;seamlessly integrates&#x27;) or far more subtle things that once you notice, you see everywhere. For example, consecutive paragraphs within 8 or so words of the same length.<p>The other way I think SiteTell helps is through trust. Increasingly if you go to a landing page, or even a whole site, that reads generically and has the typical AI tells (em-dashes etc...) it instantly loses some amount of intangible trust with the customer which could be costing you customers if you run a site with a lot of written copy. SiteTell also aims to fix this.<p>The rule set is really the main product in my opinion. It&#x27;s about 200 rules covering vocabulary, sentence structure, hedging, and some layout patterns, built from public slop-word lists, a corpus diff against pre-2022 marketing copy, and a lot of manual tuning against real sites. False positives are the hard part, particularly with technical writing where precise language reads as formulaic. Because of the false positive situation, if a user chooses to go through with the fixes they can pick and choose what parts actually need fixing. The customer gets granular control and gets to essentially remove the false positives before the fix stage.<p>Detection is pure regex and heuristics, so scanning is free and needs no signup. Rewrites cost money because they hit an API, so those are paid.<p>Stack is Next.js, Supabase, Gemini Flash for the rewrites only.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49610677)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-08T14:16:33Z

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
