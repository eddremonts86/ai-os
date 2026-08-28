# Theo patterns — applicable agent-workflow principles

Source: Theo Browne (@t3dotgg), video "I Fixed Claude Without Touching Any Code"
(aka "My AGENTS.md & SKILLS.md Breakdown (Don't copy them)"), 51 min, 2026-08-11.
Cross-referenced with the community reconstruction at `git.sr.ht/~krisyotam/theo-skills`
and the public `pingdotgg/t3code` AGENTS.md.

His own warning applies here too: do not copy-paste his files. The value is the
*process* — notice friction, audit history, codify, let prompts shrink.

## The loop (his method)

1. **Notice friction** — an agent misbehaves in a specific, repeatable way.
2. **Audit history** — ask several models to read real tool-call logs and tally
   failure modes by model/harness. One model catches what another misses.
3. **Codify** — write a trigger-driven skill or one-line global rule, paired with a
   concrete BAD and GOOD example from your own history.
4. **Let the prompt shrink** — if you still have to restate the rule every time,
   the skill is wrong.

## Principles worth keeping

1. **Skill description = trigger keywords, not description.** The description is always
   injected whether or not the skill fires. Write it so the model knows *when to pull it
   in*, not what it does internally.
2. **`requires` metadata with fail-soft.** A skill that needs a token or tool declares it
   (`requires: "X in environment"`); if unset, tell the user instead of guessing.
3. **BAD/GOOD example pairs inline.** Agents are "really good at bad and good examples".
   Seed them from your own failure history.
4. **Labeled variants (A/B/C).** Present options as labeled side-by-side choices so the
   user can answer "C plus D plus A". (Now codified in `claude-design`.)
5. **Glossary of parties.** Define you / we / user / agent up front in project-level
   agent files. Originated in Lakebed's AGENTS.md (public gist), carried into T3 Code's.
6. **Reverse states.** Every state you add (settle/snooze, connect/disconnect) must ship
   with its inverse or be explicitly out of scope.
7. **Hit every surface.** The most common defect is a change that works on the path you
   tested and is missing everywhere else. Walk the surface list before calling work done.
8. **Match ceremony to the task.** No subagent panels for single-pass work; delegation is
   for breadth or adversarial review only. State file ownership when running parallel agents.
9. **Questions are read-only.** If a message asks ("how hard would it be", "should we"),
   answer it; do not edit files.
10. **Stop points.** Tell the model where to stop ("make changes but don't commit yet") —
    life gets much better when overeager models hit an explicit boundary.

## Reference repos

| Repo | What it holds |
|---|---|
| `pingdotgg/t3code` | Open-source T3 Code. `AGENTS.md` (contributor file, 155 lines): glossary, "three ways to hurt yourself", non-negotiables, verifying rules. Benchmark for project-level agent files. |
| `git.sr.ht/~krisyotam/theo-skills` | Community reconstruction of the video: all 6 skills (babysit-pr, file-pr, file-upload, html-communication, postplan-read, provision-box), global AGENTS.md legacy+new, failure-audit ledger by model, method notes. |
| Lakebed AGENTS.md | Public gist `t3dotgg/cbe978269b4c7258c4d20164aece7087`. Origin of the glossary pattern; philosophy sections ("boil the ocean", "fight for the obvious solution"). |
| `automazeio/vibeproxy` | macOS menu-bar proxy exposing subscription CLIs as local APIs. Theo forks it inside his fleet repo for custom routing. |

## What we adopted vs skipped (2026-08-25)

- ✅ Adopted: `babysit-pr` skill (adapted: no merge, no push to main, sandbox-branch aware).
- ✅ Adopted: Labeled variants section in `claude-design`.
- ⏭️ Skipped: file-pr, html-communication, postplan-read, file-upload, provision-box —
  overlap with existing skills or depend on services we don't run (postplan.dev, tslop.org).
