# Vendored from anthropics/claude-plugins-official

| Field | Value |
|---|---|
| Upstream | https://github.com/anthropics/claude-plugins-official, `plugins/frontend-design/skills/frontend-design/` |
| License | Apache-2.0 (`LICENSE.txt`, identical to upstream's) |
| Synced revision | `44490cc` (2026-09-01). Before that it matched `d029127` (2026-06-15) |
| Local change | The final "token-locked aesthetic anchors" section, which points at `references/aesthetic-anchors.md` (AI-OS's own file) |

Update by diffing upstream's `SKILL.md` against this one and keeping the local section:

```bash
gh api repos/anthropics/claude-plugins-official/contents/plugins/frontend-design/skills/frontend-design/SKILL.md --jq .content | base64 -d | diff - ai-config/skills/frontend-design/SKILL.md
```

Do not also install the `frontend-design@claude-plugins-official` plugin: it ships this same skill under
the same name, so both would load and compete for the same requests.
