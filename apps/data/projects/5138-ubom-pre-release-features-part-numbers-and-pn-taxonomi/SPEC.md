# SPEC.md — UBOM pre-release features part numbers and pn taxonomies

## Problem

Previous posts:<p>- <a href="https:&#x2F;&#x2F;news.ycombinator.com&#x2F;item?id=49293169">https:&#x2F;&#x2F;news.ycombinator.com&#x2F;item?id=49293169</a>
- <a href="https:&#x2F;&#x2F;news.ycombinator.com&#x2F;item?id=49413449">https:&#x2F;&#x2F;news.ycombinator.com&#x2F;item?id=49413449</a><p>I would have posted over this previous weekend, but I ran afoul of a mismatch between how the UI works and how the underlying abstractions lace together. Specifically, I was struggling with the UI for editing taxonomies and how to fit the idea of a &#x27;sequence definition&#x27; into that UI.<p>This has been cleaned up substantially.<p>I&#x27;m considering spinning up a live instance if there is interest.<p>---<p>This release contains (relatively) complete UI for sequence definition and taxonomy authoring, as well as preliminary UI stubbed in for adding new part numbers.<p>The workflow goes something like this:<p>When first spinning up UBOM, an engineer (preferably someone who knows the org&#x27;s quality system) will determine the valid grammar for their part number schema. A grammar here is essentially the same as a programming language; what characters&#x2F;tokens are allowed in a given segment.<p>Then, from the grammar we scaffold the taxonomy. This just means we given meaning to the various segments of the sequence definition. For example, we may have a segment in our sequence definition that is something like [0..99]{padding: 2, char: 0} (two characters, a range from 0 to 99, padded by one character specified as 0). When we add our taxonomy, we can add a category &quot;blue things&quot;, and a rule on that category of &quot;match 0..25&quot;. Any new part number created with a value between 0 and 25 will automatically get put into the &quot;blue stuff&quot; category.<p>Once we have a taxonomy, it gets attached to a new part number schema. The sequence definition + taxonomy IS a part number schema, but it could also be other things, so we make this relationship deliberate.<p>Now you can start adding part numbers. :D Part numbers are guaranteed to be unique across all schemas, and are validated against their underlying taxonomy and sequence definition.<p>One of the useful things about this setup is that you don&#x27;t have to pick a new part number at random (or guess that it might be right). Instead, you can say something like &#x27;create new part number in this taxonomy category&#x27;, and the next available part number will be allocated once your part number draft has been released.<p>---<p>Next up (I think) is some dev-in-prod testing. I&#x27;ve got a fair amount of QA work to do before I&#x27;m comfortable moving onto the next pre-release. I&#x27;ll be using this to create a part catalog for several products, nailing the bugs, and trying to smooth out the rough spots.<p>Thanks for taking a look! I&#x27;d love to hear your thoughts.<p>God bless.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49567993)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-04T17:59:54Z

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
