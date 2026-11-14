# context/

What agents should know, split by who it is true for.

| Folder | Holds | In git |
|---|---|---|
| `global/` | Facts about AI-OS itself that hold for every user: the toolchain and its traps, official sources, the brand tokens. | Yes, public |
| `personal/` | Facts about one person and one machine: who you are, how you work, your scopes and projects, this computer. | **No** (git-ignored); backed up by `ai-os backup` |

When a fact is true for every user, it goes in `global/`; when it names you, your employer or your computer, it
goes in `personal/`. Never put either one in a skill or a rule.

On-demand table (what to read when): `rules/always_do.md` "Read only when the task needs it".

## personal/

A fresh clone has none. The installer runs `setup/seed-personal-context.py`, which writes the files marked
**stub** below and never overwrites one that exists; run it again any time. The other files are optional: create
them when you need them. Every agent reads `me/profile.md` and `me/preferences.md` at the start of meaningful work.

| File | | What goes in it | Read by |
|---|---|---|---|
| `me/profile.md` | stub | name, role, languages | every agent at session start |
| `me/preferences.md` | stub | chat language and tone, output format, autonomy, trigger phrases | every agent at session start |
| `me/bridge.md` | stub | the few lines every CLI must always see (your chat language, tone, triggers) | appended to the global instructions by the installer |
| `work/scopes.yaml` | stub | which folder is personal, employer or own company (format below) | `ai-os scope`, the session hook, the pre-push guard |
| `work/<scope>/README.md` | | your role in that scope, its conventions, design system and projects | agents working in that scope |
| `work/projects.md` | stub | every project: purpose, stack, last commit, remote | agents looking for a project |
| `work/publishing.md` | | npm scope, author identity, packages already out | the `npm-package-publishing` skill |
| `machine/facts.md` | stub | OS and versions, ports already taken, local traps | agents debugging the toolchain |
| `machine/shell.zsh`, `shell.ps1` | stub | aliases and functions that name your projects | sourced by the shared zsh and PowerShell profiles |
| `machine/dotfiles/git/.gitconfig-<scope>` | | `[user] name`, `email` for one scope | `ai-os scope git-config --apply` (one `includeIf` per scope folder) |
| `machine/dotfiles/ssh/config` | | `Host` stanzas that name your servers or a work account | linked to `~/.ssh/config.personal`, included by the shared ssh config |
| `machine/deploy/apps.conf` | | `<coolify-app> <owner/repo> <branch>` per line | `setup/deploy/local-replica/poll.sh` (format: `apps.conf.example` there) |
| `inbox/pending.md` | stub | what is waiting on you | you |

### work/scopes.yaml

Paths are folders relative to the projects folder (the one that contains ai-os); a folder covers everything
inside it and the first scope that matches wins. A scope may hold brands: one company, one brand per product,
and the brand's design wins over the scope's. Guard terms are checked in the commits of every repo of another
scope: `block` stops the push, `warn` reports it, `re:` makes a term a regular expression.

```yaml
default: personal

guard:
  always_block: []          # never in any repo: private contact data; never printed by value

scopes:
  employer:
    label: Employer
    paths: [Clients/employer]
    notes: context/personal/work/employer/README.md
    git: context/personal/machine/dotfiles/git/.gitconfig-employer
    design:
      system: <link to the employer's design system>
      tokens: Clients/employer/<template repo>/<tokens file>
    guard:
      block: [<internal repo name>, "re:\\bTICKET-[0-9]+\\b"]
      warn: [<employer name>]   # often public (a CV): report, do not stop

  company:
    label: Own company
    paths: [me/products]
    brands:
      product-a:
        paths: [me/products/product-a]
        design: {doc: me/products/product-a/DESIGN.md}

  personal:
    label: Personal
    paths: [me]
```
