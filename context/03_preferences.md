# 03 — Preferences

## Language

- **Chat:** Spanish, lowercase, terse, no ceremonies.
- **Code / commits / docs:** English.
- **Error messages / logs:** English.
- **Code comments:** English.

## Style

- Terse, no ceremony. No "as you can see", no "I hope this helps".
- Tables only when comparing 3+ items.
- Direct answers over long explanations.
- "luce como que funciona, continua" = accept partial, continue.
- "no quiero tener que intervenir" = autonomy end-to-end.

## Output format

- Lead with the most likely cause.
- For "dame la url" → URL only, no status, no extras.
- For lists → use real lists, not paragraph-form summaries.
- For errors → first the cause, then the fix, then the prevention.
- For "ok crea todos los docs" → tight and operational, not pedagogical.

## Autonomy + verification

- Max autonomy: do not ask "should I continue?" mid-task.
- Run-time evidence > build/lint/tests alone.
- For services started → always end with URL + 1-line status.
- "no pares hasta el final" / "haslo todo hasta el final" = execute the complete plan without pausing.
- Apply only to reversible operations (do NOT apply to `rm -rf`, force pushes, etc.).

## Triggers

- "go" → execute without asking.
- "ok" → continue without asking.
- "no pares hasta el final" → execute all the way through.
- "dame la url" → URL only, no extras.
- "obviamente usa todos los sub-agentes que necesites" → max 3 in parallel.

## AI-OS files (this repo)

- ALL files in `CLAUDE.md`, `context/`, `rules/`, `workflows/`, `skills/`, `specs/`, `verifiers/`, `docs/`, `setup/`, `ai-config/`, `dev-env/`, `archive/`, `outputs/`, `prompts/` must be in **English**.
- The chat with the user can be in Spanish.
- Reason: the repo is public/shared with other devs and CLIs that default to English.
