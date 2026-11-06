# Fresh Reviewer Prompt

A review of a Spec or plan by an agent that has **no memory of writing it**. The author
reads its own document with everything it knows; a reader who starts cold finds the
unstated assumptions, the claims nobody checked and the decisions left to the implementer.

Adapted from the Design Critic persona in
[`google/elephant-goldfish-model`](https://github.com/google/elephant-goldfish-model)
(Apache-2.0), plus the claim-checking and calibration rules below. Used from
`workflows/project_start.md` step 3b; optional for anything below Spec size.

## How to run it

1. Spawn **one** subagent with the harness's subagent tool (Claude Code: `Agent`; Codex:
   `spawn_agent`). Give it the prompt below and **only** the document path and the repo
   path. Do not paste the conversation, your summary or your opinion of the document.
2. If the harness has no subagent tool, stop and say so: a review in the same context is
   not a fresh review. Do not simulate it.
3. Read the report, then **check each finding yourself** against the source before acting.
   Fix real blockers and majors; decline the rest in one line with the reason. Do not agree
   to end the loop and do not let the review grow the scope.
4. One pass is the default. Run a second only after fixing a blocker that changed what the
   document says, and give it the same prompt, not the list of what you fixed.

## Prompt

```text
You are a reviewer with no earlier context. You are strictly read-only: do not edit,
create or delete any file, do not run commands that change state, and do not start other
agents. Reply to the point, with no preamble.

Document: <ABSOLUTE PATH>
Repository it describes: <ABSOLUTE PATH>

Read the document as a new team member who has just joined the project. Then check:

1. Claims about how the system works today. Verify each against the code, config and docs
   in the repository and cite file:line. Mark a claim you could not check as "unverified";
   never treat a guess as a fact.
2. Assertions about behaviour, performance, cost or constraints that the document makes
   without evidence.
3. Risks the design introduces and does not address: failure modes, security, data loss,
   operational and cost surprises, and what happens when an external party says no or
   does not answer.
4. Anything a person or agent would have to decide for themselves to carry the document
   out. Those decisions belong in the document.
5. Before you report that something is missing, search the repository's docs (docs/,
   archive/, specs/, plans) for a recorded decision on it. A decision already taken
   elsewhere is not a gap.

Severity:
- Blocker: acting on the document as written causes a wrong result, a loss or a security
  problem.
- Major: a real gap the author would want closed before relying on the document.
- Skip everything else. No style, no wording, no "could be more detailed".

Report, at most 600 words. First line: "Blockers: N, Majors: M". Then one entry per
finding: severity, where in the document (section or lines), the evidence (file:line, or
"unverified"), and what to change.
```

## Calibration, from the one trial run (2026-11-06)

Three fresh reviewers read the same real plan: the superpowers spec reviewer, EGM's design
critic and EGM's implementation-readiness persona. Checked against the repository, the
design-critic lens found the two things the others missed (a diagnosis the code
contradicted, and a safeguard that was only a convention), at the cost of a few false
findings. Two causes explain most of the noise, and the prompt above targets both:

- A reviewer with no context flags decisions that were already taken elsewhere (point 5).
- Severities inflate unless "Blocker" means "acting on this goes wrong" (the Severity rule).

Re-run with this prompt on the same plan: it kept the format, avoided the DPIA false
positive (it found the recorded decision first) and found the only blocker the other three
missed. They had "verified" that `docs/intimacy-illustrations.md` exists, the very file a
later plan says was deleted; the reviewer searched the plans, found that item 6 described a
decision already reversed, and said so. It also made one wrong claim (a variable count), so
step 3 of "How to run it" is not optional. It cost about twice the tool calls (15 vs 3-5),
because it checks more.

Implementation readiness ("could I code this without deciding anything?") is the right lens
for a real implementation plan and a poor fit for a status or backlog document; apply it
only to the former.
