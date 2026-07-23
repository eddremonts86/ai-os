# Pitfalls and Anti-Patterns

A field guide to how the orchestrator-minion pattern goes wrong, with the diagnostic and the
fix for each. Read this before declaring a run "good" — most of these will not be obvious
from a successful-looking artifact.

The list is ordered by likelihood × impact. The top three are the ones you will hit on
nearly every run that ships broken work.

## 1. The "spray and pray" run

**Symptom**: 12 workers, each a vague "look at this part of the codebase", no acceptance
criteria beyond "produce a report". The orchestrator hopes one of them finds the bug. The
user gets 12 reports, none of which answer the question.

**Why it happens**: the orchestrator couldn't write a tight scope, so it fanned out hoping
to dilute the ambiguity. The ambiguity is now spread across 12 workers.

**Diagnostic**:
- Any worker with `acceptance: []` or only a `file-exists` check → spray and pray.
- More than 6 workers on a task that has < 100 lines of ground truth → spray and pray.

**Fix**: collapse. If you cannot write a scope tight enough to give a worker acceptance
criteria, you cannot give the worker the task at all. Decompose differently or fall back
to a single agent.

## 2. Vague verification

**Symptom**: every worker's `acceptance` is just `{ "type": "verifier-subagent" }` with
a prompt like "is this report good?". Workers pass, the synthesized answer is mediocre,
and nobody can say why.

**Why it happens**: the orchestrator punts the hard part (defining "good") to a verifier
that has the same blind spots the orchestrator does. The verifier becomes a vibes-checker.

**Diagnostic**:
- `acceptance` items that are not mechanically checkable AND the verifier prompt is
  shorter than 50 words → vibes.
- Verifier prompt asks "is this good?" without naming the failure modes it should reject.

**Fix**: every acceptance check must be one of:
- Mechanical: a real command (`node`, `jq`, `git diff`, render, lint, type-check).
- A JSON-schema or regex check on a structured field.
- A verifier sub-agent with a **specific rejection list** ("reject if missing any of:
  [list of concrete failure modes]").

If you cannot phrase the acceptance concretely, the scope is wrong. Go back to step 1.

## 3. Orchestrator context bloat

**Symptom**: the orchestrator's conversation grows by 50k+ tokens in a single run, then
starts losing coherence on the synthesis step. The final answer references artifacts
incorrectly or omits findings.

**Why it happens**: a worker returned prose instead of an artifact path. Or the
orchestrator pasted the artifact content into the conversation "just to make sure".
Either way, the orchestrator's context is the bottleneck.

**Diagnostic**:
- Any worker output that does not start with the `{"status": ..., "artifact": ...}`
  contract block → violation.
- Orchestrator transcript shows full file contents from worker artifacts → violation.

**Fix**:
- Reject worker outputs that are not structured. Redispatch with the contract quoted.
- Never paste an artifact into the orchestrator's context. Read the artifact at synthesis
  time via the path. If the orchestrator literally needs the content to synthesize,
  the worker should have written a smaller artifact, not more prose.

## 4. Workers talking to each other

**Symptom**: worker B's prompt contains "based on what worker A found..." or worker B
reads worker A's artifact mid-run. Sometimes subtle: a shared file they both write to,
or a single shared TODO list.

**Why it happens**: the orchestrator or the workers confuse orchestrator-minion with
agent teams. They are different patterns. Agent teams have peer-to-peer communication;
orchestrator-minion has a single coordinator.

**Diagnostic**:
- Any worker scope references another worker's id.
- A worker reads a file path that belongs to another worker's artifact.

**Fix**:
- Rewrite scopes to be independent. If they really do depend on each other, you have
  either a staged plan (run wave 1, then wave 2 with wave 1's output as input — but
  passed *by the orchestrator*, not by the workers) or you actually want agent teams.
- If you find yourself wanting cross-worker comms, switch to agent teams. Do not try to
  bolt it on.

## 5. Unbounded fan-out

**Symptom**: a single task that should have been 3 workers ends up spawning 30. The
orchestrator justifies each one as "but this is a separate file". The bill arrives.

**Why it happens**: the orchestrator mistakes file count for work count. Files are not
work; one file might need one worker, ten files might be one worker with ten entries in
its scope, and one file might be ten workers' worth of work.

**Diagnostic**:
- `workers.length > budget.max_workers` in the plan → violation (the orchestrator
  should have rejected the plan).
- Plan has more than ~8 workers without a clear reason (e.g. a real staged plan with
  4 + 4) → suspicion warranted.

**Fix**:
- Set `budget.max_workers` to a number that forces the orchestrator to merge scopes
  when it would otherwise fan out. 8 is a reasonable default for most plans.
- The orchestrator must explicitly relax the cap (and document why) when a plan
  genuinely needs more. "Each file is separate" is never a reason.

## 6. Plan-shaped, not plan

**Symptom**: the plan looks like a plan in JSON, but every worker's `scope` is a paragraph
of context with no testable claim. The `acceptance` items are filler. The run succeeds
because every "verifier-subagent" says "yes, looks reasonable".

**Why it happens**: the orchestrator was in a hurry or the task is genuinely under-
specified. The plan is a formality to make the skill load, not a real contract.

**Diagnostic**:
- Sum the word counts of all `scope` fields. If the average scope is > 50 words, the
  plan is over-explaining, not specifying. Atomic scopes are short.
- `acceptance` count is < `workers` count. You have un-covered workers.

**Fix**: rewrite each scope as "<verb> <object> <output>". Example: "list every missing
auth check in handler.ts; output JSON". Not "audit the handler for security issues; produce
a report".

## 7. The lost synthesis

**Symptom**: 5 workers all returned great artifacts. The synthesized answer is a
mechanical concat: a bullet list of "w-1 found X, w-2 found Y". The user has to do the
synthesis themselves.

**Why it happens**: the orchestrator skipped the synthesis phase and just relayed
artifacts. Or the synthesis prompt was so loose that the orchestrator model defaulted
to enumeration.

**Diagnostic**:
- The final answer is structured as one section per worker → no synthesis.
- The final answer starts with a meta-summary ("here is what the minions did") instead
  of the answer → wrong lede.

**Fix**: the orchestrator must answer the original question first, then attach
artifacts. The synthesis prompt should literally start with "Answer the user's question
in the first paragraph. Quote or attach evidence below."

## 8. Verification theater

**Symptom**: every worker output passes verification, but the synthesized answer is
wrong. The verifier says "ok" because the verifier's prompt is "is this a JSON file
with the right shape?" — which is true regardless of whether the content is correct.

**Why it happens**: the orchestrator set the bar at "is this structurally what I asked
for?" instead of "is this actually correct?". Structural checks are cheap and feel
good; correctness checks are hard and are the whole point.

**Diagnostic**:
- Acceptance is only `file-exists` + `json-schema` and no `verifier-subagent` with
  rejection criteria → theater.
- The verifier prompt has the word "looks" or "seems" in it → theater.

**Fix**: every important worker must have at least one correctness check, not just a
shape check. A correctness check is one of:
- A real command that runs the artifact (test, render, build, lint).
- A verifier sub-agent with a rejection list that includes the failure modes you
  actually care about (not "is it a good report?" — "is the auth check missing on
  lines 42, 78, and 105?").

## 9. Retry loops

**Symptom**: a worker is redispatched 4, 5, 6 times because verification keeps failing.
Each retry costs another worker. Eventually the orchestrator gives up or the budget
explodes.

**Why it happens**: the redispatch feedback is "try again" or "fix the issues", not
the *specific* verifier feedback. The worker redoes the same wrong thing because it
doesn't know what was wrong.

**Diagnostic**:
- Two consecutive redispatches with the same scope and the same failure → the feedback
  is not being passed. Fix the dispatcher.
- More than `budget.max_retries_per_worker` retries on a single worker → either the
  scope is impossible or the verifier is wrong. Stop and re-plan.

**Fix**:
- Pass the verifier's *exact* feedback in the redispatch prompt, in quotes.
- Hard cap retries at 2 (configurable per plan, but 2 is the sane default).
- If retries are exhausted, the worker is failed. The orchestrator decides: partial
  synthesis, escalate to user, or re-plan the remaining scope.

## 10. Skill-loaded-but-not-used

**Symptom**: the orchestrator-minion skill loaded, the plan was written, but the
orchestrator did most of the work itself and the workers were an afterthought. The plan
is a decoration.

**Why it happens**: the orchestrator had partial context and decided "this is faster
if I just do it". The pattern is not actually engaged; it's invoked for show.

**Diagnostic**:
- Worker artifact paths are empty or contain orchestrator-generated content.
- Workers return in <2 seconds, indicating the work was trivial.
- The orchestrator's transcript shows it doing file edits between spawn and synthesis.

**Fix**: if the pattern doesn't apply, the orchestrator must say so up front and not
spawn at all. Half-running the pattern is worse than not running it — you pay the
coordination cost without the parallelism benefit.

---

## How to use this list

Before declaring a run done, walk the list. For each numbered item, ask "did I avoid
this?" If you cannot answer yes in one sentence, the run has the issue. The most
common pattern in real failures is 2 (vague verification) + 8 (verification theater) +
3 (context bloat) — they cluster because they all come from the same root cause:
avoiding the work of writing concrete acceptance criteria.
