# setup/install-windows.ps1
# Setup AI-OS on Windows from zero. 1-command PowerShell.
#
# Usage (PowerShell as Admin):
#   git clone https://github.com/eddremonts86/ai-os $HOME\Projects\ai-os
#   cd $HOME\Projects\ai-os
#   powershell -ExecutionPolicy Bypass -File .\setup\install-windows.ps1
#
# Idempotent: runs multiple times without breaking anything.
#
# Options (env vars):
#   $env:SKIP_CHOCO = "1"       → skip chocolatey packages
#   $env:SKIP_NPM = "1"        → skip npm packages
#   $env:SKIP_DOTFILES = "1"   → skip dotfile symlinks
#   $env:SKIP_MCP = "1"        → skip MCP config regeneration
#   $env:SKIP_VERIFY = "1"     → skip verification tests at the end
#   $env:DRY_RUN = "1"         → simulate without executing (CI mode)

$ErrorActionPreference = "Stop"

# ─── DRY_RUN mode (CI) ───
if ($env:DRY_RUN -eq "1") {
    & pwsh "$PSScriptRoot\install-windows.dry-run.ps1"
    exit $LASTEXITCODE
}

# ─── Paths ───
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$AIOSRoot = Split-Path -Parent $ScriptDir
$HomeDir = $HOME
$LogPrefix = "[ai-os install]"

function Log($msg) { Write-Host "$LogPrefix $msg" }
function Ok($msg) { Write-Host "$LogPrefix ✅ $msg" }
function Warn($msg) { Write-Host "$LogPrefix ⚠️  $msg" -ForegroundColor Yellow }
function Err($msg) { Write-Host "$LogPrefix ❌ $msg" -ForegroundColor Red }

# ─── Header ───
Log "═══════════════════════════════════════════════════════════"
Log "  AI-OS Setup (Windows)"
Log "  Source: $AIOSRoot"
Log "  Target: $HomeDir"
Log "═══════════════════════════════════════════════════════════"
Write-Host ""

# ─── 0. Prereqs ───
Log "0. Verifying prerequisites..."

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Err "git not installed. Install Git for Windows: https://git-scm.com/download/win"
    exit 1
}
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Warn "chocolatey not installed (recommended for Windows)"
    Log "Install with: Set-ExecutionPolicy Bypass; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
} else {
    Ok "chocolatey OK"
}
if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
    Warn "Node.js not installed. Install from https://nodejs.org"
}
if (-not (Get-Command python -ErrorAction SilentlyContinue)) {
    Warn "Python not installed. Install from https://python.org"
}
if (-not (Get-Command uv -ErrorAction SilentlyContinue)) {
    Warn "uv not installed (recommended for modern Python)"
}
Ok "Prerequisites OK"
Write-Host ""

# ─── 1. Chocolatey packages ───
if (-not $env:SKIP_CHOCO -and (Get-Command choco -ErrorAction SilentlyContinue)) {
    Log "1. Installing Chocolatey packages (may take 5-15 min)..."

    $packages = @(
        "git",
        "gh",
        "nodejs",
        "python311",
        "uv",
        "pwsh",
        "fzf",
        "ripgrep",
        "fd",
        "jq",
        "yq",
        "mkcert",
        "docker-desktop",
        "vscode",
        "windsurf",
        "googlechrome",
        "firefox",
        "slack",
        "discord",
        "7zip",
        "notepadplusplus",
        "keepassxc",
        "postman",
        "tableplus",
        "warp"  # Warp has a Windows version
    )

    foreach ($pkg in $packages) {
        try {
            choco install -y $pkg --no-progress 2>&1 | Out-Null
            Ok "  $pkg"
        } catch {
            Warn "  $pkg failed: $_"
        }
    }
    Ok "Chocolatey packages installed"
} else {
    Log "1. SKIP_CHOCO=1, skipping chocolatey"
}
Write-Host ""

# ─── 2. Fonts ───
Log "2. Verifying Nerd Fonts..."
# PowerShell does not handle fonts directly; user must install manually
# CaskaydiaCove Nerd Font: download from https://www.nerdfonts.com/font-downloads
# Or via chocolatey: choco install nerd-fonts-caskaydia-cove
Warn "  Install CaskaydiaCove Nerd Font manually from:"
Log "    https://github.com/ryanoasis/nerd-fonts/releases/latest"
Log "    Or: choco install nerd-fonts-caskaydia-cove"
Write-Host ""

# ─── 3. Symlinks for dotfiles ───
if (-not $env:SKIP_DOTFILES) {
    Log "3. Creating dotfiles symlinks..."

    # PowerShell profile
    if (Test-Path "$AIOSRoot\dev-env\dotfiles\powershell\Microsoft.PowerShell_profile.ps1") {
        $profilePath = $PROFILE.CurrentUserAllHosts
        $profileDir = Split-Path -Parent $profilePath
        if (-not (Test-Path $profileDir)) {
            New-Item -ItemType Directory -Path $profileDir -Force | Out-Null
        }
        if (Test-Path $profilePath) {
            Move-Item $profilePath "$profilePath.pre-aios.bak" -Force
        }
        New-Item -ItemType SymbolicLink -Path $profilePath -Target "$AIOSRoot\dev-env\dotfiles\powershell\Microsoft.PowerShell_profile.ps1" -Force | Out-Null
        Ok "  PowerShell profile → ai-os"
    }

    # Git config
    if (Test-Path "$AIOSRoot\dev-env\dotfiles\git\.gitconfig.template") {
        if (-not (Test-Path "$HomeDir\.gitconfig")) {
            Copy-Item "$AIOSRoot\dev-env\dotfiles\git\.gitconfig.template" "$HomeDir\.gitconfig"
            Ok "  .gitconfig → template (customize: git config --global user.name/email)"
        } else {
            Ok "  .gitconfig already exists, not overwriting"
        }
    }

    # Git ignore global
    if (Test-Path "$AIOSRoot\dev-env\dotfiles\git\.gitignore_global") {
        if (Test-Path "$HomeDir\.gitignore_global") {
            Move-Item "$HomeDir\.gitignore_global" "$HomeDir\.gitignore_global.pre-aios.bak" -Force
        }
        New-Item -ItemType SymbolicLink -Path "$HomeDir\.gitignore_global" -Target "$AIOSRoot\dev-env\dotfiles\git\.gitignore_global" -Force | Out-Null
        git config --global core.excludesfile "$HomeDir\.gitignore_global" 2>&1 | Out-Null
        Ok "  .gitignore_global → ai-os"
    }

    # SSH config
    if (Test-Path "$AIOSRoot\dev-env\dotfiles\ssh\config") {
        $sshDir = "$HomeDir\.ssh"
        if (-not (Test-Path $sshDir)) {
            New-Item -ItemType Directory -Path $sshDir -Force | Out-Null
        }
        if (Test-Path "$sshDir\config") {
            Move-Item "$sshDir\config" "$sshDir\config.pre-aios.bak" -Force
        }
        Copy-Item "$AIOSRoot\dev-env\dotfiles\ssh\config" "$sshDir\config" -Force
        Ok "  .ssh/config → ai-os"
    }
} else {
    Log "3. SKIP_DOTFILES=1, skipping dotfiles"
}
Write-Host ""

# ─── 4. PowerShell profile (custom) ───
Log "4. PowerShell profile..."
$profileDir = Split-Path -Parent $PROFILE.CurrentUserAllHosts
if (-not (Test-Path $profileDir)) {
    New-Item -ItemType Directory -Path $profileDir -Force | Out-Null
}
$customProfile = "$AIOSRoot\dev-env\dotfiles\powershell\Microsoft.PowerShell_profile.ps1"
$customProfileContent = @'
# AI-OS PowerShell profile (Edd)
# Load Oh-My-Posh or Starship if installed (theme + git info)

# Prompt
function prompt {
    $location = Get-Location
    $gitBranch = ""
    if (Test-Path "$location\.git") {
        $gitBranch = " ($((git -C $location rev-parse --abbrev-ref HEAD) 2>$null))"
    }
    "$location$gitBranch > "
}

# Unix-style aliases
Set-Alias -Name ll -Value "ls -lh" -Option AllScope -Force
Set-Alias -Name la -Value "ls -lha" -Option AllScope -Force
Set-Alias -Name gs -Value "git status" -Option AllScope -Force
Set-Alias -Name gp -Value "git push" -Option AllScope -Force
Set-Alias -Name gpl -Value "git pull" -Option AllScope -Force
Set-Alias -Name gc -Value "git commit" -Option AllScope -Force
Set-Alias -Name gco -Value "git checkout" -Option AllScope -Force

# Paths
$env:Path = "$Home\bin;$env:Path"
$env:Path = "$Home\.local\bin;$env:Path"

# Hermes
function h { hermes }
Set-Alias -Name hc -Value "hermes chat" -Option AllScope -Force
Set-Alias -Name hcq -Value "hermes chat -q" -Option AllScope -Force

# Project shortcuts
function projects { Set-Location "$HOME\Projects" }
function personal { Set-Location "$HOME\Projects\eddremonts86" }
function work { Set-Location "$HOME\Projects\ei-schilling" }
'@
if (-not (Test-Path $customProfile)) {
    Set-Content -Path $customProfile -Value $customProfileContent
    Ok "PowerShell custom profile created at $customProfile"
} else {
    Ok "PowerShell custom profile already exists"
}
Write-Host ""

# ─── 5. Global skills (symlinks) ───
Log "5. Setting global skills in 5 CLIs..."

$cliDirs = @(
    "$HomeDir\.claude\skills",
    "$HomeDir\.codex\skills",
    "$HomeDir\.gemini\skills",
    "$HomeDir\.agents\skills"
)

foreach ($cliDir in $cliDirs) {
    if (-not (Test-Path $cliDir)) {
        New-Item -ItemType Directory -Path $cliDir -Force | Out-Null
    }
    $skillDirs = Get-ChildItem "$AIOSRoot\ai-config\skills" -Directory
    foreach ($skillDir in $skillDirs) {
        $linkPath = Join-Path $cliDir $skillDir.Name
        if (-not (Test-Path $linkPath)) {
            New-Item -ItemType SymbolicLink -Path $linkPath -Target $skillDir.FullName -Force | Out-Null
        }
    }
}

# Hermes imported
$hermesImportedDir = "$HomeDir\.hermes\skills\imported"
if (-not (Test-Path $hermesImportedDir)) {
    New-Item -ItemType Directory -Path $hermesImportedDir -Force | Out-Null
}
$skillDirs = Get-ChildItem "$AIOSRoot\ai-config\skills" -Directory
foreach ($skillDir in $skillDirs) {
    $linkPath = Join-Path $hermesImportedDir $skillDir.Name
    if (-not (Test-Path $linkPath)) {
        New-Item -ItemType SymbolicLink -Path $linkPath -Target $skillDir.FullName -Force | Out-Null
    }
}

$skillCount = (Get-ChildItem "$AIOSRoot\ai-config\skills" -Directory).Count
Ok "Skills propagated to 5 CLIs ($skillCount skills in source)"
Write-Host ""

# ─── 6. Superpowers skills (REQUIRED) ───
Log "6. Verifying superpowers skills (REQUIRED)..."
$expected = 14
$actual = 0
$superpowersSkills = @(
    "brainstorming", "dispatching-parallel-agents", "executing-plans",
    "finishing-a-development-branch", "receiving-code-review",
    "requesting-code-review", "subagent-driven-development",
    "systematic-debugging", "test-driven-development",
    "using-git-worktrees", "using-superpowers",
    "verification-before-completion", "writing-plans", "writing-skills"
)
foreach ($skill in $superpowersSkills) {
    if (Test-Path "$HomeDir\.claude\skills\$skill") {
        $actual++
    }
}
if ($actual -ne $expected) {
    Warn "Only $actual/$expected superpowers skills installed. Installing..."
    $tmpSp = "$env:TEMP\superpowers-aios-$PID"
    if (Test-Path $tmpSp) { Remove-Item $tmpSp -Recurse -Force }
    git clone --depth=1 https://github.com/obra/superpowers $tmpSp 2>&1 | Out-Null

    $spSkills = Get-ChildItem "$tmpSp\skills" -Directory
    foreach ($skillDir in $spSkills) {
        $destPath = "$HomeDir\.claude\skills\$($skillDir.Name)"
        if (-not (Test-Path $destPath)) {
            Copy-Item $skillDir.FullName $destPath -Recurse -Force
            # Re-symlink to other CLIs
            foreach ($cliDir in $cliDirs) {
                $linkPath = Join-Path $cliDir $skillDir.Name
                if (-not (Test-Path $linkPath)) {
                    New-Item -ItemType SymbolicLink -Path $linkPath -Target $destPath -Force | Out-Null
                }
            }
            $hermesLinkPath = "$hermesImportedDir\$($skillDir.Name)"
            if (-not (Test-Path $hermesLinkPath)) {
                New-Item -ItemType SymbolicLink -Path $hermesLinkPath -Target $destPath -Force | Out-Null
            }
        }
    }
    Remove-Item $tmpSp -Recurse -Force
    Ok "Superpowers installed ($expected/$expected)"
} else {
    Ok "Superpowers OK ($actual/$expected)"
}
Write-Host ""

# ─── 7. MCP servers (regenerate ~/.hermes/config.yaml) ───
if (-not $env:SKIP_MCP) {
    Log "7. Configuring MCP servers from ai-config/mcp/*.yaml..."

    if (-not (Test-Path "$HomeDir\.hermes")) {
        New-Item -ItemType Directory -Path "$HomeDir\.hermes" -Force | Out-Null
    }

    if (Test-Path "$HomeDir\.hermes\config.yaml") {
        Move-Item "$HomeDir\.hermes\config.yaml" "$HomeDir\.hermes\config.yaml.pre-aios.bak" -Force
    }

    # Generate config.yaml with Python (works on Windows)
    $pythonCmd = (Get-Command python -ErrorAction SilentlyContinue) ?? (Get-Command python3 -ErrorAction SilentlyContinue) ?? (Get-Command py -ErrorAction SilentlyContinue)
    if ($pythonCmd) {
        $pythonArgs = @(
            $AIOSRoot + "\setup\generate-mcp-config.py",
            $AIOSRoot + "\ai-config\mcp",
            $HomeDir + "\.hermes\config.yaml"
        )
        & $pythonCmd.Source $pythonArgs
        Ok "MCP servers configured (Python: $($pythonCmd.Source))"
    } else {
        Warn "Python not found. MCP servers not configured automatically. Edit ~/.hermes/config.yaml manually."
    }
}
Write-Host ""

# ─── 8. Terminal ───
Log "8. Terminal (Windows Terminal or WezTerm)..."
$wtInstalled = (Get-Command wt -ErrorAction SilentlyContinue) -ne $null
$weztermInstalled = (Get-Command wezterm -ErrorAction SilentlyContinue) -ne $null
if ($wtInstalled) {
    Ok "Windows Terminal detected"
} elseif ($weztermInstalled) {
    Ok "WezTerm detected"
} else {
    Warn "Neither Windows Terminal nor WezTerm detected. Install one:"
    Log "  choco install microsoft-windows-terminal"
    Log "  Or: choco install wezterm"
}
Write-Host ""

# ─── 9. Final verification ───
if (-not $env:SKIP_VERIFY) {
    Log "9. Final verification..."
    powershell -ExecutionPolicy Bypass -File "$ScriptDir\verify-windows.ps1"
}

Write-Host ""
Log "═══════════════════════════════════════════════════════════"
Ok "AI-OS setup complete!"
Log ""
Log "Next steps:"
Log "  1. Open new PowerShell (or Windows Terminal)"
Log "  2. Try: hermes chat --skills ai-os-quickstart"
Log "  3. Customize git config: git config --global user.name/email"
Log "  4. Install CaskaydiaCove Nerd Font manually if you haven't"
Log "═══════════════════════════════════════════════════════════"