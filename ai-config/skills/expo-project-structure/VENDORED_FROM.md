# Vendored from expo/skills

Third-party skill, vendored into `ai-config/skills/` so `setup/install-mac.sh` step 5
propagates it to every CLI with no install-script change (flat skill, `SKILL.md` at top level).

| Field | Value |
|---|---|
| Upstream | https://github.com/expo/skills |
| Upstream path | `plugins/expo/skills/expo-project-structure/` |
| Author | Expo (official) |
| License | MIT (see `LICENSE-UPSTREAM.md`) |
| Commit | `efa52f0a9d2176db75992736281c77da1b714fa3` |
| Commit date | 2026-09-24 |
| Vendored | 2026-09-26 |

## What was NOT vendored

See `expo-web-to-native/VENDORED_FROM.md` in this same `ai-config/skills/` for the full
list of the 17 upstream skills skipped and why.

## Local modifications

None. `SKILL.md` and `agents/` are byte-identical to the vendored commit.

## Why this one

How an Expo/Expo Router project is meant to be laid out (directories, config,
conventions) — the concrete counterpart to `expo-overview`'s conceptual orientation.
Relevant the moment a migration actually starts a new Expo project, whichever of
`expo-web-to-native` or `expo-brownfield` gets chosen.

## Refreshing from upstream

```bash
git clone --depth 1 https://github.com/expo/skills /tmp/expo
diff -r /tmp/expo/plugins/expo/skills/expo-project-structure \
  ai-config/skills/expo-project-structure --exclude=LICENSE-UPSTREAM.md --exclude=VENDORED_FROM.md
```

Port changes by hand; bump the commit table above.
