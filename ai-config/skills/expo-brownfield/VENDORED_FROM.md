# Vendored from expo/skills

Third-party skill, vendored into `ai-config/skills/` so `setup/install-mac.sh` step 5
propagates it to every CLI with no install-script change (flat skill, `SKILL.md` at top level).

| Field | Value |
|---|---|
| Upstream | https://github.com/expo/skills |
| Upstream path | `plugins/expo/skills/expo-brownfield/` |
| Author | Expo (official) |
| License | MIT (see `LICENSE-UPSTREAM.md`) |
| Commit | `efa52f0a9d2176db75992736281c77da1b714fa3` |
| Commit date | 2026-09-24 |
| Vendored | 2026-09-26 |

## What was NOT vendored

See `expo-web-to-native/VENDORED_FROM.md` in this same `ai-config/skills/` for the full
list of the 17 upstream skills skipped (the 7 `eas-*` skills, `expo-app-clip`,
`expo-module`, `expo-dom`, `expo-dev-client`, `expo-examples`, `expo-skill-feedback`)
and why.

## Local modifications

None. `SKILL.md` and `references/` are byte-identical to the vendored commit.

## Why this one

The alternative migration shape to `expo-web-to-native`'s full rewrite: embedding React
Native incrementally into an existing native iOS/Android app (a React Native screen
inside SwiftUI/UIKit or Kotlin) instead of porting the whole app at once. Worth having
alongside the full-migration skill since "rewrite everything" vs. "adopt incrementally"
is a real fork in the road for enForma/builderhunt/novelaudio, not a foregone
conclusion.

## Refreshing from upstream

```bash
git clone --depth 1 https://github.com/expo/skills /tmp/expo
diff -r /tmp/expo/plugins/expo/skills/expo-brownfield \
  ai-config/skills/expo-brownfield --exclude=LICENSE-UPSTREAM.md --exclude=VENDORED_FROM.md
```

Port changes by hand; bump the commit table above.
