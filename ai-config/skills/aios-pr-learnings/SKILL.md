---
name: aios-pr-learnings
description: Learn a repo's unwritten review rules from its PR comments, generate a local conventions skill, pre-review a diff against it, and draft written conventions area by area. Use when asked to "learn from PRs", "what do reviewers keep asking", "generate a conventions skill for <repo>", "pre-review my diff", or "write down our conventions". Bitbucket Data Center.
license: MIT
---

# aios-pr-learnings

PR review threads -> `<repo>-conventions` skill -> pre-review of a local diff -> written conventions for the team.
Scripts do the deterministic work (`scripts/`, stdlib only). Claude does the semantic work
(distill, merge, draft) through subagents in batches. Raw data stays in `~/.pr-learnings/<project>-<repo>/`, never in the repo.

## Run

Environment: `BITBUCKET_TOKEN` (HTTP access token, read-only) and `BITBUCKET_BASE` (server URL, or pass `--base`).
`--project` and `--repo` are required on every call. Reviewer names must never reach the generated skill.

```bash
S="python ai-config/skills/aios-pr-learnings/scripts/pr_learnings.py --project <KEY> --repo <slug>"
$S extract            # all MERGED+DECLINED PRs, cached per PR; re-runs only fetch new ones
$S filter             # threads; drops bots / trivia / self-comments; writes metrics.json + dropped_sample.jsonl
$S batches            # filtered.jsonl -> batches/bNNNN.json
# distill (below)  -> distilled/bNNNN.json
$S rules              # validates every batch, prints raw category counts -> write categories.json, rerun
$S mergeprep          # rules.jsonl -> merge_in/<category>-N.json
# merge (below)    -> merge_out/<same name>.json
$S generate --out <repo>/.claude/skills/<repo>-conventions
```

Keep the generated skill out of version control unless the team asks for it (`.git/info/exclude`): it links internal PRs.
Check `dropped_sample.jsonl` by eye after `filter` (a sample of 30 drops): more than 2 real rules lost = loosen the filter.

## Layers (general to specific)

Classify every learned rule once into `gen_class.json` (`{gk: {class, topic}}`, classes `generic-lang | generic-ecosystem | framework | domain`,
one subagent per ~280 rules). `generate` then writes `profile.md` (layer 1): new code follows the conventions whatever its neighbours do,
generic rules where docs and reviewers disagree (undecided, provisional default = the reviewers), the generic rules reviewers enforce, and
the generic rules not to apply mechanically. Layer 2 is process: use the repo's own review phase if it has one and run the pre-review there;
install process skills only if it has none. Layer 3 is the framework: write it down area by area (Drafting, below). Domain and PR-specific
logic stay with human review.
First run (a large C/C++ repo, 2026-11): 55% of learned rules were generic, 42% framework, 4% domain. Generic rules caused all
6 noisy rules and 11 of the 15 doc conflicts: a popular generic skill installed as-is would push against a repo's own standard.

## Docs stage (optional, repo with written standards)

1. Extract: one subagent per group of docs (coding standard, CLAUDE.md, per-module guides) writes `docrules/<name>.json` entries
   `{id, text, source, strength, kind, area, applies_to, bad, good}`. Name the code-convention files with `generate --conv-docs`
   (default `standard`); every other file is per-module domain knowledge. Check fidelity mechanically: identifiers named in a rule must occur in its source file.
2. Cross-map: agents compare each learned rule (by stable `gk` = sha1(category|rule)) with the convention rules and write `docmap.json`
   `{gk: {doc: [ids], conflict: ""}}` (judge by meaning; one entry per gk; validate coverage and ids).
3. `generate` then tags checklist lines `[doc ...]` / `[reviewers only]` / conflict, adds `references/documented-standard.md`, `domain/<area>.md`
   (+ `docrules/paths.json` hints) and the checklist section of documented rules reviewers have not raised.
Retrospective tests: `--exclude-doc-areas`, `--exclude-doc-text <ticket ids>` drop docs written from the held-out PRs.

## Distill (one subagent per batch, max 3 at a time, model sonnet)

Prompt: read `batches/bNNNN.json` (a JSON array of review threads: PR title, file path, diff hunk, messages with role
`reviewer` / `pr_author`, `resolved`, `applied`). Comments may be in any language. For EVERY thread write one entry
(or several if the thread holds several rules); write `distilled/bNNNN.json` as a JSON array and nothing else:

```json
{"thread_id": "...", "is_actionable_rule": true, "rule": "Imperative, English, one sentence, reusable beyond this PR",
 "rationale": "why, 1 sentence", "category": "free-form short noun phrase, reuse the same wording across threads",
 "area": "path prefix like Core/Lib/ or 'repo-wide'", "scope": "file_pattern|module|repo_wide",
 "bad_example": "short code or ''", "good_example": "short code or ''", "confidence": 0.0}
```

`is_actionable_rule=false` (rule `""`) for: questions answered by the thread, one-off bugs specific to this change,
praise/approval, process chatter, domain questions with no reusable rule. A rule must still make sense without the PR.
If the reviewer and author disagree and the author's view prevailed, set the rule from the outcome, not the first comment.
Never include people's names. Verify: the output has an entry for every `thread_id` in the batch (`rules` reports gaps).

## Merge (one subagent per merge chunk)

Prompt: read `merge_in/<name>.json` (candidate rules of one category). Group rules that state the same thing; write
`merge_out/<name>.json` as `{"category": "<canonical category>", "groups": [{"rule", "rationale", "area", "scope",
"bad_example", "good_example", "members": [thread_id, ...], "conflict_note": "only if two groups contradict"}]}`.
Every input `thread_id` must appear in at least one group's `members` (a thread with several rules may appear in several).
Give each chunk its canonical category name explicitly in the prompt (agents otherwise invent variants that split the references).
Use the clearest wording among the members. Give 2 chunks per agent, 3 agents at a time; verify coverage yourself afterwards.

## Categories

After `rules`, fold the raw category strings into 8-15 canonical ones in `categories.json` (`{"raw": "canonical"}`),
rerun `rules`, show the user the mapping. Score = one vote per PR (recency decay x maintainer x applied) x reviewer diversity;
a rule enters the skill with >=2 PRs, or 1 PR if a top reviewer said it and the code changed afterwards.

## Pre-review

`git diff <target>...HEAD`, then three passes over the ADDED lines:
A. `checklist.md` line by line (grep the diff per rule, do not rely on memory; report every occurrence, reviewers comment on each);
B. the `references/` file of each area touched, applying rules the checklist did not cover;
C. a reviewer-mindset pass for defects no rule names (stale caches, missing cases, tests that depend on unstable data, doc vs code).
Every finding quotes the offending line and carries a confidence (high/medium/low).
Do NOT excuse a convention because sibling or legacy code breaks it too: reviewers enforce conventions on new code (measured: the
sibling excuse dropped exactly the findings on newer conventions that reviewers asked for). Local style only excuses pure layout.
D. Verify each finding in a fresh subagent (evidence is an added line, the problem is real, not speculative), one reason per finding.
Show the verified high+medium findings (~8 per PR); offer the rest on request. Capping findings per rule or per PR lost recall without
improving precision (34% / 32% recall vs 39%), so the only reporting filter is the confidence one.
Lines tagged `[noisy in tests]` (vague rules such as magic numbers, naming, duplication, blank lines: 0 hits in the test PRs) are reported
only when the case is unambiguous. Recompute that list (`noisy.json`) after each new test round.
Report: rule id, file:line, suggestion, example PR. Do not edit code unless asked. "Single reviewer's view" rules are suggestions, not violations.

## Drafting conventions (layer 3, one area at a time)

Turn one `references/<category>.md` into a draft the team can approve, largest unwritten area first. One subagent per area:
- Group by topic, merge duplicates, one bold imperative sentence per convention, then Why / Bad / Good / Evidence `(N PRs)` / Status / Verified.
- Status: `new` (unwritten), `already in <doc section>` (one line, point to it), or `conflicts with <doc section>` (quote both, add an open question).
- Ground every name in the code: `git grep` / `git ls-files` over ALL tracked files. Never search the working tree or `.claude/worktrees`
  (later, unreleased revisions leak in); restricting the search to a few directories produced false "not found" for names in other modules.
- Count the gap where cheap ("current code: 7,500 old-style calls against 170"): reviewers enforce on new code, the count shows the size of it.
- Point to an earlier draft instead of repeating a rule; rules outside the area go to an "out of scope" list.
- End with open questions: conflicts, rules the code mostly ignores, single-reviewer rules that may be taste, gaps.
- No reviewer names, people's names or PR links in drafts meant for the team.
Then check it yourself: `python scripts/idcheck.py <repo> <draft.md>` lists every backticked name not found in tracked files; each one is
an example name, a removed function (say so in the draft) or an error to fix. Recount two or three of the agent's numbers.
Collect the open questions of all drafts into one document for the team, merged so each is asked once; follow the `two-layer-doc` skill.

## Measured (first repo, 2026-11, held-out PRs via `generate --exclude-prs`)

How to test: hold PRs out with `generate --exclude-prs`, review the diff of the commit the comments were made on, judge findings against
the real threads with a fixed matching rule (same requirement, same file, within 25 lines or same code element).
Getting that diff: `pull-requests/{id}/diff` IGNORES `since`/`until` and always returns the final diff (with the review fixes already in);
use `compare/diff?from=<comment toHash>&to=<comment fromHash>`. Two early rounds that used the final diff were invalid.

Round 3: 12 held-out PRs + 2 open PRs, 79 real threads, judge = an LLM (strict; its "false" includes "not worth a comment").

| policy | recall | findings/PR | matched+valid |
|---|---|---|---|
| reviewer, all findings | 38/79 = 48% | 20.4 | 26% |
| reviewer, high+medium | 33/79 = 42% | 11.5 | 37% |
| + verifier, kept | 36/79 = 46% | 14.8 | 31% |
| + verifier, high+medium (default) | 31/79 = 39% | 8.6 | 44% |

Dropping the one PR whose matches depended on a loose reading gives 45% / 35%. The verifier trims 27% of findings for 2 lost hits;
the confidence filter does more. Still missed: PR-specific logic (a cache never cleared, a test that depends on a helper) and judgement
calls about audience or placement.

Round 4, same 14 PRs and matching rule, reviewer reads the repo's own docs too (no verifier; docs about the held-out PRs' tickets excluded):

| | recall | findings/PR | useful |
|---|---|---|---|
| round 3, all findings | 38/79 = 48% | 20.4 | 26% |
| round 4, all findings | 38/79 = 48% | 34.6 | 29% |
| round 3, high+medium | 33/79 = 42% | 11.5 | 37% |
| round 4, high+medium | 31/79 = 39% | 18.4 | 50% |

Docs did NOT raise recall; they added findings. By source the hit rate was ~9% for learned rules and doc rules alike, 5% for domain
notes and for free reading. Judges differ between rounds (one PR scored 6 hits once and 1 the next), so +-5 points is noise.
What the docs ARE good for: only 19% of the rules reviewers enforced were written down, and 15 contradicted the written standard;
that gap report is the most useful output for the team. Use `--doc-checklist 0` to drop the extra checklist section if it adds noise.

## Limits

Bitbucket Data Center only (REST 1.0). `applied` is a heuristic (anchor vanished, or resolved and commits followed).
Cross-chunk duplicates of one rule can survive the merge. Re-run `extract` to pick up new PRs, then the later stages.
`idcheck.py` runs one `git grep` per name: a few minutes on a large repo.
