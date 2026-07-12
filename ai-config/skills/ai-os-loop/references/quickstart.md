# Loop Quickstart

Five commands from zero to a running loop:

```bash
# 1. Set up the loop directory and copy templates
mkdir -p ~/my-loop/outputs
cp /Users/edd/Projects/ai-os/workflows/loop_template.md /tmp/_ref.md  # reference
# copy the 3 templates' content from there into TASK.md, LOOP_INSTRUCTIONS.md, PROGRESS.md

# 2. Fill TASK.md and LOOP_INSTRUCTIONS.md (PROGRESS.md starts empty)

# 3. Run manually via your CLI of choice
cd ~/my-loop
# paste the run prompt from LOOP_INSTRUCTIONS.md into hermes/claude/codex

# 4. After 3-5 manual runs that work, register with ai-os
ai-os loop add ~/my-loop

# 5. Schedule via Hermes
hermes cronjob create --prompt "$(cat ~/my-loop/PROMPT.md)" --schedule "0 9 * * *" \
  --workdir ~/my-loop --name "my-loop-daily"
```

## Why a loop directory, not a script

Loops are not "run this command at midnight". Loops are "Claude reads X,
does Y, updates Z, decides whether to continue". The 4-file system
keeps each piece auditable:

- `TASK.md` answers "what is this loop supposed to accomplish"
- `LOOP_INSTRUCTIONS.md` answers "how exactly should Claude run it"
- `PROGRESS.md` answers "what has actually happened"
- `outputs/` answers "here is the work this loop has produced"

A script that runs `eval "*" "$args"` is a cron job. A loop has memory
and intent.

## What stays manual

Don't promote level 1 → 6 in one jump. Each level requires evidence:

- level 1 → 2: 3+ runs that produced outputs without external side-effects
- level 2 → 3: 3+ runs where outputs were accepted without edits
- level 3 → 4: 5+ runs in sandbox without rollback needed
- level 4 → 5: human approves every action for 2 weeks
- level 5 → 6: explicit decision, recorded in `PROGRESS.md`

If you skip steps, the failure mode is "loop destroys everything in
the first run".
