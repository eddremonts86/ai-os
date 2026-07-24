# Example Plan: Code Audit

A worked example of an orchestrator-minion plan for auditing a set of source files for
missing auth checks. Read this alongside `plan-schema.md` to see the schema in use.

## The task

> Audit the 4 files in `src/foo/` for missing auth checks on any handler that accepts
> a user input. Report P0 (no check, public endpoint), P1 (no check, authed endpoint),
> P2 (weak check). Output a JSON finding list per file, then a synthesized P0/P1/P2
> report.

## The plan

```json
{
  "id": "audit-2026-07-23-foo-auth",
  "goal": "Audit the 4 files in src/foo/ for missing auth checks; produce per-file JSON finding lists and a synthesized P0/P1/P2 report.",
  "created_at": "2026-07-23T12:00:00Z",
  "orchestrator": {
    "model": "sonnet-4",
    "role": "plan+verify+synthesize"
  },
  "budget": {
    "max_workers": 4,
    "max_tokens_per_worker": 150000,
    "max_wallclock_minutes": 20,
    "max_retries_per_worker": 2,
    "model_tiers": {
      "default": "sonnet-4",
      "by_role": {
        "verifier": "haiku-4-5"
      }
    }
  },
  "fan_out": "independent",
  "verification": "both",
  "workers": [
    {
      "id": "w-1",
      "role": "auth-auditor",
      "scope": "Audit src/foo/handler.ts for missing auth checks; output one JSON finding per handler.",
      "artifact": {
        "format": "json",
        "path": ".mavis/plans/audit-2026-07-23-foo-auth/w-1.findings.json",
        "schema": ".mavis/schemas/auth-finding.schema.json"
      },
      "acceptance": [
        { "type": "file-exists", "path": ".mavis/plans/audit-2026-07-23-foo-auth/w-1.findings.json" },
        { "type": "json-schema", "path": ".mavis/schemas/auth-finding.schema.json" },
        {
          "type": "verifier-subagent",
          "prompt_ref": "reference/examples/prompts/verifier-auth.md",
          "rejects_if": [
            "any handler accepting user input is missing from the findings",
            "any finding lacks a line number",
            "any P0 finding lacks a recommended fix"
          ]
        }
      ],
      "isolation": "fresh-context"
    },
    {
      "id": "w-2",
      "role": "auth-auditor",
      "scope": "Audit src/foo/admin.ts for missing auth checks; output one JSON finding per handler.",
      "artifact": {
        "format": "json",
        "path": ".mavis/plans/audit-2026-07-23-foo-auth/w-2.findings.json",
        "schema": ".mavis/schemas/auth-finding.schema.json"
      },
      "acceptance": [
        { "type": "file-exists", "path": ".mavis/plans/audit-2026-07-23-foo-auth/w-2.findings.json" },
        { "type": "json-schema", "path": ".mavis/schemas/auth-finding.schema.json" },
        {
          "type": "verifier-subagent",
          "prompt_ref": "reference/examples/prompts/verifier-auth.md",
          "rejects_if": [
            "any handler accepting user input is missing from the findings",
            "any finding lacks a line number",
            "any P0 finding lacks a recommended fix"
          ]
        }
      ],
      "isolation": "fresh-context"
    },
    {
      "id": "w-3",
      "role": "auth-auditor",
      "scope": "Audit src/foo/webhook.ts for missing auth checks; output one JSON finding per handler.",
      "artifact": {
        "format": "json",
        "path": ".mavis/plans/audit-2026-07-23-foo-auth/w-3.findings.json",
        "schema": ".mavis/schemas/auth-finding.schema.json"
      },
      "acceptance": [
        { "type": "file-exists", "path": ".mavis/plans/audit-2026-07-23-foo-auth/w-3.findings.json" },
        { "type": "json-schema", "path": ".mavis/schemas/auth-finding.schema.json" },
        {
          "type": "verifier-subagent",
          "prompt_ref": "reference/examples/prompts/verifier-auth.md",
          "rejects_if": [
            "any handler accepting user input is missing from the findings",
            "any finding lacks a line number",
            "any P0 finding lacks a recommended fix"
          ]
        }
      ],
      "isolation": "fresh-context"
    },
    {
      "id": "w-4",
      "role": "auth-auditor",
      "scope": "Audit src/foo/internal.ts for missing auth checks; output one JSON finding per handler.",
      "artifact": {
        "format": "json",
        "path": ".mavis/plans/audit-2026-07-23-foo-auth/w-4.findings.json",
        "schema": ".mavis/schemas/auth-finding.schema.json"
      },
      "acceptance": [
        { "type": "file-exists", "path": ".mavis/plans/audit-2026-07-23-foo-auth/w-4.findings.json" },
        { "type": "json-schema", "path": ".mavis/schemas/auth-finding.schema.json" },
        {
          "type": "verifier-subagent",
          "prompt_ref": "reference/examples/prompts/verifier-auth.md",
          "rejects_if": [
            "any handler accepting user input is missing from the findings",
            "any finding lacks a line number",
            "any P0 finding lacks a recommended fix"
          ]
        }
      ],
      "isolation": "fresh-context"
    }
  ],
  "exit_criteria": "All 4 finding JSONs exist, validate against the schema, and pass the verifier. Then orchestrator synthesizes a markdown report with P0/P1/P2 sections and a summary line of total findings per file.",
  "notes": "Each worker is read-only on src/foo/. Output goes under .mavis/plans/<plan-id>/ so the workers cannot collide. The plan is fully parallel because each worker is scoped to its own file."
}
```

## What this plan demonstrates

- **Atomic scopes**: each worker audits exactly one file and writes exactly one JSON
  file. No "audit and fix", no "and also check the related test file".
- **Real acceptance criteria**: every worker has 3 checks (file exists, JSON schema,
  verifier with explicit rejection list). The verifier's rejection list is the part
  that makes verification non-theatrical.
- **Budget is tight and explicit**: 4 workers (≤ max), 150k tokens each, 20 min total,
  2 retries. The orchestrator commits to these and will not silently inflate.
- **Verdict is in the plan, not improvised at synthesis**: `exit_criteria` names the
  exact condition for the run to be considered done. No "looks good".
- **Notes capture reasoning**: the `notes` field records *why* this is a parallel plan
  (file independence). Future-you can re-read the plan and see the orchestrator's
  intent, not just its output.

## What this plan does NOT do

- It does not fix anything. Fixing is a separate run, with a separate plan, possibly
  with a different model tier (e.g. Opus for the fixes) and a different verification
  strategy (e.g. tests must pass after the fix).
- It does not look at code outside `src/foo/`. If the user wanted a wider audit, the
  orchestrator would write a new plan with new workers.
- It does not produce a single big report file. The orchestrator synthesizes the
  report at the end of the run from the 4 JSON files. The synthesis step is
  distinct from the workers.
