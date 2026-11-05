# Vendored from expo/skills

Third-party skill, vendored into `ai-config/skills/` so `setup/install-mac.sh` step 5
propagates it to every CLI with no install-script change (flat skill, `SKILL.md` at top level).

| Field | Value |
|---|---|
| Upstream | https://github.com/expo/skills |
| Upstream path | `plugins/expo/skills/expo-animation/` |
| Author | Emil Kowalski (contributed to Expo's official skill set) |
| License | MIT — this skill ships its own `LICENSE` in the upstream repo, separate from
  the repo-level one, both MIT (see `LICENSE-UPSTREAM.md`, taken from the skill's own file) |
| Commit | `efa52f0a9d2176db75992736281c77da1b714fa3` |
| Commit date | 2026-09-24 |
| Vendored | 2026-09-26 |

## What was NOT vendored

See `expo-web-to-native/VENDORED_FROM.md` in this same `ai-config/skills/` for the full
list of the 17 upstream skills skipped and why.

## Local modifications

None. `SKILL.md` and `RECIPES.md` are byte-identical to the vendored commit.

## Why this one

React Native's animation APIs (Reanimated, gesture-driven UI) are a different surface
than web CSS/Motion — `emil-design-eng` (vendored separately, same author) covers web
motion craft; this is the native-specific counterpart: gesture-detector press states,
GPU-bound properties on RN, `useDerivedValue`, and RN-specific recipes.

## Refreshing from upstream

```bash
git clone --depth 1 https://github.com/expo/skills /tmp/expo
diff -r /tmp/expo/plugins/expo/skills/expo-animation \
  ai-config/skills/expo-animation --exclude=LICENSE-UPSTREAM.md --exclude=VENDORED_FROM.md
```

Port changes by hand; bump the commit table above.
