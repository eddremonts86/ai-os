# Vendored from expo/skills

Third-party skill, vendored into `ai-config/skills/` so `setup/install-mac.sh` step 5
propagates it to every CLI with no install-script change (flat skill, `SKILL.md` at top level).

| Field | Value |
|---|---|
| Upstream | https://github.com/expo/skills |
| Upstream path | `plugins/expo/skills/expo-web-to-native/` |
| Author | Expo (official) |
| License | MIT (see `LICENSE-UPSTREAM.md`) |
| Commit | `efa52f0a9d2176db75992736281c77da1b714fa3` |
| Commit date | 2026-09-24 |
| Vendored | 2026-09-26 |

## What was NOT vendored from expo/skills

Of ~28 skills in the upstream repo, 10 were picked alongside this one
(`expo-brownfield`, `expo-overview`, `expo-project-structure`, `expo-native-ui`,
`expo-ui`, `expo-design-system`, `expo-router`, `expo-data-fetching`, `expo-animation`,
`expo-upgrade`) — see each one's own `VENDORED_FROM.md`. Explicitly skipped:

- The 7 `eas-*` skills (`eas-app-stores`, `eas-hosting`, `eas-observe`, `eas-simulator`,
  `eas-update`, `eas-update-insights`, `eas-workflows`) — these tie into Expo
  Application Services, Expo's paid cloud build/deploy platform. Using EAS is a real
  infrastructure decision (this repo's whole philosophy leans self-hosted/Coolify), not
  a skill-install decision — add these later if EAS gets chosen for native builds.
- `expo-app-clip` — iOS App Clips only, a narrow feature not relevant to a first
  migration pass.
- `expo-module` — writing custom native modules (Swift/Kotlin via the Expo Modules
  API). Only needed if a migration hits something with no existing native module;
  premature to install before that happens.
- `expo-dom` — DOM components (running web code in a native webview) is a narrower
  mechanism than the end-to-end migration this skill covers; its own description says
  to use `expo-web-to-native` for the full migration and only reach for `expo-dom`
  itself for the specific webview mechanism.
- `expo-dev-client` — building/distributing dev clients for internal testing; a
  later-stage concern once a project actually exists to test.
- `expo-examples` — a catalog of ~70 official `with-*` integration examples (Stripe,
  Clerk, Supabase, NativeWind, etc.) with its own `allowed-tools` (gh/git clone/npx
  create-expo/degit) to actually scaffold from them. Genuinely useful once integrating
  a specific third-party library into an already-migrated app — not needed for the
  initial "should we migrate, and how" phase.
- `expo-skill-feedback` — ships its own telemetry scripts (`scripts/skill-event.cjs`,
  `scripts/telemetry.cjs`) that report skill-usage feedback back to Expo. Not something
  to vendor into a project that doesn't want outbound telemetry as a side effect of
  using a skill.

## Local modifications

None. `SKILL.md` is byte-identical to the vendored commit.

## Why this one

The user asked for this specifically: the user's React web apps may need a native mobile version. This skill is Expo's own end-to-end guide
for exactly that — migrating an existing Next.js/Vite/CRA React codebase to iOS/Android
with Expo, including how web idioms (the DOM, CSS, React Router, `localStorage`,
`window`) do and don't map to native. The natural starting point of the whole batch.

## Refreshing from upstream

```bash
git clone --depth 1 https://github.com/expo/skills /tmp/expo
diff -r /tmp/expo/plugins/expo/skills/expo-web-to-native \
  ai-config/skills/expo-web-to-native --exclude=LICENSE-UPSTREAM.md --exclude=VENDORED_FROM.md
```

Port changes by hand; bump the commit table above.
