# Vendored from expo/skills

Third-party skill, vendored into `ai-config/skills/` so `setup/install-mac.sh` step 5
propagates it to every CLI with no install-script change (flat skill, `SKILL.md` at top level).

| Field | Value |
|---|---|
| Upstream | https://github.com/expo/skills |
| Upstream path | `plugins/expo/skills/expo-router/` |
| Author | Expo (official) |
| License | MIT (see `LICENSE-UPSTREAM.md`) |
| Commit | `efa52f0a9d2176db75992736281c77da1b714fa3` |
| Commit date | 2026-09-24 |
| Vendored | 2026-09-26 |

## What was NOT vendored

See `expo-web-to-native/VENDORED_FROM.md` in this same `ai-config/skills/` for the full
list of the 17 upstream skills skipped and why.

## Local modifications

None. `SKILL.md` and `references/` (form-sheet, route-structure, search, tabs,
toolbar-and-headers, zoom-transitions) are byte-identical to the vendored commit.

## Why this one

File-based navigation for the migrated app. The user's React web apps are
web apps with their own routing (framework routers, not React Native navigators) — this
is the direct native counterpart their route structures would need to map onto.

## Refreshing from upstream

```bash
git clone --depth 1 https://github.com/expo/skills /tmp/expo
diff -r /tmp/expo/plugins/expo/skills/expo-router \
  ai-config/skills/expo-router --exclude=LICENSE-UPSTREAM.md --exclude=VENDORED_FROM.md
```

Port changes by hand; bump the commit table above.
