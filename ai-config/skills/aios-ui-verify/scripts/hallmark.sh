#!/usr/bin/env bash
# Run one of the vendored Hallmark scripts (ai-config/skills/hallmark/scripts/<name>.mjs) with its browser tier ready.
#
#   hallmark.sh <sloplint|theme|capture|imagegen|refcheck> [args...]
#
# The browser tier (sloplint --render, capture) needs puppeteer-core. It lives in ~/.ai-os/hallmark (AI-OS's own
# folder, never the project), pinned, installed once with --ignore-scripts; Chrome comes from CHROME_PATH or the
# usual install paths. Set HALLMARK_NO_INSTALL=1 to skip the install (the render tier then reports "not run").
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
SKILL="$(cd "$HERE/../../hallmark" && pwd -P)"
PUPPETEER_VERSION="25.16.0"   # pinned; bump deliberately (a release at least two weeks old)
PREFIX="${HALLMARK_HOME:-$HOME/.ai-os/hallmark}"

name="${1:-}"
case "$name" in
  sloplint | theme | capture | imagegen | refcheck) shift ;;
  *) echo "usage: hallmark.sh <sloplint|theme|capture|imagegen|refcheck> [args...]" >&2; exit 2 ;;
esac
command -v node >/dev/null 2>&1 || { echo "hallmark.sh: needs Node 18+" >&2; exit 2; }

if [ "${HALLMARK_NO_INSTALL:-0}" != "1" ] && [ ! -f "$PREFIX/node_modules/puppeteer-core/package.json" ]; then
  echo "hallmark.sh: installing puppeteer-core@$PUPPETEER_VERSION into $PREFIX (once, for the browser tier)" >&2
  mkdir -p "$PREFIX"
  npm install --prefix "$PREFIX" "puppeteer-core@$PUPPETEER_VERSION" --ignore-scripts --no-audit --no-fund --silent >&2 \
    || echo "hallmark.sh: puppeteer-core install failed; the browser tier will report 'not run'" >&2
fi

export HALLMARK_PUPPETEER="$PREFIX"
exec node "$SKILL/scripts/$name.mjs" "$@"
