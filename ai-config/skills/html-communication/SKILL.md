---
name: html-communication
description: Use this skill when the user wants a plan, spec, write-up, findings, summary, report, comparison, or set of UI mocks presented as readable HTML. Do not use it for HTML that ships as part of a product. Also use it if they mention HTML with no additional context.
version: 1.0.0
author: Edd
license: MIT
platforms: [linux, macos]
metadata:
  hermes:
    tags: [html, communication, report, spec, writeup, artifact]
    related_skills: [claude-design, gen-html, frontend-design]
  scope: universal
---

# HTML Communication

Turn work results into a readable, self-contained HTML document for a human.
Adapted from Theo Browne's fleet workflow: the point is not to make the model
better at code, it is to make it better at *communicating* — outputs should be
something you actually want to read.

For visual design guidance (typography, taste, avoiding AI slop), load
`claude-design` alongside this one. This skill owns the trigger and the
delivery contract; that one owns the aesthetics.

## When to use

Any request to produce a document meant to be read outside the terminal,
whether or not the word "HTML" appears: plans, specs, write-ups, findings,
summaries, reports, comparisons, audits, sets of UI mocks. Also when the user
just says "HTML" with no additional context.

Do NOT use for HTML that ships as part of a product — that is normal frontend
work, not communication.

## Delivery contract

1. **One self-contained file.** Inline CSS, no build step, no external assets
   required. Cap at ~512KB.
2. **Write it like a spec, not a landing page.** No hero sections, no marketing
   copy, no decorative chrome. Information-dense, scannable headings.
3. **Save locally**, never claim it is hosted: write to the project's
   `outputs/` directory (or the path the user gives) and report the absolute
   path. In the Hermes desktop app, hand back the path so it can be previewed.
4. **Never open a browser to verify unless the user asks.** Do not claim the
   document renders before you have written the file.
5. **Labeled variants**: when presenting distinct options, label them A, B, C…
   side-by-side in the same file so the user can answer "C plus D plus A".
   Never renumber between iterations; keep one stable file across revisions.

## Structure

- Open with the problem statement in plain language (the user's original ask),
  then the solution summary. Do not lead with an implementation inventory.
- BAD first line: "Removed implicit workspace carryover from every new thread
  entry point."
- GOOD first line: "New threads were ignoring your default work tree — fixed;
  your preference now always applies."
- Sections: context → findings/body → decisions → next steps. Tables for 3+
  comparisons. Timestamps on everything time-sensitive.

## Anti-patterns

- BAD: walls of raw markdown dumped into chat when the user asked for something shareable.
- GOOD: one clean HTML file, path reported, readable on a phone.
- BAD: verifying by opening a browser unprompted and narrating screenshots.
- GOOD: write the file, state the path, stop.
