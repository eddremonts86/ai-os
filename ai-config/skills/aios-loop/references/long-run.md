# Long-run mode

The rest of this skill is for recurring loops (daily, on a trigger). This mode is for **one task that iterates on
its own for hours**: build, check, critique, fix, until a bar is met. `/aios-ui-design` "Match references",
`/aios-ui-3d` and `/aios-ui-video` use it. Adapted from cook by Leon Lin (MIT, see NOTICE-cook.md).

## State: a stranger must be able to continue

All state lives in one folder at the project root (e.g. `run/`), so a compacted context, another model or a cloud
agent can resume from the files alone.

| File | Holds |
|---|---|
| `run/BRIEF.md` | target, references, bar per dimension, calibration offset, rules, time, deliverable, permissions, the user's key words verbatim |
| `run/SHOTS.md` | one row per reference: what it shows, fixed camera or viewport, what to take from it, what to watch for |
| `run/ROUNDS.md` | the ledger, copied from `templates/ROUNDS.md` |
| `run/refs/`, `run/stills/rNN/`, `run/compare/rNN/` | references (R01, V01…), renders and side-by-sides per round |

**Resume rule:** if `run/BRIEF.md` exists and the run is not done, read BRIEF, SHOTS and the last two rounds and start
the next round. Do this after every context compaction too. Do not re-ask, restart or rebuild what works.

## Intake, once

One message with every open question, each with a default, so the user can answer by number or say "defaults".
Skip what the prompt and attachments already answer; if the user already said they are leaving, ask nothing and use
the defaults. Then write BRIEF.md and start. **After intake, never ask**: decide, log the decision under Decisions
in ROUNDS.md, and keep going. Approval gates (below) are the exception, and they never stop the work.

## Each round (30 to 90 minutes)

1. **Focus**, in this order: open user feedback, a dimension far below the bar, the largest total gap, then far
   distance and detail (easy to forget). Depth over breadth: make one shot exceptional before widening.
2. **Fix it in depth.** Independent parts can go to parallel subagents; you stay the owner who integrates.
3. **Render** every shot at its fixed camera or viewport and the reference's aspect.
4. **Compare and measure:** `aios-ui-verify/scripts/compare.py` (side by side plus color deltas), frame time,
   seconds per rendered frame.
5. **Score** with `aios-ui-review/references/scored-critics.md`: fresh critics, median, calibration.
6. **Log** the round in ROUNDS.md, numbers labelled measured or eyeballed.
7. **Send the stills** to the user with a three-line note (what changed, scores, next focus), with whatever the
   harness offers for files. Do not wait for a reply.
8. **Stop check.** If it fails, start the next round now.

Commit locally at the end of every round when the project uses git, and keep "Best so far" pointing at the best
round. If a round lowers a score, fix it or go back to the best round before moving on, and log why.

## Gates and stop

- **User feedback beats critics.** Log the exact words, turn each into a checklist item, and close it only with a
  still or clip that proves the fix. "Too grey" is the most common: the color check catches it first.
- **Never start a final render or any other long, costly export before the user approves the stills in chat.**
  While waiting, keep refining and test the export on a few seconds.
- **Stop only when** every dimension of every shot meets the bar by calibrated critic median, the user approved the
  stills, and the deliverable exists and was checked. Done suspiciously early means the bar was read too low:
  reread the references at full size before stopping. At a hard time cap, finish the round, log it and report
  plainly what is still below the bar.

## Pacing and honesty

- Read the clock at every round boundary. A floor ("at least 8h") is for showcase work and only when the user sets
  one; the default is a cap. When usage is readable, spread it across the window instead of burning it early, and
  finish the current step before a limit lands.
- Never claim a check that did not run. Never report an unmeasured number as measured.
- A loop or goal mode that re-prompts automatically must use the stop check above as its done condition.
