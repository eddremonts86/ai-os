# Priorities, rollout order and success metrics

## P0 — trust and ability to complete the job

Fix before any polish:

- Ambiguous primary action
- Incorrect, context-free or stale data
- Errors that lose the user's work
- Confusing permissions
- Slow operations with no feedback
- Unsafe destructive actions
- Serious keyboard, contrast or responsive failures
- Onboarding blockers

## P1 — coherence and friction reduction

- Unify duplicated components
- Reduce colours and variants
- Remove duplicated data
- Improve empty states
- Simplify navigation
- Shorten onboarding
- Make progress visible
- Instrument the funnel

## P2 — identity and polish

- Distinctive motion
- Custom illustration
- Brand detail
- Advanced transitions
- Celebration moments
- Extra aesthetic personalisation

**Never run P2 to cover a P0.**

## 30-day order

The calendar compresses or stretches with team size. The *order* is what matters.

### Week 1 — diagnosis and system

Goal: know what gets fixed and under which rules.

Pick three critical flows · define job, activation and success metric · inventory screens, components
and styles · score the matrix · gather references per flow · define or clean the tokens · write the
explicit forbidden-pattern list · capture current performance and funnel metrics.

Deliverables: prioritised audit · reference boards · base tokens · canonical component list · metric
baseline.

### Week 2 — core flow and hierarchy

Goal: improve the path that produces value.

Redesign the core flow's architecture and hierarchy · consolidate duplicated components · remove
functionless data and decoration · guarantee one primary action per screen · design loading, empty,
error, permission and success · test with real content and extreme cases · instrument start,
completion, error and abandonment.

Deliverables: core flow shipped behind a flag or controlled rollout · product events · verified
acceptance criteria.

### Week 3 — onboarding and speed

Goal: reduce time to first value.

Separate mandatory from optional steps · reduce onboarding to a minimum sequence · add sample data
where it helps · show progress and allow resumption · optimise critical routes and endpoints · add
immediate feedback and failure recovery · measure time to activation.

Deliverables: revised onboarding · performance budget · activation dashboard.

### Week 4 — landing, trust and learning

Goal: align promise, product and evidence.

Rewrite the hero and value proposition · show the real product · connect each CTA to the right
onboarding · add proof and context next to claims · review safety, confirmations and audit trail ·
compare against baseline · collect user feedback · decide what to keep, iterate or revert.

Deliverables: aligned landing · before/after report · updated P0/P1/P2 backlog.

## First ten actions (if you need to start tomorrow)

1. Pick the flow that produces first value.
2. Measure its current conversion, time and errors.
3. Capture all its screens and states.
4. Mark in red: repeated data, competing CTAs, elements with no function.
5. Reduce the view to one primary action plus the information needed to execute it.
6. Replace isolated styles with tokens and canonical components.
7. Design loading, empty, error, permission and success.
8. Instrument start, completion and abandonment.
9. Test the flow with real content and five edge cases.
10. Release under control, compare against baseline, learn.

## Success metrics

Never use "it looks more modern" as the criterion.

**Activation** — signup→activation conversion · time to first value · onboarding completion ·
per-step abandonment.

**Core flow** — start and completion rate · task time · errors per attempt · retries · help usage ·
undone actions.

**Retention and value** — repetition of the value event · retention by activated cohort · frequency of
the core job · value generated · relevant collaboration or sharing.

**Trust and support** — tickets tied to the flow · "what does this mean?" questions · incidents from
destructive actions · data or sync complaints · integration success rate.

**Performance** — critical route load time · interaction latency · p95 of key operations · error rate ·
visual stability.

**Commercial** — landing→signup · signup→activation · activation→payment · upgrade · cancellation and
stated intent.

## Weekly product-quality meeting (30–45 min)

Agenda: one flow and its main metric · one recording or piece of usage evidence · one clarity or trust
problem · one performance problem · one system inconsistency · one decision: fix, measure or drop.

Rules: no preference discussion without a job or evidence attached · never approve a pattern without
complete states · never create components during the meeting · every decision leaves with an owner
and an acceptance criterion · check whether the last improvement actually reduced user time or error.
