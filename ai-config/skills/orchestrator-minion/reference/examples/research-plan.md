# Example Plan: Multi-Source Research

A worked example of an orchestrator-minion plan for a research task with N independent
hypotheses. Each worker is a hypothesis investigator; the orchestrator synthesizes a
cross-hypothesis report.

## The task

> Investigate 3 competing hypotheses about why our service's p99 latency regressed
> last week. For each hypothesis, find 3+ credible sources. Output a structured
> citation list per hypothesis and a synthesized report that weighs the evidence.

## The plan

```json
{
  "id": "research-2026-07-23-p99-regression",
  "goal": "Investigate 3 hypotheses for the p99 latency regression; per-hypothesis citation lists and a synthesized evidence-weighed report.",
  "created_at": "2026-07-23T13:00:00Z",
  "orchestrator": {
    "model": "opus-4-1",
    "role": "plan+verify+synthesize"
  },
  "budget": {
    "max_workers": 3,
    "max_tokens_per_worker": 250000,
    "max_wallclock_minutes": 60,
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
      "role": "hypothesis-investigator",
      "scope": "Investigate hypothesis A. Return 3+ cited findings and an overall verdict (supports / refutes / inconclusive).",
      "artifact": {
        "format": "json",
        "path": ".mavis/plans/research-2026-07-23-p99-regression/w-1.hypA.json",
        "schema": ".mavis/schemas/cited-finding.schema.json"
      },
      "acceptance": [
        { "type": "file-exists", "path": ".mavis/plans/research-2026-07-23-p99-regression/w-1.hypA.json" },
        { "type": "json-schema", "path": ".mavis/schemas/cited-finding.schema.json" },
        { "type": "min-count", "field": "findings", "value": 3 },
        {
          "type": "verifier-subagent",
          "prompt_ref": "reference/examples/prompts/verifier-research.md",
          "rejects_if": [
            "any finding lacks a URL or DOI",
            "any quote is not actually present in the cited source",
            "the verdict does not follow from the evidence cited"
          ]
        }
      ]
    },
    {
      "id": "w-2",
      "role": "hypothesis-investigator",
      "scope": "Investigate hypothesis B. Return 3+ cited findings and an overall verdict (supports / refutes / inconclusive).",
      "artifact": {
        "format": "json",
        "path": ".mavis/plans/research-2026-07-23-p99-regression/w-2.hypB.json",
        "schema": ".mavis/schemas/cited-finding.schema.json"
      },
      "acceptance": [
        { "type": "file-exists", "path": ".mavis/plans/research-2026-07-23-p99-regression/w-2.hypB.json" },
        { "type": "json-schema", "path": ".mavis/schemas/cited-finding.schema.json" },
        { "type": "min-count", "field": "findings", "value": 3 },
        {
          "type": "verifier-subagent",
          "prompt_ref": "reference/examples/prompts/verifier-research.md",
          "rejects_if": [
            "any finding lacks a URL or DOI",
            "any quote is not actually present in the cited source",
            "the verdict does not follow from the evidence cited"
          ]
        }
      ]
    },
    {
      "id": "w-3",
      "role": "hypothesis-investigator",
      "scope": "Investigate hypothesis C. Return 3+ cited findings and an overall verdict (supports / refutes / inconclusive).",
      "artifact": {
        "format": "json",
        "path": ".mavis/plans/research-2026-07-23-p99-regression/w-3.hypC.json",
        "schema": ".mavis/schemas/cited-finding.schema.json"
      },
      "acceptance": [
        { "type": "file-exists", "path": ".mavis/plans/research-2026-07-23-p99-regression/w-3.hypC.json" },
        { "type": "json-schema", "path": ".mavis/schemas/cited-finding.schema.json" },
        { "type": "min-count", "field": "findings", "value": 3 },
        {
          "type": "verifier-subagent",
          "prompt_ref": "reference/examples/prompts/verifier-research.md",
          "rejects_if": [
            "any finding lacks a URL or DOI",
            "any quote is not actually present in the cited source",
            "the verdict does not follow from the evidence cited"
          ]
        }
      ]
    }
  ],
  "exit_criteria": "All 3 hypothesis JSONs exist, validate against the schema, contain ≥3 findings each, and pass the verifier. Then the orchestrator synthesizes a markdown report weighing the three verdicts and recommending the most-supported hypothesis.",
  "notes": "Workers cannot read each other's JSON. Cross-hypothesis reconciliation is the orchestrator's job at synthesis. The plan is fully parallel because the hypotheses are stated independently in the original task; if a hypothesis depended on the result of another, this would be a staged plan with a different structure."
}
```

## What this plan demonstrates

- **Same shape as the audit plan, different domain**: a worker per hypothesis, atomic
  scope, structured artifact, mechanical + subjective acceptance. The pattern
  generalizes.
- **Stronger model for orchestration, cheaper for verification**: opus-4-1 plans and
  synthesizes (this is the hard part), sonnet-4 investigates (this is the
  throughput-bound part), haiku-4-5 verifies (this is the binary pass/fail part).
  This is the tiered-modeling payoff of the pattern.
- **Domain-specific acceptance criteria**: `min-count` on findings, verifier with
  rejection list tuned to research (URLs, quote presence, verdict coherence). The
  contract is the same; the criteria are domain-shaped.
- **Synthesis is not in the plan**: the plan ends with the workers. The synthesis is
  the orchestrator's job, post-verification, in the same session. Plans describe
  the parallel work; synthesis is the serial glue.

## What to notice about the synthesis step

The orchestrator will read all 3 JSON files and produce a single markdown report
that:

1. Leads with the answer (which hypothesis is best supported, with the reasoning).
2. Quotes the most decisive evidence inline.
3. Notes disagreements between hypotheses (e.g., if B says "refutes" but C says
   "supports" the same underlying mechanism).
4. Lists the limitations of the investigation (gaps in sources, untested assumptions).

The synthesis prompt should make this explicit; otherwise the orchestrator defaults
to a bullet-list enumeration (Pitfall #7 in `pitfalls.md`).
