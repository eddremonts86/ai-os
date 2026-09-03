---
name: intent-to-spec
description: Turn an intent.md into a governed spec.md. Use when promoting an intent from intent/ into specs/current_spec.md, or when asked to generate a spec from an intent proto-spec.
---

# intent-to-spec

Turn `intent/*.md` into a `spec.md` that `specs/current_spec.md` can adopt.

## When to trigger

- User says "promote this intent", "intent to spec", "make a spec from this intent", or attaches an `intent/*.md`.
- Any time `intent/` has a new accepted intent and the next step is a plan.

## Inputs

- Attached `intent/YYYY-MM-DD-<slug>.md` (or `intent/intent-template.md` + description).
- Repo context: `CLAUDE.md`, `context/03_preferences.md`, `ai-config/skills/*` (brand/security/compliance/UX), and `specs/spec_template.md`.
- Project context: the codebase the intent will change.

## Steps

1. Read the attached `intent.md` and `specs/spec_template.md`. Confirm the intent is `Status: accepted` (warn if `draft`).
2. Apply every organizational skill that declares it triggers on requirements/design/spec creation (security, brand, compliance, UX). Note which skills were applied and their versions (commit SHA of `ai-config/skills/<name>/`).
3. Produce `spec.md` following `specs/spec_template.md` structure: Objective (1 sentence), Context (2-3 paragraphs), Acceptance criteria (checkable), Non-goals (explicit), Plan (blocks ≤30 min each with Verify), Risks, Verification (end-to-end), References, Notes. Keep it under what an engineer can review in one pass.
4. Flag concerns explicitly — especially where policies contradict or the intent is underspecified. Under each uncertain block, add a `Flag: <policy owner>` line. Do not silently resolve conflicts.
5. Prompt to use (paste as-is, filling the attachment):

   ```
   Read the attached intent.md and produce a requirements and design spec for integrating it into our existing codebase. Apply the skills available to you so the plan conforms to our brand guidelines, security policies and UX standards. Document the spec fully as spec.md, ready to hand to the engineering team. Describe clearly any areas of concern, especially where you cannot satisfy contradicting policies.
   ```

6. Write output to `specs/current_spec.md` only if the user confirms promotion. Otherwise write to `<intent-slug>-spec-draft.md` next to the intent and present the diff.
7. Log in git: commit `spec.md` alongside its source `intent.md` SHA (`References: intent/<file>#<sha>`). Product owner reviews; flagged concerns are routed before `plan mode` starts.

## Output contract

- File is ready to be copied to `specs/current_spec.md` (or is already there).
- Lists every concern that would previously have been discovered in review weeks later.
- References its source intent by path + SHA and the skill versions applied.
- Uses `intent/`-relative links for traceability (`intent/2026-...`).

## Governance

- Skill versions and prompt are part of the audit trail (committed). Changing a policy means changing the skill and getting policy-owner sign-off.
- This skill is advisory; the product owner's approval of `spec.md` is the gate that starts `plan mode`.
- Metrics: leading — `intent.md` commit → `spec.md` commit elapsed; lagging — `spec.md` commits dated after first `plan.md` (rework), both from `git log`.

## Example references

- Example intent: `intent/2026-09-02-example-ponytail-adoption.md`
- Template: `intent/intent-template.md`
- Prior art: `archive/2026-09-02-frozen-community-submissions.md`
