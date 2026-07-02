# Getting Started

> Step-by-step setup for devs adopting AI-OS for the first time.

## Prerequisites

- **Mac (Apple Silicon or Intel)** or **Windows 10/11** with PowerShell.
- Internet connection.
- 30-60 minutes of time (most of it is downloading packages).
- GitHub account with access to the AI-OS repo.

## Step 1: Clone the repo

```bash
git clone https://github.com/eddremonts86/ai-os ~/Projects/ai-os
cd ~/Projects/ai-os
```

> **Windows:** `git clone https://github.com/eddremonts86/ai-os $HOME\Projects\ai-os`

## Step 2: Run setup

### Mac
```bash
bash setup/install-mac.sh
```

### Windows (PowerShell as Admin)
```powershell
powershell -ExecutionPolicy Bypass -File .\setup\install-windows.ps1
```

The script:

1. Installs Homebrew packages (Mac) or Chocolatey packages (Windows).
2. Installs Oh My Zsh + Powerlevel10k + plugins (Mac).
3. Creates dotfile symlinks (zsh, git, ssh).
4. Configures global flat skills via symlinks.
5. Installs the 14 required superpowers skills.
6. Generates `~/.hermes/config.yaml` from the MCP YAMLs.
7. Configures Warp (Mac).
8. Configures Terminal.app (Mac).
9. Reloads zsh.

## Step 3: Personalize git (if you used the template)

```bash
git config --global user.name "Your Name"
git config --global user.email "you@email.com"
```

## Step 4: Verify

```bash
bash setup/verify.sh
```

**Expected output:**
```
[ai-os verify] ✅ AI-OS at /Users/edd/Projects/ai-os
[ai-os verify] ✅   .zshrc → /Users/edd/Projects/ai-os/dev-env/dotfiles/zsh/.zshrc
[ai-os verify] ✅   .p10k.zsh → ...
[ai-os verify] ✅   .gitignore_global → ...
[ai-os verify] ✅   ~/.claude/skills: <count> skills
[ai-os verify] ✅   ~/.codex/skills: <count> skills
[ai-os verify] ✅   ~/.gemini/skills: <count> skills
[ai-os verify] ✅   ~/.agents/skills: <count> skills
[ai-os verify] ✅   ~/.hermes/skills/imported: <count> skills
[ai-os verify] ✅ 14/14 superpowers skills OK
[ai-os verify] ✅ MCP servers configured: 7
[ai-os verify] ✅ Oh My Zsh installed
[ai-os verify] ✅ Powerlevel10k installed
[ai-os verify] ✅ Warp with CaskaydiaCove Nerd Font
[ai-os verify] Passed: <count>
[ai-os verify] ✅ Failed: 0
```

## Step 5: Try AI-OS

### In Hermes (recommended)
```bash
hermes chat --skills ai-os-quickstart
```

### In any CLI
The `ai-os-quickstart` skill auto-loads from:

- **Claude Code:** `/skill ai-os-quickstart` or auto-load if it's in `~/.claude/skills/`.
- **Codex / Gemini / Antigravity:** auto-load from `~/.codex/skills/`, `~/.gemini/skills/`, `~/.agents/skills/`.

## Next steps

1. **Create your first Spec:** `nano ~/Projects/ai-os/specs/current_spec.md` and follow the template.
2. **Load context:** the `ai-os-quickstart` skill guides you step by step.
3. **Personalize:** edit files in `ai-config/`, `dev-env/dotfiles/`, `context/` according to your preferences.
4. **Sync to the repo:** `git add . && git commit -m "personalize" && git push`.

## Troubleshooting

### "Permission denied" in brew install (Mac)
```bash
sudo chown -R $(whoami) /opt/homebrew
```

### "Execution Policy" in PowerShell (Windows)
```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Bypass
```

### Skills don't load in Hermes
```bash
hermes gateway restart
# or from the CLI:
/reload-skills
```

### PyYAML is unavailable
```bash
pip3 install pyyaml --user
```

`setup/generate-mcp-config.py` has a built-in fallback for the simple MCP YAML
files in this repo, so PyYAML is preferred but no longer required for dry-runs.

### Fonts don't show in Warp/Terminal
1. Verify installation: `ls ~/Library/Fonts/ | grep -i nerd`
2. Restart Warp/Terminal completely.
3. Change the font manually in Settings → Appearance → Font.

## Next steps

- Read [docs/cross-platform.md](cross-platform.md) if you'll use Mac + Windows.
- Read [docs/sharing.md](sharing.md) if you want to contribute to the repo or share with other devs.
- Read [docs/architecture.md](architecture.md) to understand the internal organization.
