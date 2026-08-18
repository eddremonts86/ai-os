# LOOP_INSTRUCTIONS — Plan corpus enrichment

> 5 sub-agents run in parallel. Each owns a fixed id range. They communicate via the
> file system only — no shared mutable state in chat. Each writes a private log under `apps/data/progress/` (PROGRESS
> file so appends never collide.

## Per-agent setup

```bash
cd /Users/edd/Projects/ai-os

# 1. read the contract and the skill (one time)
cat apps/data/projects/_schema.json | head -200
cat ai-config/skills/plan-authoring/SKILL.md

# 2. confirm which plans are still in 'draft' for your slice
#    (replace START and END with the agent's numeric range)
for d in apps/data/projects/{START..END}-*; do
  [ -d "$d" ] || continue
  status=$(awk '/^status:/ {print $2; exit}' "$d/SPEC.md")
  echo "$d -> $status"
done
```

## Per-plan loop

```bash
# pick the next draft plan in your slice
PLAN="apps/data/projects/<NNN>-<slug>"
ID="<NNN>"

# what does the gate complain about
/Users/edd/Projects/ai-os/ai-os plans check --id "$ID" --verbose

# read the source post (it grounds every claim)
/usr/bin/curl -fsSL "$(grep -oE 'https?://[^"]+' "$PLAN/SPEC.md" | head -1)"

# rewrite SPEC.md / PRODUCT.md / PLAN.md / TASKS.md with the patch tool
# (no invented facts; keep numbers, role, country)

# write the per-plan report
mkdir -p "outputs/enrich/$ID-<slug>"
cat > "outputs/enrich/$ID-<slug>/report.md" <<EOF
# $ID <title>

sections filled: Problem, Objective, Target Users, MVP Scope, Constraints, Value
Proposition, Target Users, Jobs To Be Done, Success Metrics, Competitive
Landscape, Tech Stack, Architecture, Milestones, Risks, Phase 1: Core

sections left as TODO (and why): <none | list>

frontmatter changed: tech=[...], wtp={... absent because source didn't name one}

check after enrichment:
$(/Users/edd/Projects/ai-os/ai-os plans check --id "$ID" --verbose)
EOF

# append one line to your private progress file (do not edit other agents' files)
printf '%s | %s | filled=%d | todos=%d\n' \
  "$(date -u +%FT%TZ)" \
  "$ID-<slug>" \
  "<#sections filled>" \
  "<#sections kept as TODO>" \
  >> apps/data/progress/PROGRESS.<AGENT_ID>.md
```

## Do not

- Touch any plan outside your id range.
- Edit another agent's `apps/data/progress/PROGRESS.<n>.md`.
- Set `status: web-ready` by hand.
- Commit anything — the orchestrator (Edd's CLI) reviews + merges.

## When you finish your slice

Print a 3-line summary:

```
agent-<n> done
plans processed: N
plans still failing sections-written: N
plans still failing problem-substantive: N
```