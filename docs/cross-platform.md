# Cross-platform: Mac vs Windows

> AI-OS works on both platforms, but with important differences.

## Comparison table

| Feature | Mac (native) | Windows (PowerShell) | Notes |
|---|---|---|---|
| **AI-OS core (CLAUDE.md, workflows, rules)** | ✅ | ✅ | Identical |
| **Global skills (99)** | ✅ | ✅ | Symlinks work the same |
| **MCP servers (7)** | ✅ | ✅ | stdio works on both |
| **Oh My Zsh + Powerlevel10k** | ✅ | ❌ | Unix only. Windows uses PowerShell. |
| **Warp terminal** | ✅ | ✅ (Windows version) | Warp has a Windows build. |
| **Terminal.app (native)** | ✅ |❌ | Mac only. Windows uses Windows Terminal. |
| **Homebrew** | ✅ |❌ | Mac only. Windows uses Chocolatey. |
| **Brewfile** | ✅ |❌ (use choco equivalent on Windows) | Windows has its own install script. |
| **Symlinks (zshrc, ssh config)** | ✅ |⚠️ partial | Windows has `New-Item -ItemType SymbolicLink` but with caveats (needs admin or Dev Mode). |
| **Hermes Agent CLI** | ✅ | ✅ | Hermes runs on both. |
| **Claude Code CLI** | ✅ | ✅ | Works on both. |
| **Codex CLI** | ✅ | ✅ | Works on both. |
| **Gemini CLI** | ✅ | ✅ | Works on both. |
| **Antigravity / Copilot** | ⚠️ (Warp build) | ✅ (VSCode fork native) | Antigravity is a VSCode fork. |
| **yq** | ✅ (brew) | ✅ (choco / direct download) | For the verify script. |
| **git** | ✅ (Xcode CLI tools or brew) | ✅ (Git for Windows or choco) | Both. |
| **SSH agent** | ✅ (1Password/GPG) | ⚠️ (Pageant or built-in OpenSSH) | Different. |
| **Terminal multiplexers (tmux)** | ✅ |❌ (use Windows Terminal tabs) | Unix only. |

## Mac: complete setup

```bash
bash setup/install-mac.sh
```

Includes:

- Homebrew packages (Brewfile).
- Oh My Zsh + Powerlevel10k.
- 99 global skills (5 CLIs).
- 14 superpowers skills.
- 7MCP servers.
- Warp config.
- Terminal.app config (Pro theme, zsh shell).

## Windows: limited setup

```powershell
powershell -ExecutionPolicy Bypass -File .\setup\install-windows.ps1
```

Includes:

- Chocolatey packages (git, node, python, gh, fzf, etc.).
- PowerShell custom profile.
- 99 global skills (5 CLIs).
- 14 superpowers skills.
- 7MCP servers.
- (Does NOT include shell like Oh My Zsh — uses PowerShell natively.)

**Windows limitations:**

- No p10k/Oh My Zsh → use **Oh-My-Posh** or **Starship** to get a similar prompt.
- No native `ln -s` → use `New-Item -ItemType SymbolicLink` (with admin privileges).
- No zsh → PowerShell + `pwsh` (PowerShell Core).
- Brewfile does not apply → use `choco` packages instead.
- Some MCP servers using `uvx` require Python + uv installed manually.

## Symlinks on Windows: caveats

Windows 10/11 supports symlinks but:

- They **require admin privileges** or **Developer Mode** enabled (Settings → Update & Security → For Developers).
- If you don't have admin, symlinks fail and the script copies files (does NOT symlink). This means **future edits to AI-OS are not propagated** to your `~/.gitconfig`, etc. Solution: use `mklink /D` (junction) or enable Developer Mode.

## Fonts (Nerd Fonts)

| Platform | Install |
|---|---|
| Mac | `brew install --cask font-caskaydia-cove-nerd-font` |
| Windows | Download from https://www.nerdfonts.com/ and install manually (double click on .ttf) |
| Windows (choco) | `choco install nerd-fonts-caskaydia-cove` |

## Path conventions

| Path | Mac | Windows |
|---|---|---|
| Home | `~/` | `%USERPROFILE%\` or `$HOME\` |
| Config shell | `~/.zshrc` | `$PROFILE` (PowerShell) |
| SSH config | `~/.ssh/config` | `%USERPROFILE%\.ssh\config` |
| Hermes config | `~/.hermes/config.yaml` | `%USERPROFILE%\.hermes\config.yaml` |
| Skills globales | `~/.claude/skills/` | `%USERPROFILE%\.claude\skills\` |

## Testing cross-platform

If you want to verify that AI-OS works on Windows from Mac:

1. Boot a Windows VM (Parallels, VirtualBox, WSL2).
2. Clone the repo inside the VM.
3. Run `setup/install-windows.ps1` from PowerShell Admin.
4. Run `setup/verify-windows.ps1`.

## Recommendation

- **If your primary setup is Mac:** use AI-OS Mac. Experience is better (zsh, p10k, Warp).
- **If you need Windows for something specific (eg: testing IE/Edge legacy, .NET, SQL Server):** minimal setup. Use PowerShell with Oh-My-Posh or Starship as the p10k equivalent.
- **If your primary setup is Windows:** consider WSL2 (Windows Subsystem for Linux) to get 90% of AI-OS Mac. Much more aligned than native PowerShell.
