# context/

What agents should know, split by who it is true for.

| Folder | Holds | In git |
|---|---|---|
| `global/` | Facts about AI-OS itself that hold for every user: the toolchain and its traps, official sources, the brand tokens. | Yes, public |
| `personal/` | Facts about one person and one machine: profile, preferences, employer, projects, hardware. | **No** (git-ignored); backed up by `ai-os backup` |
| `personal.example/` | Blank templates for `personal/`. | Yes, public |

A fresh clone has no `personal/`. The installer copies `personal.example/` there once
(`setup/seed-personal-context.py`) and never overwrites what you wrote. Fill it in; every agent reads
`personal/00_profile.md` and `personal/03_preferences.md` at the start of meaningful work.

What lives in `personal/` besides the numbered notes (every item has a blank twin in `personal.example/`):

| Path | Used by |
|---|---|
| `bridge.md` | appended to the global instructions every CLI reads (your chat language, tone, trigger phrases) |
| `05_publishing.md` | the `npm-package-publishing` skill (your scope and author identity) |
| `dotfiles/ssh/config` | linked to `~/.ssh/config.personal`, included from the shared ssh config |
| `dotfiles/git/.gitconfig-*` | your git identities, to include from `~/.gitconfig` |
| `shell.zsh`, `shell.ps1` | sourced by the shared zsh and PowerShell profiles |
| `deploy/apps.conf` | `setup/deploy/local-replica/poll.sh` (which Coolify apps track which branch) |

Files keep their original numbers, so `04_tools.md` (global) and `04_machine.md` (personal) sit on either side
of the same topic. When a fact is true for every user, it goes in `global/`; when it names you, your employer or
your computer, it goes in `personal/`. Never put either one in a skill or a rule.

On-demand table (what to read when): `rules/always_do.md` "Read only when the task needs it".
