#!/usr/bin/env bash
# discover-routes.sh — enumerate route candidates of a web app, framework-agnostic.
#
# Usage: discover-routes.sh [repo-path]
#
# Read-only. Prints one "route<TAB>source-file" line per candidate, grouped by the
# router it came from, then a summary. Output is a FIRST PASS: config-based routers
# are grepped, so dynamically generated routes can be missed. Always verify against
# the router source before treating the list as complete.
#
# Known limitations: Nuxt 2 `_param.vue` dynamic segments are not decoded (Nuxt 3
# bracket syntax is). Grepped route configs can emit non-route strings.

set -uo pipefail

ROOT="${1:-.}"
[ -d "$ROOT" ] || { echo "error: not a directory: $ROOT" >&2; exit 1; }
ROOT="$(cd "$ROOT" && pwd)"

PRUNE=(-name node_modules -o -name .git -o -name dist -o -name build -o -name .next
       -o -name .nuxt -o -name .output -o -name .svelte-kit -o -name coverage
       -o -name vendor -o -name .venv -o -name venv -o -name storybook-static
       -o -name __tests__ -o -name e2e)

TOTAL=0
FOUND_ANY=0

# find files, skipping build/vendor dirs
ff() { # ff <dir> <find-args...>
  local d="$1"; shift
  [ -d "$d" ] || return 0
  find "$d" \( "${PRUNE[@]}" \) -prune -o "$@" -print 2>/dev/null | LC_ALL=C sort
}

rel() { printf '%s' "${1#"$ROOT"/}"; }

emit() { # emit <route> <file>
  printf '%s\t%s\n' "$1" "$(rel "$2")"
  TOTAL=$((TOTAL + 1))
}

section() { FOUND_ANY=1; printf '\n## %s\n' "$1"; }

has_file() { # has_file <dir> <find-name-args...>
  local d="$1"; shift
  [ -d "$d" ] || return 1
  [ -n "$(ff "$d" -type f "$@" | head -1)" ]
}

# Next.js must actually be a dependency before `pages/` or `app/` mean routing —
# plenty of Vite/CRA apps keep unrelated `src/pages/` component folders.
is_next() {
  [ -f "$ROOT/next.config.js" ] || [ -f "$ROOT/next.config.mjs" ] \
    || [ -f "$ROOT/next.config.ts" ] || [ -f "$ROOT/next.config.mts" ] \
    || grep -q '"next"[[:space:]]*:' "$ROOT/package.json" 2>/dev/null
}

# strip the file extension, then any framework suffix (.lazy / .route / .server)
strip_ext() {
  local p="${1%.*}"
  case "$p" in *.lazy|*.route|*.server|*.client) p="${p%.*}" ;; esac
  printf '%s' "$p"
}

# Normalize a file-based route path.
# $1 = path fragment, already stripped of the routes root and of the file suffix
# $2 = dialect: bracket (Next / Nuxt 3 / SvelteKit / Astro) | dollar (TanStack / Remix)
normalize() {
  local p="$1" dialect="$2" out="" seg slash='/'
  # dot-notation flat routes (TanStack, Remix): posts.$id.edit -> posts/$id/edit
  [ "$dialect" = dollar ] && p="${p//./$slash}"
  local IFS='/'
  # shellcheck disable=SC2086
  set -- $p
  for seg in "$@"; do
    case "$seg" in
      "" ) continue ;;
      \(*\) ) continue ;;                     # (group) route group / pathless layout
      @* ) continue ;;                        # @slot parallel route
      .* ) continue ;;                        # dotfiles
      -* ) continue ;;                        # TanStack: '-' prefix = not a route
      _* ) continue ;;                        # Next private folder / TanStack pathless layout
      index | route ) continue ;;
      \[\[...*\]\] ) out="$out/*" ;;          # [[...slug]] optional catch-all
      \[...*\] ) out="$out/*" ;;              # [...slug] catch-all
      \[*\] ) seg="${seg#[}"; out="$out/:${seg%]}" ;;
      \$ ) out="$out/*" ;;                    # TanStack splat
      \$* ) out="$out/:${seg:1}" ;;           # $postId
      * ) out="$out/$seg" ;;
    esac
  done
  printf '%s' "${out:-/}"
}

# ── Next.js — app router ────────────────────────────────────────────────────────
next_app() {
  local dir found f frag
  is_next || return 0
  for dir in "$ROOT/app" "$ROOT/src/app"; do
    [ -d "$dir" ] || continue
    found=0
    while IFS= read -r f; do
      [ -n "$f" ] || continue
      frag="${f#"$dir"}"; frag="${frag%/*}"
      # a `_folder` excludes its whole subtree from Next routing
      case "$frag" in */_*) continue ;; esac
      [ "$found" = 0 ] && { section "Next.js app router ($(rel "$dir"))"; found=1; }
      emit "$(normalize "$frag" bracket)" "$f"
    done < <(ff "$dir" -type f \( -name 'page.tsx' -o -name 'page.jsx' -o -name 'page.ts' \
                                  -o -name 'page.js' -o -name 'page.mdx' \))
  done
}

# ── Next.js — pages router ──────────────────────────────────────────────────────
next_pages() {
  local dir found f frag base
  is_next || return 0
  for dir in "$ROOT/pages" "$ROOT/src/pages"; do
    [ -d "$dir" ] || continue
    found=0
    while IFS= read -r f; do
      [ -n "$f" ] || continue
      base="$(basename "$f")"
      case "$base" in _app.*|_document.*|_error.*|middleware.*) continue ;; esac
      case "$f" in "$dir"/api/*) continue ;; esac
      frag="$(strip_ext "${f#"$dir"}")"
      case "$frag" in */_*) continue ;; esac
      [ "$found" = 0 ] && { section "Next.js pages router ($(rel "$dir"))"; found=1; }
      emit "$(normalize "$frag" bracket)" "$f"
    done < <(ff "$dir" -type f \( -name '*.tsx' -o -name '*.jsx' -o -name '*.ts' -o -name '*.js' -o -name '*.mdx' \))
  done
}

# ── TanStack Router / Remix (file-based, dot notation) ──────────────────────────
tanstack_remix() {
  local dir found f frag label base
  for dir in "$ROOT/src/routes" "$ROOT/app/routes"; do
    [ -d "$dir" ] || continue
    case "$dir" in
      */app/routes ) label="Remix / React Router file routes" ;;
      * ) label="TanStack Router file routes" ;;
    esac
    found=0
    while IFS= read -r f; do
      [ -n "$f" ] || continue
      frag="$(strip_ext "${f#"$dir"}")"
      # `-` prefix marks non-route files/dirs. Test the fragment, never the absolute
      # path — a repo living under a directory whose name starts with `-` would
      # otherwise skip every route.
      case "$frag" in *"/-"*) continue ;; esac
      base="$(strip_ext "$(basename "$f")")"
      case "$base" in
        __root ) continue ;;                    # root wrapper, not a screen
        _index ) : ;;                           # Remix index route — keep
        _*.* ) : ;;                             # flat route under a pathless layout (_auth.login)
        _* ) continue ;;                        # pathless layout file itself, not a screen
      esac
      [ "$found" = 0 ] && { section "$label ($(rel "$dir"))"; found=1; }
      emit "$(normalize "$frag" dollar)" "$f"
    done < <(ff "$dir" -type f \( -name '*.tsx' -o -name '*.jsx' -o -name '*.ts' -o -name '*.js' \))
  done
}

# ── Nuxt 3 / file-organised Vue pages ──────────────────────────────────────────
nuxt() {
  local dir found f frag label
  if ls "$ROOT"/nuxt.config.* >/dev/null 2>&1; then
    label="Nuxt pages"
  else
    # a plain `pages/` folder of .vue files is a convention, not a router —
    # the real paths live in the vue-router config, so flag it as unverified
    label="Vue page components — paths are a GUESS, verify against the router config"
  fi
  for dir in "$ROOT/pages" "$ROOT/app/pages" "$ROOT/src/pages"; do
    has_file "$dir" -name '*.vue' || continue
    found=0
    while IFS= read -r f; do
      [ -n "$f" ] || continue
      [ "$found" = 0 ] && { section "$label ($(rel "$dir"))"; found=1; }
      frag="${f#"$dir"}"; frag="${frag%.vue}"
      emit "$(normalize "$frag" bracket)" "$f"
    done < <(ff "$dir" -type f -name '*.vue')
  done
}

# ── SvelteKit ──────────────────────────────────────────────────────────────────
sveltekit() {
  local dir="$ROOT/src/routes" found=0 f frag
  [ -d "$dir" ] || return 0
  while IFS= read -r f; do
    [ -n "$f" ] || continue
    [ "$found" = 0 ] && { section "SvelteKit routes"; found=1; }
    frag="${f#"$dir"}"; frag="${frag%/+page.svelte}"
    emit "$(normalize "$frag" bracket)" "$f"
  done < <(ff "$dir" -type f -name '+page.svelte')
}

# ── Astro ──────────────────────────────────────────────────────────────────────
astro() {
  local dir="$ROOT/src/pages" found=0 f frag
  has_file "$dir" -name '*.astro' || return 0
  while IFS= read -r f; do
    [ -n "$f" ] || continue
    [ "$found" = 0 ] && { section "Astro pages"; found=1; }
    frag="${f#"$dir"}"; frag="${frag%.*}"
    emit "$(normalize "$frag" bracket)" "$f"
  done < <(ff "$dir" -type f \( -name '*.astro' -o -name '*.md' -o -name '*.mdx' \))
}

# ── Config-based routers: grep declared paths ──────────────────────────────────
route_configs() {
  local found=0 file route
  while IFS= read -r file; do
    [ -n "$file" ] || continue
    while IFS= read -r route; do
      [ -n "$route" ] || continue
      [ "$found" = 0 ] && { section "Route config objects (\`path:\`) — Vue Router / Angular / React Router"; found=1; }
      emit "$route" "$file"
    done < <(grep -Eho "path:[[:space:]]*['\"\`][^'\"\`]*['\"\`]" "$file" 2>/dev/null \
             | grep -Eo "['\"\`][^'\"\`]*" | tr -d "\"'\`" | LC_ALL=C sort -u)
  done < <(ff "$ROOT" -type f \( -name '*routes.ts' -o -name '*routes.tsx' -o -name '*routes.js' \
                                 -o -name '*router.ts' -o -name '*router.tsx' -o -name '*router.js' \
                                 -o -name 'route.ts' -o -name 'route.js' \
                                 -o -name '*routing.module.ts' -o -name '*routes.dart' \
                                 -o -path '*/router/index.ts' -o -path '*/router/index.js' \
                                 -o -path '*/routes/index.ts' -o -path '*/routes/index.js' \))
}

react_router_jsx() {
  local found=0 file route
  while IFS= read -r file; do
    [ -n "$file" ] || continue
    while IFS= read -r route; do
      [ -n "$route" ] || continue
      [ "$found" = 0 ] && { section "React Router <Route path> declarations"; found=1; }
      emit "$route" "$file"
    done < <(grep -Eho '<Route[^>]*path="[^"]*"' "$file" 2>/dev/null \
             | grep -Eo 'path="[^"]*"' | sed -E 's/path="//; s/"$//' | LC_ALL=C sort -u)
  done < <(ff "$ROOT" -type f \( -name '*.tsx' -o -name '*.jsx' \))
}

# ── Server frameworks ──────────────────────────────────────────────────────────
laravel() {
  local found=0 f route
  [ -d "$ROOT/routes" ] || return 0
  while IFS= read -r f; do
    [ -n "$f" ] || continue
    while IFS= read -r route; do
      [ -n "$route" ] || continue
      [ "$found" = 0 ] && { section "Laravel routes (verify with \`php artisan route:list\`)"; found=1; }
      emit "/${route#/}" "$f"
    done < <(grep -Eho "Route::(get|post|put|patch|delete|any|view|resource|redirect)\([[:space:]]*['\"][^'\"]*" "$f" 2>/dev/null \
             | sed -E "s/.*['\"]//" | LC_ALL=C sort -u)
  done < <(ff "$ROOT/routes" -type f -name '*.php')
}

django() {
  local found=0 f route
  while IFS= read -r f; do
    [ -n "$f" ] || continue
    while IFS= read -r route; do
      [ -n "$route" ] || continue
      [ "$found" = 0 ] && { section "Django URLconf (verify with \`manage.py show_urls\`)"; found=1; }
      emit "/${route#/}" "$f"
    done < <(grep -Eho "(re_)?path\([[:space:]]*r?['\"][^'\"]*" "$f" 2>/dev/null \
             | sed -E "s/.*['\"]//; s/^\^//; s/\\\$$//" | LC_ALL=C sort -u)
  done < <(ff "$ROOT" -type f -name 'urls.py')
}

drupal() {
  local found=0 f route
  while IFS= read -r f; do
    [ -n "$f" ] || continue
    while IFS= read -r route; do
      [ -n "$route" ] || continue
      [ "$found" = 0 ] && { section "Drupal routing.yml"; found=1; }
      emit "$route" "$f"
    done < <(grep -Eho "^[[:space:]]*path:[[:space:]]*'?[^'#]*" "$f" 2>/dev/null \
             | sed -E "s/^[[:space:]]*path:[[:space:]]*'?//; s/[[:space:]]+$//" \
             | grep '^/' | LC_ALL=C sort -u)
  done < <(ff "$ROOT" -type f -name '*.routing.yml')
}

rails() {
  local f="$ROOT/config/routes.rb" found=0 route
  [ -f "$f" ] || return 0
  while IFS= read -r route; do
    [ -n "$route" ] || continue
    [ "$found" = 0 ] && { section "Rails routes.rb (verify with \`rails routes\`)"; found=1; }
    emit "$route" "$f"
  done < <(grep -Eho "(get|post|put|patch|delete|root|resources|resource)[[:space:]]+['\"][^'\"]*" "$f" 2>/dev/null \
           | sed -E "s/.*['\"]//" | LC_ALL=C sort -u)
}

sitemaps() {
  local found=0 f
  while IFS= read -r f; do
    [ -n "$f" ] || continue
    [ "$found" = 0 ] && { section "sitemap sources (crawl these too)"; found=1; }
    printf '%s\t%s\n' "(sitemap)" "$(rel "$f")"
  done < <(ff "$ROOT" -type f \( -name 'sitemap*.xml' -o -name 'sitemap*.ts' -o -name 'sitemap*.js' \))
}

printf '# Route candidates — %s\n' "$ROOT"

next_app
next_pages
tanstack_remix
nuxt
sveltekit
astro
route_configs
react_router_jsx
laravel
django
drupal
rails
sitemaps

printf '\n## Summary\n'
if [ "$FOUND_ANY" = 0 ]; then
  cat <<'EOS'
No known router layout detected. Do it manually:
  1. Find the router entry point:
     grep -rn "createRouter\|createBrowserRouter\|RouterProvider\|defineRouter" --include='*.ts*' .
  2. Read the navigation component — the nav is the user-visible route list.
  3. Start the app and crawl links from the root.
EOS
else
  printf 'Route candidates: %s\n' "$TOTAL"
  cat <<'EOS'

Not covered by static discovery — check these by hand:
  - Routes generated dynamically or from data (CMS pages, tenant slugs)
  - Role-, flag- or plan-gated routes
  - Modal / drawer / tab surfaces driven by query params
    (grep for searchParams, '?tab=', '?modal=', useSearchParams)
  - Redirects, catch-alls and error boundaries (listed above, but they are not screens)
EOS
fi
