# 02 — Projects

Inventory of your projects, for agents that need to find one fast. `<projects>/` is the folder that contains
this repo: `$(dirname "$AI_OS_ROOT")`.

> **Last verified:** <date>. Refresh with:
> `find <projects> -mindepth 2 -maxdepth 4 -name .git -type d`, then per repo
> `git -C <repo> log -1 --format=%cs` and `git -C <repo> remote get-url origin`.

## Layout and identity

```
<projects>/
├── ai-os/          ← this framework
└── <group>/        ← <what lives here, which git identity it uses>
```

## Projects

| Project | Purpose | Stack | Last commit | Remote |
| --- | --- | --- | --- | --- |
| <name> | <one line> | <stack> | <date> | <owner/repo> |
