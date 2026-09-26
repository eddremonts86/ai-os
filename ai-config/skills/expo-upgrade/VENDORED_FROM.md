# Vendored from expo/skills

Third-party skill, vendored into `ai-config/skills/` so `setup/install-mac.sh` step 5
propagates it to every CLI with no install-script change (flat skill, `SKILL.md` at top level).

| Field | Value |
|---|---|
| Upstream | https://github.com/expo/skills |
| Upstream path | `plugins/expo/skills/expo-upgrade/` |
| Author | Expo (official) |
| License | MIT (see `LICENSE-UPSTREAM.md`) |
| Commit | `efa52f0a9d2176db75992736281c77da1b714fa3` |
| Commit date | 2026-09-24 |
| Vendored | 2026-09-26 |

## What was NOT vendored

See `expo-web-to-native/VENDORED_FROM.md` in this same `ai-config/skills/` for the full
list of the 17 upstream skills skipped and why.

## Local modifications

None. `SKILL.md` and `references/` (`expo-av-to-audio.md`, `expo-av-to-video.md`,
`native-tabs.md`, `new-architecture.md`, `react-19.md`, `react-compiler.md`,
`react-navigation-to-expo-router.md`) are byte-identical to the vendored commit.

## Why this one

skills.sh listed this under the name `upgrading-expo` and marked it a curated Mobile-
topic pick; verified it maps to `expo-upgrade` in the real repo. Lower priority than
the migration/UI skills right now (it's an SDK-version-bump concern that only matters
once an Expo project already exists), but the user asked for all mobile-topic skills
and it costs nothing to have on hand ahead of time.

## Refreshing from upstream

```bash
git clone --depth 1 https://github.com/expo/skills /tmp/expo
diff -r /tmp/expo/plugins/expo/skills/expo-upgrade \
  ai-config/skills/expo-upgrade --exclude=LICENSE-UPSTREAM.md --exclude=VENDORED_FROM.md
```

Port changes by hand; bump the commit table above.
