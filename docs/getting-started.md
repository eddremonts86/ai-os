# Getting Started

> Step-by-step setup for devs adopting AI-OS for the first time.

## Prerequisites

- **Mac (Apple Silicon or Intel)** or **Windows 10/11** with PowerShell.
- Internet connection.
- 30-60 minutes of time (most of it is downloading packages).
- GitHub account with access to the AI-OS repo.

## Step 1: Clone the repo

```bash
export AI_OS_ROOT="$HOME/Projects/ai-os"   # any location works
git clone https://github.com/eddremonts86/ai-os "$AI_OS_ROOT"
cd "$AI_OS_ROOT"
```

> **Windows:** `git clone https://github.com/eddremonts86/ai-os $HOME\Projects\ai-os`

## Step 2: Run setup

### Mac

```bash
ai-os install                  # choose CLIs, components and packages one by one (needs Node 18+)
bash setup/install-mac.sh      # or: install what install.yaml says, else the defaults
bash setup/install-mac.sh --full   # or: everything
```

### Windows (PowerShell as Admin)

```powershell
powershell -ExecutionPolicy Bypass -File .\setup\install-windows.ps1
```

The script:

In short (the full list and every opt-in are in the README's "Install" section):

1. Installs Homebrew packages (Mac) or Chocolatey packages (Windows), and the Python packages into `~/.ai-os/venv`.
2. Adds one marked block to your own `~/.zshrc` and `~/.ssh/config` (or links them when you have none), and seeds
   `~/.gitconfig` from a template only if you have none; Oh My Zsh + Powerlevel10k
   (`AIOS_SHELL_THEME=1`), the Nerd Font (`AIOS_FONTS=1`) and the Warp/Terminal.app restyle
   (`AIOS_TERMINAL_THEME=1`) are opt-in.
3. Links the skills into every CLI and checks the 14 required superpowers skills (links any that are missing).
4. Writes the agents from `ai-config/agents/` into Claude Code, Codex, Gemini CLI and opencode.
5. Generates the MCP config for Hermes, Claude Code, Codex, Gemini and VS Code from `ai-config/mcp/*.yaml`.
6. Starts the memory stack and runs `setup/verify.sh` (Windows: `setup/verify-windows.ps1`). On a Mac it also
   installs the launchd agents and the pre-push hook.

## Step 3: Personalize git (if you used the template)

```bash
git config --global user.name "Your Name"
git config --global user.email "you@email.com"
```

## Step 4: Verify

```bash
bash setup/verify.sh
```

**Expected output (abridged; exact skill/MCP counts vary by checkout):**

```
[ai-os verify] ✅ AI-OS at <your AI_OS_ROOT>
[ai-os verify] ✅   .zshrc → <your AI_OS_ROOT>/dev-env/dotfiles/zsh/.zshrc   (AIOS_SHELL_THEME=1; without it: ⚠️ .zshrc is not a symlink, which is fine)
[ai-os verify]   Source of truth: <N> expected skill names per client (flat + gstack + ECC DAILY)
[ai-os verify] ✅   [claude] ~/.claude/skills: <N>/<N>+ skills (all expected names present)
[ai-os verify] ✅   [codex] ~/.codex/skills: <N>/<N>+ skills (all expected names present)
[ai-os verify] ✅   [gemini] ~/.gemini/skills: <N>/<N>+ skills (all expected names present)
[ai-os verify] ✅   [antigravity] ~/.agents/skills: <N>/<N>+ skills (all expected names present)
[ai-os verify] ✅   [hermes] ~/.hermes/config.yaml declares ~/.agents/skills under skills.external_dirs
[ai-os verify] ✅ 14/14 superpowers skills OK
[ai-os verify] ✅ MCP servers configured: <N>
[ai-os verify] Required: <N> passed, 0 failed
[ai-os verify] Optional/best-effort: <N> present, <N> missing or not configured (does not block install)
[ai-os verify] ✅ AI-OS is correctly installed. 🎉
```

## Step 5: Try AI-OS

### In Hermes (recommended)

```bash
hermes chat --skills aios-quickstart
```

### In any CLI

The `aios-quickstart` skill auto-loads from:

- **Claude Code:** `/skill aios-quickstart` or auto-load if it's in `~/.claude/skills/`.
- **Codex / Gemini / Antigravity:** auto-load from `~/.codex/skills/`, `~/.gemini/skills/`, `~/.agents/skills/`.

## Next steps

1. **Create your first Spec:** set `AI_OS_ROOT` to the repository root, then run `nano "$AI_OS_ROOT/specs/current_spec.md"` and follow the template.
2. **Load context:** the `aios-quickstart` skill guides you step by step.
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

PyYAML is required: `setup/generate-mcp-config.py` and `setup/render-agents.py` stop without it. The installer
puts it in the AI-OS venv; re-run the installer, or install it there:

```bash
"$HOME/.ai-os/venv/bin/pip" install pyyaml
```

### Fonts don't show in Warp/Terminal

1. Verify installation: `ls ~/Library/Fonts/ | grep -i nerd`
2. Restart Warp/Terminal completely.
3. Change the font manually in Settings → Appearance → Font.

## Next steps

- Read [docs/cross-platform.md](cross-platform.md) if you'll use Mac + Windows.
- Read [docs/sharing.md](sharing.md) if you want to contribute to the repo or share with other devs.
- Read [docs/architecture.md](architecture.md) to understand the internal organization.
