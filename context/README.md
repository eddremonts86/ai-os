# context/

What agents should know, split by who it is true for.

| Folder | Holds | In git |
|---|---|---|
| `global/` | Facts about AI-OS itself that hold for every user: the toolchain and its traps, official sources, the brand tokens. | Yes, public |
| `personal/` | Facts about one person and one machine: profile, preferences, employer, projects, hardware. | **No** (git-ignored); backed up by `ai-os backup` |
| `personal.example/` | Blank templates for `personal/`. | Yes, public |

A fresh clone has no `personal/`. The installer copies `personal.example/` there once
(`setup/seed-personal-context.py`) and never overwrites what you wrote. Fill it in; every agent reads
`personal/me/profile.md` and `personal/me/preferences.md` at the start of meaningful work.

`personal/` is grouped by what each file is about (every file has a blank twin in `personal.example/`):

| Folder | Files | Used by |
|---|---|---|
| `me/` | `profile.md`, `preferences.md`, `bridge.md` | every agent at session start; `bridge.md` is appended to the global instructions of every CLI (chat language, tone, trigger phrases) |
| `work/` | `scopes.yaml`, one folder per scope (`<scope>/README.md`), `projects.md`, `publishing.md` | `ai-os scope`, the session hook and the pre-push guard; the project inventory; the `npm-package-publishing` skill |
| `machine/` | `facts.md`, `shell.zsh`, `shell.ps1`, `dotfiles/git/`, `dotfiles/ssh/config`, `deploy/apps.conf` | this computer: versions and traps, shell additions sourced by the shared profiles, git identities, ssh hosts (linked to `~/.ssh/config.personal`), the local Coolify replica |
| `inbox/` | `pending.md` | what is waiting on you |

When a fact is true for every user, it goes in `global/`; when it names you, your employer or
your computer, it goes in `personal/`. Never put either one in a skill or a rule.

On-demand table (what to read when): `rules/always_do.md` "Read only when the task needs it".
