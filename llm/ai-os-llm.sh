#!/usr/bin/env bash
# Entry point for `ai-os llm <subcommand>` — see cli.mjs for the actual logic.
set -euo pipefail
HERE="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
exec node "$HERE/cli.mjs" "$@"
