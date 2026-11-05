# Vendored from expo/skills

Third-party skill, vendored into `ai-config/skills/` so `setup/install-mac.sh` step 5
propagates it to every CLI with no install-script change (flat skill, `SKILL.md` at top level).

| Field | Value |
|---|---|
| Upstream | https://github.com/expo/skills |
| Upstream path | `plugins/expo/skills/expo-ui/` |
| Author | Expo (official) |
| License | MIT (see `LICENSE-UPSTREAM.md`) |
| Commit | `efa52f0a9d2176db75992736281c77da1b714fa3` |
| Commit date | 2026-09-24 |
| Vendored | 2026-09-26 |

## What was NOT vendored

See `expo-web-to-native/VENDORED_FROM.md` in this same `ai-config/skills/` for the full
list of the 17 upstream skills skipped and why.

## Local modifications

None. `SKILL.md` and `references/` are byte-identical to the vendored commit.

## Why this one

Distinct from `expo-native-ui` (icons/gradients/media/storage/visual-effects):
this is specifically the `@expo/ui` package — real SwiftUI on iOS and Jetpack Compose
on Android for sheets, pickers, sliders, toggles, grouped-form sections — and when to
prefer it over Reanimated / `@gorhom/bottom-sheet` / RN's built-in Picker/Switch. Ships
its own `scripts/list-components.js` (reviewed: reads a local project's installed
`@expo/ui` package.json, no network access) to list what's actually installed.

## Refreshing from upstream

```bash
git clone --depth 1 https://github.com/expo/skills /tmp/expo
diff -r /tmp/expo/plugins/expo/skills/expo-ui \
  ai-config/skills/expo-ui --exclude=LICENSE-UPSTREAM.md --exclude=VENDORED_FROM.md
```

Port changes by hand; bump the commit table above.
