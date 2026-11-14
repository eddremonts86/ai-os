---
name: two-layer-doc
description: "Use whenever you write a document, artifact, page or .md that other people will read: a proposal, plan, spec, design, report, meeting brief, decision memo, study or write-up. It fixes the shape: a plain-language front part led by diagrams and images, then the open questions, decisions and risks, then a clear divider, then the technical detail for people who want it. Apply it by default to every shared document, in any project."
---

# Two-layer document

Every document someone else will read has two layers. Non-technical readers stop at the divider and still know what is wanted and what they must decide. Technical readers continue past it.

Model to copy: `reference-example.html` in this folder, a page about AI-OS itself: three open decisions, each with a today/proposal diagram, a recommendation, then the technical notes. Reuse its tokens, banner and figure style.

## The order, always

1. **Front layer: for everyone** (about two screens, never more)
   1. **Title and one line**: what this is about and what is wanted from the reader. Name the audience if it is a meeting ("30 min, Thomas and Elaine").
   2. **The picture first**: diagrams, charts, before/after pairs, flows, mockups carry the explanation. One figure, one claim; the caption states the claim in a sentence. Text beside a figure is two or three lines, not paragraphs.
   3. **Open questions, decisions and risks**: right after the pictures, each with who decides, the exact choice, and our recommendation. One to two sentences each. If a point has no decision, it is not a question: leave it out of this layer.
   4. **What happens next**: only if it changes what the reader does (a date, a meeting, an answer owed).
2. **The divider**: a clearly different band (warning tint, own heading) saying it plainly, for example: *"Technical notes: not needed for the meeting. For people who want to know how each change would be built."* Everything below it may assume technical knowledge.
3. **Technical layer: for people who build it**
   Split the problem the way the front layer split the decisions (same numbering). For each part: how it works today (real code paths, data fields, rules), the design, what does not change, tests, effort or what it waits on. Short bullets with names in code font beat prose. Add one diagram where the mechanism is not obvious (where a rule moves, what talks to what).

## Rules

- **Short.** People have no time. If a sentence can go, it goes. A reader who stops after the first page must still leave with the right idea.
- **No code, file names or jargon in the front layer.** Plain verbs, the reader's own words (the vocabulary of their meeting or mail).
- **Diagrams are real mechanism.** Draw the difference between today and the proposal (the hop added, the check that moves), label arrows, inline SVG, themed with `currentColor`/tokens. Use the `artifact-diagramming` skill for the mechanics. If a sentence says it faster, write the sentence.
- **Facts before words.** Read the code, data and docs first. Every claim about how the system works today is verified, or marked as an assumption ("Our assumption, to confirm"). Never present a guess as a fact.
- **Recommend.** Every decision names our recommendation and why in a clause. Do not hand over a bare list of options.
- **Say what is not known**: unverified items, things that wait on another team, effort that depends on someone else.
- **Language of the readers.** Shared documents default to English (the repo/doc rule); chat with the owner stays in their language.
- **Both themes, phone width, no horizontal scroll**: follow the artifact contract.

## Medium

- Published page for sharing and meetings: HTML artifact (private until the owner shares it; always say so). Editable text others will comment on (memos, plans): Docs artifact, same order, with the diagram feature for figures.
- Repo markdown: same order; diagrams as mermaid fences; the divider as a blockquote or a heading `## Technical notes (for people who build it)`.
- A meeting brief also needs a title and a body for the invite. Give them with the document: title names the topics and the length, body lists the points with minutes and what to bring.

## Before delivering, check

- First two screens: a picture leads, the questions and risks follow, a non-technical reader can say what is wanted.
- Every figure has a one-sentence claim as caption.
- Every question has an owner, a choice and a recommendation.
- The divider is unmissable and says who the rest is for.
- No unverified claim; assumptions are labelled.
- The technical layer uses the same numbering as the front layer.
- Tell the owner where it lives, whether it is shared, and what you could not verify (for example, a page not opened in a browser).
