---
id: "621"
slug: need-brutally-honest-feedback-before-i-build-this
title: Need brutally honest feedback before I build this
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vp0g1n/need_brutally_honest_feedback_before_i_build_this/"
category: saas
date: "2026-08-15"
tags: [chrome-extension, design, ai-codegen, dev-tools, validation]
scores:
  money: 5.5
  learn: 6
  fun: 6.5
---
# Need brutally honest feedback before I build this

## Tech Stack

Chrome extension on Manifest V3 — needed to read the active tab's DOM and computed styles. A DOM/CSS extraction layer (scripts running in the page or service worker context) that walks the rendered tree, pulls computed typography (font family, size, weight, line height), colour palette, spacing scale, layout grid, and recurring component primitives. A design-token mapping layer that normalises raw styles into a token system (named scales for colour, type, space, radius). A prompt/spec serialiser that emits the structured "design skill" payload in a format the targeted AI coding tools can ingest directly. The extension itself is JS/HTML/CSS; the serialised output is what Claude Code / Cursor / Lovable / v0 consume — the post does not pick a framework and neither does this plan.

## Architecture

Three pieces, in order: (1) page-context extractor — runs when the user clicks the extension icon, reads DOM + computed styles for the active tab; (2) token mapper — collapses the extracted raw data into a normalised design system (typography scale, colour ramp, spacing scale, component catalog); (3) design-skill emitter — serialises the token system as a single artefact the user can paste into their AI coding tool. The emitter's output format is the IP boundary the poster cares about: it has to be a reusable specification, not a screenshot.

## Milestones

M1: collect answers to the four community questions (use / frequency / pay / open-source) on r/SaaS and one or two adjacent subs — gates the rest of the build.
M2: if validation is positive, build the extraction layer on a single reference site and verify the spec round-trips through Claude Code (or whichever AI tool the poster picks first) into a recognisably similar recreation.
M3: extend extraction across a small set of representative sites (marketing page, SaaS dashboard, design portfolio) and confirm the token mapper produces a consistent, reusable system.
M4: ship a Manifest V3 Chrome extension that delivers M2+M3 to a small design-partner cohort, watch what they actually do with the output.

## Risks

Risk: the community answer to "would you use it" is enthusiastic in the abstract but flat when it comes time to install or pay — the validation post itself is not a sales signal. Risk: the extracted design spec is technically correct but the AI's recreation looks nothing like the source because the LLM can't act on raw tokens without handholding. Risk: the screenshot-to-code competitors already cover enough of the use case that the poster's distinguishing claim ("not a screenshot, a reusable spec") does not move the needle for users. Risk: Manifest V3's restrictions on remote code execution and host permissions push more logic into the extension's own bundle, complicating updates once shipped.
