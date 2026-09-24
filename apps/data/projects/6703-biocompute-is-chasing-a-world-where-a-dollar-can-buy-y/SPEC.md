# SPEC.md — BioCompute is chasing a world where a dollar can buy you a million TB of storage

## Problem

The pitch for DNA data storage usually leads with density and longevity. BioCompute, a deep-tech company in Berkeley, however, frames this as a cost-per-byte problem, because that is the number the whole field lives or dies on.<p>The reason that number has been stuck is structural. Almost everyone writes data by synthesizing DNA, building new strands base by base. When your write step is manufacturing, your cost curve is the cost curve of synthesis, and it bends slowly. Worse, every strand is single-use, so the medium is a consumable. You pay the manufacturing cost again on the next write.<p>BioCompute&#x27;s bet is that you get a different curve if you stop manufacturing. It writes data by marking reusable templates with an enzyme instead of building strands, and it reads them back with a nanopore. The template is not consumed. Take synthesis off the critical path and the dominant cost moves somewhere you can actually push on.<p>So far the company reports a demonstrated write cost of $1 per megabyte. Its target is $1 per terabyte. The first is what the team has shown. The second is where the reuse approach is built to drive it.<p>The part worth scrutinizing is the read and write coupling. Most groups optimize one side and bolt on whatever sequencing exists for the other. BioCompute is tuning its licensed nanopore read process to fit its own write chemistry, so the two are engineered against each other rather than glued together. If the cost is going to fall by orders of magnitude, that fit is where a lot of it has to come from.<p>The honest open questions, for anyone who has watched this field overpromise:<p>- The demonstrated cost is at small scale, and there is no guarantee the economics survive as volume climbs.<p>- Read accuracy at scale is unproven, which is true across the board.<p>- The write cost still has one dominant driver, and the whole target rides on bringing it down.<p>BioCompute has enough behind it to take seriously. Senior academics at Berkeley and Stanford advise the company, it has filed on its write method, and it has run early paid pilots with two US creative studios. The claim on the table is narrow and testable: reuse plus a co-designed read and write stack can move the cost per byte in a way that synthesis never will. That is the thing to watch.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49680036)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-13T04:31:12Z

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
