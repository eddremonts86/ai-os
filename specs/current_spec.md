# Current Spec: Community submissions for the plans corpus

## Metadata

- **Date:** 2026-08-14
- **Status:** proposed, not started
- **Blocks:** 7 (plus 2 optional)
- **Surfaces:** `plans-explorer/app`, `tools/plans-pipeline`, `.github/`, one new Coolify app (stage 2)

## Objective

Let anyone submit a problem worth building from the site, and have approved submissions flow
through the existing enrichment pipeline into the published corpus without a second system.

## Context

The corpus has one source today: the ProblemHunt/Reddit scraper. Everything downstream of it
already works and is worth reusing exactly as-is: `ai-os plans format` normalises a capture,
the daily cron claims a slice, an agent authors it, the gate certifies it, and only then does
it reach the web. **A submission is just a capture from a second source.** The whole design
follows from refusing to build a parallel path for it.

Two facts constrain the shape:

1. **The explorer is a static site.** nginx serving a Vite bundle plus generated JSON. There
   is no backend, no database, and nothing a browser can POST to. Accepting input means
   introducing the first write path this product has ever had.
2. **The corpus is public and published.** Anything approved becomes a page with the
   submitter's words on it, so approval is a publishing decision, not a triage decision.

The good news is that the safety property we need already exists: the indexer publishes only
`enriched`/`humanized`/`web-ready`, so an approved-but-unwritten submission cannot leak onto
the site even if every other check fails.

## Where a submission lands: the decision

| Option | Infra | Submitter needs | Verdict |
|---|---|---|---|
| **A. Prefilled GitHub issue form** | none | a GitHub account | Ship first. Hours of work, zero secrets, GitHub's own spam tooling and audit trail. |
| **B. Submission API on Coolify** | one small service + bot token | nothing | The real answer for "directly from the site". Routine for this infra (12 apps already). |
| C. Third-party form (Tally, Formspree) | vendor | nothing | Rejected: data lands outside the repo and still needs a bridge into `projects/`. A vendor for no gain over B. |
| D. Backend with Postgres | service + DB | nothing | Rejected: nothing here needs a database. The repo is the database and git is the audit log. |

**Recommendation: the moderation queue is GitHub Issues in every option.** Labels are the
approval mechanism, GitHub is the moderation UI, and no admin panel gets built or secured.

**Sequencing matters more than the choice.** Build A first, then the intake automation, then
the API. Intake is identical for A and B, so the loop closes end to end with zero new infra,
and B becomes a UX upgrade that removes the GitHub-account requirement rather than a
prerequisite. Shipping B first would mean running a public write endpoint before anything
downstream can consume what it produces.

## Acceptance criteria

1. A visitor can submit a problem from `plans.eduardoinerarte.dk` without leaving the site
   (stage 2) or via one clearly-labelled hop to GitHub (stage 1).
2. A submission never reaches the public site without a human approving it **and** the gate
   passing it. Two independent gates, neither sufficient alone.
3. An approved submission is materialised into `projects/<id>-<slug>/` with `status: draft`
   and `source.kind: web`, and is then indistinguishable to the pipeline from a scraped
   capture.
4. Submitted ids never collide with scraper ids, verified by a test that runs both allocators.
5. The submission form rejects, before it is sent, anything that could not pass
   `problem-substantive` (120 chars) so the queue never fills with material that is dead on
   arrival.
6. Every submission carries explicit consent to publish, recorded with the capture.
7. If the API is down (stage 2), the form degrades to the GitHub path rather than a dead
   button.
8. `ai-os plans check --publishable` still exits 0 and the parser invariants still pass.

## Non-goals (explicit)

- **No user accounts, profiles or logins on the explorer.** The site's pitch is that it is
  free with nothing to sign up for; the submission path must not quietly retract that.
- **No custom admin/moderation UI.** GitHub Issues is the queue. Building and securing an
  admin surface is a larger project than the feature itself.
- **No editing or deleting a submission after it is sent.** Withdrawals go through a human.
- **No public voting, comments or ranking of submissions.** That is a community product, not
  this one.
- **No automatic approval, ever**, including "trusted submitter" shortcuts.
- **No email/notification system** in the first pass. GitHub notifies the maintainer already.
- **No change to how the scraper works.** It keeps its source and its cadence.

## Plan (blocks)

### Block 1: The submission contract (25 min)

Extend `projects/_schema.json` so a submitted capture is describable:

- `source.kind` gains `web` alongside the existing scraped kinds.
- `source.submittedBy` (optional, free text, never an email) and `source.consent` (required
  when `kind: web`, records that the submitter agreed to publication).
- Decide and document: submissions enter as **`draft`**, not a new `submitted` status. The
  lifecycle already means "metadata real, prose not authored", which is exactly true here. A
  fifth status would need handling in the gate, the indexer, the slice selector and the
  formatter for no gain.

**Verify:** `ai-os plans check` still passes on the 346 existing plans; a hand-written fixture
with `source.kind: web` passes the gate once its prose is authored.

### Block 2: ID allocation that cannot collide (20 min)

Today `nextNumber` lives in the scraper's `state.json` and the scraper is its only writer. A
second writer makes that a race.

Move allocation to a shared helper that derives the next id from **the filesystem**
(`max(existing ids in projects/) + 1`), and have both the scraper and intake call it. The
filesystem is the only thing both writers already agree on.

**Verify:** a test that allocates from both callers against a fixture corpus and asserts no
duplicate and no gap-reuse; run the real scraper once and confirm `nextNumber` still advances.

### Block 3: GitHub issue form and labels (25 min)

`.github/ISSUE_TEMPLATE/submit-plan.yml` with typed fields mapping 1:1 to Block 1's contract:
title, problem (min 120 chars, stated in the field description), category (dropdown from the
live 42), country, willingness to pay (free text, the parser handles raw), optional source
URL, optional "what you would build" feeding the SPEC's Objective, and a required consent
checkbox.

Labels: `submission` (auto), `approved`, `ingested`, `declined`.

**Verify:** file a test issue through the template and confirm every field lands parseably.

### Block 4: `/submit` route on the explorer (30 min)

A real form in the SPA, in the existing design language. Stage 1 builds the GitHub issue URL
from the field values and opens it prefilled, so the submitter reviews before sending. Client
validation mirrors the gate's floor. Nav entry plus a CTA from the landing.

**Verify:** the browser checks this repo now runs as standard: contrast on every field and the
submit control, no wrapped CTA, mobile single column, no horizontal scroll, reduced motion
honoured, and the 120-char floor actually blocks submission.

### Block 5: Intake phase in the pipeline (30 min)

`daily.sh intake`, running before `prepare`:

- reads issues labelled `approved` and not `ingested` (via `gh`, already authenticated)
- writes `projects/<id>-<slug>/` with frontmatter from the issue body and the problem text as
  the SPEC's Problem section
- comments the assigned id on the issue and relabels it `ingested`
- reports how many it took

Then `prepare` sees them as ordinary drafts, the claim mechanism gives them to an agent, and
the gate decides whether they ship. No other phase changes.

**Verify:** run `intake` against a test issue on a scratch branch, confirm the directory
matches what the formatter expects, and confirm the slice selector picks it up.

### Block 6: Cron prompt and docs (20 min)

Add intake to `tools/plans-pipeline/cron-prompt.md` (before Phase 1) and to the pipeline
README, including what the agent must do when a submission cannot be authored honestly from
its text: leave it `draft`, say so, and let a human decline the issue.

**Verify:** prompt applied with `hermes cron edit`, stored copy matches the repo file byte for
byte.

### Block 7: End-to-end rehearsal (30 min)

File a real submission through the form, approve it, run the full pipeline by hand, and
confirm it reaches production as a published plan. Then file a deliberately bad one and
confirm it is stopped, and note **which** gate stopped it.

**Verify:** both paths produce the expected outcome and the ship phase is untouched by either.

### Block 8 (optional, stage 2): Submission API (30 min)

A ~150-line Hono service on Coolify with a GitHub bot token, so no GitHub account is needed.
Requires: origin lock, body size cap, per-IP rate limit, honeypot field, and a challenge
(Turnstile). The form falls back to the Block 4 path when the API does not answer.

### Block 9 (optional): Submission state on the site (25 min)

A public "recently submitted" strip so submitters can see their item moving. Only worth doing
if submission volume makes it interesting; otherwise it is an empty section.

## Risks and mitigation

| Risk | Mitigation |
|---|---|
| **Spam floods the queue** | Moderation is mandatory, so the blast radius is a noisy issue list, not a polluted corpus. Stage 1 inherits GitHub's spam handling; stage 2 adds honeypot, rate limit and a challenge. |
| **PII or defamation in a submission** | Approval is a publishing decision and the checklist says so explicitly. The corpus is public and this cannot be automated away. |
| **Someone submits a problem that is not theirs** | Consent field records the claim; the source URL field encourages attribution; decline is one label. |
| **ID collision between scraper and intake** | Block 2 exists solely for this, with a test that runs both allocators. |
| **An approved submission never gets ingested** | `ingested` label plus a count in the cron report; an approved-but-not-ingested backlog is visible rather than silent. |
| **Legal exposure from publishing third-party text** | Terms line next to the consent checkbox stating the licence the corpus publishes under. Flagged as needing the user's decision, not mine. |
| **The write endpoint becomes an attack surface** | Stage 1 has no endpoint at all. Stage 2 holds only a scoped GitHub token whose worst case is creating issues in one repo. |
| **Submissions dilute corpus quality** | They pass the same 11 gate rules as everything else. The gate does not know or care where a capture came from. |

## Verification (end-to-end)

```bash
ai-os plans pipeline intake --dry-run     # new
ai-os plans pipeline status
ai-os plans check --publishable           # must stay exit 0
npm --prefix plans-explorer/app run test:parser
npm --prefix plans-explorer/app run build
```

Plus the browser pass on `/submit` and a real submission surviving the whole loop to
production.

## Open questions for the user

1. **Is requiring a GitHub account acceptable for stage 1?** It is the difference between
   shipping this week with no new infra and building the API first. The site promises "no
   account" for *reading*; this would ask for one to *contribute*.
2. **What licence does submitted content get published under?** Needed before any consent
   text can be written honestly.
3. **Who moderates, and what is the expected latency?** An approval queue nobody reads is
   worse than no submission form, because it looks like it works.

## References

- `projects/_schema.json` — the contract a submission must satisfy
- `tools/plans-pipeline/README.md` — the loop this plugs into
- `ai-config/skills/plan-authoring/SKILL.md` — what the agent does with a draft
- `setup/deploy/README.md` — how a new Coolify app gets created and wired
