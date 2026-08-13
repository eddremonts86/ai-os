#!/usr/bin/env bash
# ai-os plans — plan document contract: format, check, enrich.
set -uo pipefail

HERE="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AI_OS_ROOT="$(cd -P "$HERE/../.." && pwd)"

usage() {
  cat <<EOF
ai-os plans — the plan document contract (projects/_schema.json)

Usage:
  ai-os plans check  [--json] [--verbose] [--summary] [--id <id>] [--rule <id>]
      Web-readiness gate. Read-only. Reports every failing rule per plan.
      Exit 0 only when every plan is web-ready.

  ai-os plans format [--write] [--diff] [--id <id>] [--limit N] [--keep-filler]
      Migrate documents to the schema shape: metadata to YAML frontmatter, English
      headings, text hygiene, template filler replaced with a TODO marker.
      DRY RUN unless --write is passed. Never invents prose.

  ai-os plans test
      Run the formatter's own test suite.

  ai-os plans enrich [--id <id>]
      Prints the agent brief. Enrichment is written by a CLI/agent using the
      \`plan-authoring\` skill, not by this script — it needs judgement, not regex.

Typical flow:
  ai-os plans check --summary        # where the corpus stands
  ai-os plans format                # preview the migration
  ai-os plans format --write        # apply it
  ai-os plans check --summary       # what enrichment still owes
EOF
}

case "${1:-}" in
  check)  shift; exec node "$HERE/check-plans.mjs" "$@" ;;
  format) shift; exec node "$HERE/format-plans.mjs" "$@" ;;
  test)   shift; exec node "$HERE/test-plan-format.mjs" "$@" ;;
  enrich)
    shift
    cat <<EOF
Enrichment is an agent task. Open any AI-OS CLI in $AI_OS_ROOT and ask for the
\`plan-authoring\` skill:

    "use the plan-authoring skill on plan ${2:-<id>}"

It reads projects/_schema.json, writes the varying sections, runs humanizer, and
adds a diagram only when one carries information. Then:

    ai-os plans check --id ${2:-<id>} --verbose

For the whole corpus, drive it with the ai-os-loop convention so it survives across
sessions — see the skill's "Working through many plans".
EOF
    ;;
  -h|--help|help|"") usage ;;
  *) echo "ai-os plans: unknown subcommand: $1" >&2; echo "" >&2; usage >&2; exit 1 ;;
esac
