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
#   $env:SKIP_MEMORY = "1"     → skip memory stack (FalkorDB, Ollama, code indexers)
#   $env:SKIP_VERIFY = "1"     → skip verification tests at the end
#   $env:ASSUME_YES = "1"      → skip the preflight confirmation prompt
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
$Manifest = Join-Path $AIOSRoot "ai-config\manifest.yaml"
$AdapterTemplate = Join-Path $AIOSRoot "ai-config\templates\global-bridge.md.tmpl"
$LogPrefix = "[ai-os install]"

function Log($msg) { Write-Host "$LogPrefix $msg" }
function Ok($msg) { Write-Host "$LogPrefix ✅ $msg" }
function Warn($msg) { Write-Host "$LogPrefix ⚠️  $msg" -ForegroundColor Yellow }
function Err($msg) { Write-Host "$LogPrefix ❌ $msg" -ForegroundColor Red }
function Require-ManifestTool {
    if (-not (Get-Command yq -ErrorAction SilentlyContinue)) { throw "yq is required to read $Manifest" }
    if (-not (Test-Path $Manifest)) { throw "Manifest missing: $Manifest" }
}
function Preserve-OrReplace([string]$Target) {
    if ((Test-Path $Target) -and -not (Get-Item $Target -Force).Attributes.HasFlag([System.IO.FileAttributes]::ReparsePoint)) {
        if ($env:REPLACE_EXISTING -ne "1") {
            Warn "Preserving existing $Target (set REPLACE_EXISTING=1 to replace it)"
            return $false
        }
        Move-Item $Target "$Target.pre-aios.bak"
    }
    return $true
}
function New-DirLink([string]$LinkPath, [string]$TargetPath) {
    # Directory symlinks need Developer Mode or admin elevation on Windows.
    # Confirmed empirically (2026-07-30): SymbolicLink throws "Administrator
    # privilege required" on a non-elevated, non-Developer-Mode machine and
    # $ErrorActionPreference="Stop" would abort the ENTIRE install script on
    # the very first skill. NTFS junctions give the same transparent
    # directory redirection without any privilege, so fall back to one
    # silently when the symlink attempt fails.
    try {
        New-Item -ItemType SymbolicLink -Path $LinkPath -Target $TargetPath -Force -ErrorAction Stop | Out-Null
    }
    catch {
        New-Item -ItemType Junction -Path $LinkPath -Target $TargetPath -Force -ErrorAction Stop | Out-Null
    }
}
function New-FileLink([string]$LinkPath, [string]$TargetPath) {
    # Same privilege gap as New-DirLink, but for a single file: NTFS hard
    # links (same volume only, true here since both paths are under $HomeDir)
    # are the no-privilege fallback.
    try {
        New-Item -ItemType SymbolicLink -Path $LinkPath -Target $TargetPath -Force -ErrorAction Stop | Out-Null
    }
    catch {
        New-Item -ItemType HardLink -Path $LinkPath -Target $TargetPath -Force -ErrorAction Stop | Out-Null
    }
}

# ─── Chocolatey package list (single source: manifest + section 1) ───
$ChocoPackages = @(
    "git", "gh", "nodejs", "python311", "uv", "pwsh", "fzf", "ripgrep",
    "fd", "jq", "yq", "mkcert", "docker-desktop", "ollama", "golang",
    "vscode", "windsurf", "googlechrome", "firefox", "slack", "discord",
    "7zip", "notepadplusplus", "keepassxc", "postman", "tableplus",
    "warp"  # Warp has a Windows version
)

function Show-Manifest {
    Log "This will install / configure the following on your machine:"
    Write-Host ""
    Write-Host "  📦 Chocolatey packages ($($ChocoPackages.Count)):"
    Write-Host ("        " + ($ChocoPackages -join ", "))
    Write-Host ""
    Write-Host "  🧠 AI skills symlinked into every CLI"
    Write-Host "  🔌 MCP servers → ~/.hermes/config.yaml"
    Write-Host "  💾 Memory stack (Docker): FalkorDB, Ollama, code indexers"
    Write-Host "  🐚 PowerShell profile + dotfile symlinks"
    Write-Host "  📁 Instruction adapters for Claude, Codex, Gemini, Hermes, Antigravity"
    Write-Host "  🧩 VS Code (GitHub Copilot Chat) global instructions"
    Write-Host ""
    Log "Locations touched: choco install dir, `$HOME\.ai-os, `$HOME\.hermes,"
    Log "  `$HOME\.claude, `$HOME\.codex, `$HOME\.gemini, `$HOME\.agents, and `$HOME dotfiles."
    Write-Host ""
}

function Confirm-OrExit {
    # never block automation: honor ASSUME_YES, and auto-proceed when non-interactive
    if ($env:ASSUME_YES -eq "1") {
        Log "ASSUME_YES=1 — proceeding without prompt."
        return
    }
    if (-not [Environment]::UserInteractive -or [Console]::IsInputRedirected) {
        Log "Non-interactive shell — proceeding (set `$env:ASSUME_YES = '1' to silence this)."
        return
    }
    $reply = Read-Host "$LogPrefix Proceed with the installation above? [y/N]"
    if ($reply -notmatch '^(y|yes)$') {
        Log "Aborted — nothing was installed."
        exit 0
    }
    Write-Host ""
}

# ─── Header ───
Log "═══════════════════════════════════════════════════════════"
Log "  AI-OS Setup (Windows)"
Log "  Source: $AIOSRoot"
Log "  Target: $HomeDir"
Log "═══════════════════════════════════════════════════════════"
Write-Host ""

# ─── Preflight: show everything, then confirm ───
Show-Manifest
Confirm-OrExit

# ─── 0. Prereqs ───
Log "0. Verifying prerequisites..."

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Err "git not installed. Install Git for Windows: https://git-scm.com/download/win"
    exit 1
}
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Warn "chocolatey not installed (recommended for Windows)"
    Log "Install with: Set-ExecutionPolicy Bypass; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
}
else {
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

    foreach ($pkg in $ChocoPackages) {
        try {
            choco install -y $pkg --no-progress 2>&1 | Out-Null
            Ok "  $pkg"
        }
        catch {
            Warn "  $pkg failed: $_"
        }
    }
    Ok "Chocolatey packages installed"
}
else {
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
        # $PROFILE.CurrentUserAllHosts only resolves to THIS script's own host
        # (pwsh/PS7, since the null-coalescing operator used below requires
        # it). Windows PowerShell 5.1 (still the default in many VS Code
        # "PowerShell Extension" terminals when pwsh isn't on PATH yet) keeps
        # a separate profile under Documents\WindowsPowerShell\, which never
        # gets wired otherwise -- leaving that terminal without the PATH fix
        # below (nvm4w's %NVM_HOME%/%NVM_SYMLINK% expansion) or any AI-OS
        # customization at all. Wire both.
        $profileTargets = @(
            $PROFILE.CurrentUserAllHosts,
            (Join-Path $HomeDir "Documents\WindowsPowerShell\profile.ps1")
        ) | Select-Object -Unique
        foreach ($profilePath in $profileTargets) {
            $profileDir = Split-Path -Parent $profilePath
            if (-not (Test-Path $profileDir)) {
                New-Item -ItemType Directory -Path $profileDir -Force | Out-Null
            }
            if ((Test-Path $profilePath) -and -not (Get-Item $profilePath -Force).Attributes.HasFlag([System.IO.FileAttributes]::ReparsePoint)) {
                Move-Item $profilePath "$profilePath.pre-aios.bak" -Force
            }
            New-FileLink -LinkPath $profilePath -TargetPath "$AIOSRoot\dev-env\dotfiles\powershell\Microsoft.PowerShell_profile.ps1"
        }
        Ok "  PowerShell profile → ai-os (pwsh + Windows PowerShell 5.1)"
    }

    # Git config
    if (Test-Path "$AIOSRoot\dev-env\dotfiles\git\.gitconfig.template") {
        if (-not (Test-Path "$HomeDir\.gitconfig")) {
            Copy-Item "$AIOSRoot\dev-env\dotfiles\git\.gitconfig.template" "$HomeDir\.gitconfig"
            Ok "  .gitconfig → template (customize: git config --global user.name/email)"
        }
        else {
            Ok "  .gitconfig already exists, not overwriting"
        }
    }

    # Git ignore global
    if (Test-Path "$AIOSRoot\dev-env\dotfiles\git\.gitignore_global") {
        if (Test-Path "$HomeDir\.gitignore_global") {
            Move-Item "$HomeDir\.gitignore_global" "$HomeDir\.gitignore_global.pre-aios.bak" -Force
        }
        New-FileLink -LinkPath "$HomeDir\.gitignore_global" -TargetPath "$AIOSRoot\dev-env\dotfiles\git\.gitignore_global"
        git config --global core.excludesfile "$HomeDir\.gitignore_global" 2>&1 | Out-Null
        Ok "  .gitignore_global → ai-os"
    }

    # SSH config: copy only if missing. Unlike most AI-OS-managed dotfiles,
    # this one is expected to be hand-customized per user right after install
    # (real IdentityFile paths, extra Host blocks) -- unconditionally
    # overwriting it on every re-run silently destroyed that customization
    # (observed: reverted a fixed IdentityFile back to the template's
    # placeholder path, breaking `git push` over SSH). Same "copy once, never
    # clobber" behavior as .gitconfig above.
    if (Test-Path "$AIOSRoot\dev-env\dotfiles\ssh\config") {
        $sshDir = "$HomeDir\.ssh"
        if (-not (Test-Path $sshDir)) {
            New-Item -ItemType Directory -Path $sshDir -Force | Out-Null
        }
        if (-not (Test-Path "$sshDir\config")) {
            Copy-Item "$AIOSRoot\dev-env\dotfiles\ssh\config" "$sshDir\config"
            Ok "  .ssh/config → template (customize IdentityFile for your real key(s))"
        }
        else {
            Ok "  .ssh/config already exists, not overwriting"
        }
    }

    # Git Bash NVM PATH fix: nvm-windows (nvm4w) stores its PATH entries as
    # self-referencing %NVM_HOME%/%NVM_SYMLINK% placeholders (REG_EXPAND_SZ).
    # Native Windows shells (cmd, PowerShell) expand these when a NEW process
    # environment is built, but Git Bash / MSYS2 does not -- it copies the
    # literal, unexpanded text into $PATH, which silently breaks node/npm/pnpm
    # resolution in every Git Bash terminal. Append an idempotent, self-guarding
    # fix to ~/.bashrc (skipped entirely on machines without nvm4w). Must
    # convert through `cygpath -u`: appending the raw Windows backslash paths
    # (e.g. C:\nvm4w\nodejs) corrupts bash's colon-separated PATH, because the
    # drive-letter colon (C:) gets misparsed as a PATH separator -- this in
    # turn breaks POSIX shim scripts like pnpm's, which mis-resolve their own
    # location (observed: pnpm.cjs resolved under "C:\Program Files\Git\..."
    # instead of "C:\nvm4w\...").
    $bashrcPath = Join-Path $HomeDir ".bashrc"
    $nvmFixMarker = "AI-OS NVM PATH FIX"
    $bashExists = Get-Command bash -ErrorAction SilentlyContinue
    if ($bashExists) {
        $bashrcHasMarker = (Test-Path $bashrcPath) -and (Select-String -Path $bashrcPath -SimpleMatch $nvmFixMarker -Quiet)
        if (-not $bashrcHasMarker) {
            $nvmFixBlock = @"

# $nvmFixMarker -- see setup/install-windows.ps1 for the full explanation.
# Safe no-op on machines without nvm-windows (nvm4w).
if [ -n "`$NVM_HOME" ] && [ -n "`$NVM_SYMLINK" ]; then
  export PATH="`$PATH:`$(cygpath -u "`$NVM_HOME" 2>/dev/null):`$(cygpath -u "`$NVM_SYMLINK" 2>/dev/null)"
fi
"@
            Add-Content -Path $bashrcPath -Value $nvmFixBlock
            Ok "  ~/.bashrc  nvm4w PATH fix for Git Bash"
        }
        else {
            Ok "  ~/.bashrc already has the nvm4w PATH fix"
        }
    }
}
else {
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
$customProfileDir = Split-Path -Parent $customProfile
if (-not (Test-Path $customProfileDir)) {
    New-Item -ItemType Directory -Path $customProfileDir -Force | Out-Null
}
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
}
else {
    Ok "PowerShell custom profile already exists"
}
Write-Host ""

# ─── 5. Global skills (native destinations from manifest) ───
Require-ManifestTool
Log "5. Setting global skills in native client destinations..."
$skillClients = (& yq -o=json '.platforms.windows.skills.clients' $Manifest | ConvertFrom-Json)
$cliDirs = @($skillClients | ForEach-Object { Join-Path $HomeDir $_.path })

foreach ($cliDir in $cliDirs) {
    if (-not (Test-Path $cliDir)) {
        New-Item -ItemType Directory -Path $cliDir -Force | Out-Null
    }
    $skillDirs = Get-ChildItem "$AIOSRoot\ai-config\skills" -Directory | Where-Object {
        Test-Path (Join-Path $_.FullName "SKILL.md")
    }
    foreach ($skillDir in $skillDirs) {
        $linkPath = Join-Path $cliDir $skillDir.Name
        if ((-not (Test-Path $linkPath)) -or (Preserve-OrReplace $linkPath)) {
            New-DirLink -LinkPath $linkPath -TargetPath $skillDir.FullName
        }
    }
}

$skillCount = (Get-ChildItem "$AIOSRoot\ai-config\skills" -Directory | Where-Object {
        Test-Path (Join-Path $_.FullName "SKILL.md")
    }).Count
Ok "Flat skills propagated to manifest client destinations ($skillCount skills in source)"
Write-Host ""

# ─── 5c. Vendored gstack skills (read-only subtree at vendor/gstack/) ───
# Mirrors setup/install-mac.sh step 7c: propagates the gstack-vendored skills
# (spec, context-save, context-restore) to the same CLI destinations as the
# flat skills above. Without this step, verify-windows.ps1 reports them as
# permanently missing since install-windows.ps1 never linked them.
$gstackDir = Join-Path $AIOSRoot "vendor\gstack"
if (Test-Path $gstackDir) {
    Log "5c. Setting vendored gstack skills in native client destinations..."
    $gstackSkillDirs = Get-ChildItem $gstackDir -Directory | Where-Object {
        Test-Path (Join-Path $_.FullName "SKILL.md")
    }
    foreach ($cliDir in $cliDirs) {
        if (-not (Test-Path $cliDir)) {
            New-Item -ItemType Directory -Path $cliDir -Force | Out-Null
        }
        foreach ($skillDir in $gstackSkillDirs) {
            $linkPath = Join-Path $cliDir $skillDir.Name
            if ((-not (Test-Path $linkPath)) -or (Preserve-OrReplace $linkPath)) {
                New-DirLink -LinkPath $linkPath -TargetPath $skillDir.FullName
            }
        }
    }
    Ok "Vendored gstack skills propagated ($($gstackSkillDirs.Count) skills in source)"
}
else {
    Log "5c. vendor/gstack/ absent, skipping"
}
Write-Host ""

# ─── 5d. Global commands (source of truth: ai-config/commands) ───
# Mirrors the skills flow (step 5) for slash-command-style combos (/action,
# /full, /gen-html, ...) that don't fit the Agent Skills model as a distinct
# artifact everywhere: Claude Code/Codex/Antigravity/Hermes already get these
# via ai-config/skills/{action,full,gen-html} (step 5 above — Skills ARE
# commands there). This step covers the two client types that need a
# separate, differently-formatted command file: VS Code Copilot Chat's global
# prompts folder (*.prompt.md, same Markdown+frontmatter source verbatim) and
# Gemini CLI's custom commands (TOML only, per
# https://google-gemini.github.io/gemini-cli/docs/cli/custom-commands.html —
# confirmed 2026-07-30, no SKILL.md-based custom-command support documented).
Log "5d. Distributing global commands (VS Code prompts + Gemini TOML)..."
$commandsDir = Join-Path $AIOSRoot "ai-config\commands"
$commandFiles = Get-ChildItem $commandsDir -Filter "*.md" -ErrorAction SilentlyContinue | Where-Object { $_.Name -ne "README.md" }
if ($commandFiles) {
    # VS Code Copilot Chat: global prompts folder, verbatim copy as *.prompt.md
    $vscodePrompts = Join-Path $env:APPDATA "Code\User\prompts"
    New-Item -ItemType Directory -Path $vscodePrompts -Force | Out-Null
    foreach ($cmd in $commandFiles) {
        Copy-Item $cmd.FullName (Join-Path $vscodePrompts ($cmd.BaseName + ".prompt.md")) -Force
    }
    Ok "  VS Code prompts: $($commandFiles.Count) command(s) -> $vscodePrompts"

    # Gemini CLI: TOML custom commands, generated from the same Markdown source
    $geminiCommands = Join-Path $HomeDir ".gemini\commands"
    New-Item -ItemType Directory -Path $geminiCommands -Force | Out-Null
    foreach ($cmd in $commandFiles) {
        $raw = Get-Content $cmd.FullName -Raw
        $frontmatter = ""
        $body = $raw
        if ($raw -match '(?s)^---\r?\n(.*?)\r?\n---\r?\n(.*)$') {
            $frontmatter = $Matches[1]
            $body = $Matches[2].Trim()
        }
        $desc = ""
        if ($frontmatter -match 'description:\s*(.+)') { $desc = $Matches[1].Trim() }
        $descEscaped = $desc -replace '"', '\"'
        $tomlLines = @()
        $tomlLines += "description = `"$descEscaped`""
        $tomlLines += 'prompt = """'
        $tomlLines += $body
        $tomlLines += '"""'
        Set-Content -Path (Join-Path $geminiCommands ($cmd.BaseName + ".toml")) -Value ($tomlLines -join "`n") -Encoding utf8
    }
    Ok "  Gemini TOML commands: $($commandFiles.Count) command(s) -> $geminiCommands"
}
else {
    Warn "  ai-config/commands/ empty or missing, skipping"
}
Write-Host ""

# ─── 5b. Rendered instruction adapters ───
Log "5b. Rendering path-neutral instruction adapters..."
if (-not (Test-Path $AdapterTemplate)) { throw "Adapter template missing: $AdapterTemplate" }
$adapterDir = Join-Path $HomeDir ".ai-os\adapters"
New-Item -ItemType Directory -Path $adapterDir -Force | Out-Null
$bridge = Join-Path $adapterDir "global-bridge.md"
(Get-Content $AdapterTemplate -Raw).Replace("{{AI_OS_ROOT}}", $AIOSRoot) | Set-Content -Path $bridge -NoNewline
$adapters = (& yq -o=json '.platforms.windows.adapters' $Manifest | ConvertFrom-Json)
foreach ($adapter in $adapters) {
    $target = Join-Path $HomeDir $adapter.path
    New-Item -ItemType Directory -Path (Split-Path -Parent $target) -Force | Out-Null
    if (Preserve-OrReplace $target) {
        New-FileLink -LinkPath $target -TargetPath $bridge
    }
}
Ok "Required instruction adapters rendered from manifest"
Write-Host ""

# ─── 5e. VS Code (GitHub Copilot Chat) ───
# Mirrors setup/install-mac.sh's VS Code wiring step. Copilot Chat already
# discovers ~/.agents/skills on this box by whatever mechanism backs its
# custom chat mode, so no skill-symlink step is needed here. It only needs
# the bridge block, appended (idempotent) to its global custom-instructions
# file — the `applyTo: '**'` frontmatter makes it load on every request in
# every workspace, same role as CLAUDE.md/AGENTS.md/GEMINI.md for the other
# CLIs. The file lives under a per-account subfolder we can't predict, so
# glob for it; best-effort, never fails the install if VS Code / Copilot
# Chat isn't set up on this box.
# WIRE_VSCODE defaults to on (this is the whole point of a post-install
# step: every enabled IDE/CLI gets the same bridge automatically, with no
# extra flags). Set $env:WIRE_VSCODE = "0" to opt out.
Log "5e. Wiring VS Code (GitHub Copilot Chat) global instructions..."
$vscodeGlobs = @(
    (Join-Path $HomeDir "AppData\Roaming\Code\User\globalStorage\github.copilot-chat\github"),
    (Join-Path $HomeDir "AppData\Roaming\Code - Insiders\User\globalStorage\github.copilot-chat\github")
)
$vscodeBridgeBlock = @"

<!-- AI-OS BRIDGE -- managed by $AIOSRoot; remove this block to unlink -->
- AI-OS (operating context): single source of truth is ``$AIOSRoot``. For non-trivial work, read ``context/00_profile.md``, ``context/03_preferences.md``, and ``CLAUDE.md`` from that repo before proceeding.
- Method: Spec -> Verifier -> Environment (Karpathy loop). Use the ``using-superpowers`` skill as the router for EVERY task, even simple ones -- check whether a skill applies before responding, not just for domain-specific work.
- Chat in Spanish (lowercase, terse, no ceremony, no "espero que esto ayude"). Code, commits, docs, comments, and logs stay in English always.
- Verify before claiming something is done: run the actual checks (tests/build/typecheck/browser) and report concrete evidence, never "looks fine" without proof.
- Confirm before irreversible or outward-facing actions (force-push, prod changes, sending messages, spending money) unless already explicitly authorized.
- Durable, cross-session facts go in this environment's own memory tool (``/memories/``); sync notable, cross-CLI-relevant facts back into ``context/`` in the ai-os repo so Claude Code/Hermes/Codex/Gemini benefit too.
<!-- /AI-OS BRIDGE -->
"@
$vscodeWired = 0
foreach ($ghDir in $vscodeGlobs) {
    if (-not (Test-Path $ghDir)) { continue }
    Get-ChildItem $ghDir -Directory -ErrorAction SilentlyContinue | ForEach-Object {
        $instrFile = Join-Path $_.FullName "instructions\default.instructions.md"
        if (-not (Test-Path $instrFile)) { return }
        if ($env:WIRE_VSCODE -ne "0") {
            $existing = Get-Content $instrFile -Raw -ErrorAction SilentlyContinue
            if ($existing -notmatch "AI-OS BRIDGE") {
                Add-Content -Path $instrFile -Value $vscodeBridgeBlock -NoNewline
            }
        }
        $script:vscodeWired++
    }
}
if ($vscodeWired -gt 0) {
    Ok "VS Code Copilot Chat instructions wired ($vscodeWired file(s))"
}
else {
    Warn "VS Code Copilot Chat adapter skipped (VS Code / Copilot Chat not found on this box)"
}
Write-Host ""

# ─── 6. Superpowers skills (REQUIRED) ───
Log "6. Verifying superpowers skills (REQUIRED)..."
$superpowersSkills = @(& yq -r '.required_skills[]' $Manifest)
$expected = $superpowersSkills.Count
$actual = 0
foreach ($skill in $superpowersSkills) {
    if (Test-Path "$HomeDir\.claude\skills\$skill") {
        $actual++
    }
}
if ($actual -ne $expected) {
    foreach ($skill in $superpowersSkills) {
        $source = Join-Path $AIOSRoot "ai-config\skills\$skill"
        if (-not (Test-Path $source)) { throw "Required skill missing from source: $skill" }
        foreach ($cliDir in $cliDirs) {
            $linkPath = Join-Path $cliDir $skill
            if (-not (Test-Path $linkPath)) { New-DirLink -LinkPath $linkPath -TargetPath $source }
        }
    }
    Ok "Required skills linked from local source ($expected/$expected)"
}
else {
    Ok "Superpowers OK ($actual/$expected)"
}
Write-Host ""

# ─── 7. MCP servers (regenerate ~/.hermes/config.yaml) ───
if (-not $env:SKIP_MCP) {
    Log "7. Configuring MCP servers from ai-config/mcp/*.yaml..."

    # generate-mcp-config.py needs PyYAML; sync-ide-mcp-servers.py (step 7c)
    # additionally needs tomlkit for Codex's config.toml. Neither ships with a
    # base Python install, and install-windows.ps1 has no separate "Python
    # packages" step (unlike install-mac.sh's uv venv) -- ensure both here,
    # once, against whichever interpreter we find, quietly (no-op if already
    # present).
    $pythonCmd = (Get-Command python -ErrorAction SilentlyContinue) ?? (Get-Command python3 -ErrorAction SilentlyContinue) ?? (Get-Command py -ErrorAction SilentlyContinue)
    if ($pythonCmd) {
        & $pythonCmd.Source -m pip install --quiet --disable-pip-version-check pyyaml tomlkit 2>&1 | Out-Null
    }

    if (-not (Test-Path "$HomeDir\.hermes")) {
        New-Item -ItemType Directory -Path "$HomeDir\.hermes" -Force | Out-Null
    }

    if (Test-Path "$HomeDir\.hermes\config.yaml") {
        Move-Item "$HomeDir\.hermes\config.yaml" "$HomeDir\.hermes\config.yaml.pre-aios.bak" -Force
    }

    # Generate config.yaml with Python (works on Windows)
    if ($pythonCmd) {
        # 3rd arg registers ~/.agents/skills under skills.external_dirs so Hermes
        # reads it natively instead of a symlinked copy under
        # ~/.hermes/skills/imported/ (P1-2; confirmed against
        # https://hermes-agent.nousresearch.com/docs/user-guide/features/skills).
        $pythonArgs = @(
            ($AIOSRoot + "\setup\generate-mcp-config.py"),
            ($AIOSRoot + "\ai-config\mcp"),
            ($HomeDir + "\.hermes\config.yaml"),
            ($HomeDir + "\.agents\skills")
        )
        & $pythonCmd.Source @pythonArgs
        if ($LASTEXITCODE -eq 0) {
            Ok "MCP servers + skills.external_dirs configured (Python: $($pythonCmd.Source))"
        }
        else {
            Warn "generate-mcp-config.py exited with code $LASTEXITCODE; check ~/.hermes/config.yaml manually"
        }
    }
    else {
        Warn "Python not found. MCP servers not configured automatically. Edit ~/.hermes/config.yaml manually."
    }
}
Write-Host ""

# \u2500\u2500\u2500 7a2. Clean up the superseded Hermes symlink tree (P1-2) \u2500\u2500\u2500
# Hermes now reads ~/.agents/skills via skills.external_dirs instead of getting
# a symlinked copy under ~/.hermes/skills/imported/. Remove that old tree, but
# only if AI-OS made it (every entry is still a symlink/reparse point into
# ai-config/skills) \u2014 never touch real user content.
$oldHermesImported = "$HomeDir\.hermes\skills\imported"
if (Test-Path $oldHermesImported) {
    $safeToRemove = $true
    Get-ChildItem $oldHermesImported -Force -ErrorAction SilentlyContinue | ForEach-Object {
        if (-not $_.Attributes.HasFlag([System.IO.FileAttributes]::ReparsePoint)) {
            $safeToRemove = $false
        }
    }
    if ($safeToRemove) {
        Remove-Item $oldHermesImported -Recurse -Force
        Ok "Removed superseded ~/.hermes/skills/imported/ (Hermes now reads ~/.agents/skills directly)"
    }
    else {
        Warn "~/.hermes/skills/imported/ contains non-AI-OS content; leaving it in place (Hermes also reads ~/.agents/skills now, so skills may appear twice)"
    }
}
Write-Host ""

# ─── 7c. IDE/CLI MCP servers (VS Code, Codex, Claude Code, Gemini) ───
# generate-mcp-config.py above only wires Hermes (~/.hermes/config.yaml).
# Every other AI client reads its OWN MCP config format/location -- without
# this step, tools like grepai/codebase-memory-mcp only ever get consulted by
# Hermes, never by whatever the user is actually chatting in day to day (VS
# Code Copilot Chat, Claude Code, Codex, Gemini CLI). Merge-preserving: only
# ADDS a server whose name doesn't already exist in that client's config --
# never overwrites (confirmed real case: this machine's own VS Code
# "filesystem" server already pointed at different directories than AI-OS's).
# Skips a target entirely if that client isn't installed (its config dir
# doesn't exist) rather than speculatively creating one.
if (-not $env:SKIP_MCP) {
    Log "7c. Wiring MCP servers into installed IDEs/CLIs..."
    $pythonCmd = (Get-Command python -ErrorAction SilentlyContinue) ?? (Get-Command python3 -ErrorAction SilentlyContinue) ?? (Get-Command py -ErrorAction SilentlyContinue)
    if ($pythonCmd) {
        $syncArgs = @(($AIOSRoot + "\setup\sync-ide-mcp-servers.py"), ($AIOSRoot + "\ai-config\mcp"))
        $vscodeMcp = Join-Path $env:APPDATA "Code\User\mcp.json"
        $vscodeInsidersMcp = Join-Path $env:APPDATA "Code - Insiders\User\mcp.json"
        if (Test-Path (Split-Path -Parent $vscodeMcp)) { $syncArgs += @("--vscode", $vscodeMcp) }
        if (Test-Path (Split-Path -Parent $vscodeInsidersMcp)) { $syncArgs += @("--vscode-insiders", $vscodeInsidersMcp) }
        if (Test-Path "$HomeDir\.codex") { $syncArgs += @("--codex", "$HomeDir\.codex\config.toml") }
        if (Test-Path "$HomeDir\.claude.json") { $syncArgs += @("--claude", "$HomeDir\.claude.json") }
        if (Test-Path "$HomeDir\.gemini") { $syncArgs += @("--gemini", "$HomeDir\.gemini\settings.json") }
        if ($syncArgs.Count -gt 2) {
            & $pythonCmd.Source @syncArgs
            if ($LASTEXITCODE -ne 0) {
                Warn "sync-ide-mcp-servers.py exited with code $LASTEXITCODE; check the IDE/CLI configs manually"
            }
        }
        else {
            Log "  No known IDE/CLI config directories found -- nothing to wire"
        }
    }
    else {
        Warn "Python not found. IDE/CLI MCP servers not configured automatically."
    }
}
else {
    Log "7c. SKIP_MCP=1, skipping IDE/CLI MCP server sync"
}
Write-Host ""

# ─── 7b. Memory stack (FalkorDB + Ollama + code indexers, cross-platform parity with Mac) ───
# Pinned versions are kept in sync with setup/install-mac.sh (P1-4): bump both
# together, deliberately, not via @latest.
if ($env:SKIP_MEMORY -ne "1") {
    Log "7b. Setting up AI-OS memory stack (FalkorDB, Ollama, code indexers)..."

    # 7b.1 — Ollama: Docker by default on Windows. `choco install ollama`
    # needs admin rights and was unreliable without them (P1 remediation);
    # Docker Desktop is already required for FalkorDB below, so this reuses
    # the same daemon with no extra elevation step. Set $env:OLLAMA_NATIVE =
    # "1" to prefer a native install instead (e.g. for direct GPU passthrough
    # without the WSL2 container layer). The actual container start happens
    # together with FalkorDB in 7b.2 (same docker-compose.yml, opt-in
    # "ollama-docker" profile) so both come up/down as one unit.
    $useDockerOllama = $false
    if ($env:OLLAMA_NATIVE -eq "1" -and (Get-Command ollama -ErrorAction SilentlyContinue)) {
        $ollamaRunning = Get-Process -Name "ollama" -ErrorAction SilentlyContinue
        if (-not $ollamaRunning) {
            $env:OLLAMA_HOST = "127.0.0.1:11500"
            Start-Process -FilePath "ollama" -ArgumentList "serve" -WindowStyle Hidden -RedirectStandardOutput "$HomeDir\.ollama.log" -RedirectStandardError "$HomeDir\.ollama.log"
            Start-Sleep -Seconds 3
            Ok "  Ollama (native) launched on 127.0.0.1:11500 (background, logs: ~/.ollama.log)"
        }
        else {
            Ok "  Ollama (native) already running"
        }
        $env:OLLAMA_HOST = "127.0.0.1:11500"
        try {
            & ollama pull nomic-embed-text 2>&1 | Select-Object -Last 3
            if ($LASTEXITCODE -ne 0) { throw "ollama pull exited with code $LASTEXITCODE" }
            Ok "  nomic-embed-text ready"
        }
        catch {
            Warn "  ollama pull failed (will retry on first use)"
        }
    }
    elseif (Get-Command docker -ErrorAction SilentlyContinue) {
        $useDockerOllama = $true
        Log "  Ollama will run in Docker (127.0.0.1:11500) -- set `$env:OLLAMA_NATIVE = '1' to use a native install instead"
    }
    else {
        Warn "  Neither native ollama nor Docker available -- embedding features disabled"
    }

    # 7b.2 — FalkorDB graph DB (+ Ollama container if chosen in 7b.1)
    if (Get-Command docker -ErrorAction SilentlyContinue) {
        Push-Location "$AIOSRoot\memory\falkordb"
        try {
            if (-not (Test-Path "data")) { New-Item -ItemType Directory -Path "data" | Out-Null }
            if (-not (Test-Path "ollama-data")) { New-Item -ItemType Directory -Path "ollama-data" | Out-Null }
            $composeArgs = @("up", "-d")
            if ($useDockerOllama) { $composeArgs = @("--profile", "ollama-docker") + $composeArgs }
            docker compose @composeArgs 2>&1 | Select-Object -Last 5
            if ($LASTEXITCODE -ne 0) { throw "docker compose up exited with code $LASTEXITCODE" }
            Ok "  FalkorDB launched: redis://localhost:6390 + Web UI http://localhost:3300 (image: falkordb/falkordb:v4.18.11, pinned)"
            if ($useDockerOllama) {
                Ok "  Ollama container launched: http://localhost:11500 (image: ollama/ollama:0.6.8, pinned)"
                try {
                    docker exec ia-os-ollama ollama pull nomic-embed-text 2>&1 | Select-Object -Last 3
                    if ($LASTEXITCODE -ne 0) { throw "pull failed" }
                    Ok "  nomic-embed-text ready (in container)"
                }
                catch {
                    Warn "  nomic-embed-text pull failed (will retry on first use): docker exec ia-os-ollama ollama pull nomic-embed-text"
                }
            }
        }
        catch {
            Warn "  docker compose up failed (run manually: cd $AIOSRoot\memory\falkordb; docker compose up -d)"
        }
        finally {
            Pop-Location
        }
    }
    else {
        Warn "  docker not installed/running (FalkorDB disabled; choco install docker-desktop)"
    }

    # 7b.3 — Static binary download (codebase-memory-mcp), sha256-verified against
    # the checksums.txt published for the SAME pinned release tag (P1-4).
    $localBin = "$HomeDir\.local\bin"
    New-Item -ItemType Directory -Path $localBin -Force | Out-Null
    $cbmVersion = "v0.8.1"  # pinned: last release with assets — bump deliberately, keep in sync with install-mac.sh
    $cbmAsset = "codebase-memory-mcp-windows-amd64.zip"
    $cbmUrl = "https://github.com/deusdata/codebase-memory-mcp/releases/download/$cbmVersion/$cbmAsset"
    $cbmSumsUrl = "https://github.com/deusdata/codebase-memory-mcp/releases/download/$cbmVersion/checksums.txt"
    $cbmExe = "$localBin\codebase-memory-mcp.exe"
    if (-not (Test-Path $cbmExe)) {
        $tmpZip = New-TemporaryFile
        $tmpSums = New-TemporaryFile
        try {
            Invoke-WebRequest -Uri $cbmUrl -OutFile $tmpZip -UseBasicParsing
            Invoke-WebRequest -Uri $cbmSumsUrl -OutFile $tmpSums -UseBasicParsing
            $expectedLine = (Get-Content $tmpSums | Where-Object { $_ -match [regex]::Escape($cbmAsset) })
            $expectedSum = ($expectedLine -split '\s+')[0]
            $actualSum = (Get-FileHash -Path $tmpZip -Algorithm SHA256).Hash.ToLower()
            if ($expectedSum -and ($expectedSum -eq $actualSum)) {
                Expand-Archive -Path $tmpZip -DestinationPath $localBin -Force
                Ok "  codebase-memory-mcp binary installed at ~/.local/bin/ (from $cbmAsset, sha256 verified)"
            }
            else {
                Err "  codebase-memory-mcp checksum verification failed for $cbmAsset — refusing to install (expected $expectedSum, got $actualSum)"
            }
        }
        catch {
            Warn "  codebase-memory-mcp download failed: $_"
            Warn "  install manually from https://github.com/deusdata/codebase-memory-mcp/releases"
        }
        finally {
            Remove-Item $tmpZip, $tmpSums -ErrorAction SilentlyContinue
        }
    }
    else {
        Ok "  codebase-memory-mcp already installed"
    }

    # 7b.4 — grepai via go install (pinned tag, not @latest — P1-4, kept in sync with install-mac.sh)
    $grepaiVersion = "v0.35.0"
    if (Get-Command go -ErrorAction SilentlyContinue) {
        try {
            & go install "github.com/yoanbernabeu/grepai/cmd/grepai@$grepaiVersion" 2>&1 | Select-Object -Last 2
            if ($LASTEXITCODE -ne 0) { throw "go install exited with code $LASTEXITCODE" }
            $goBinGrepai = "$HomeDir\go\bin\grepai.exe"
            if (Test-Path $goBinGrepai) {
                Copy-Item $goBinGrepai "$localBin\grepai.exe" -Force
            }
            Ok "  grepai $grepaiVersion installed via go install"
        }
        catch {
            Warn "  go install grepai failed (will retry on first use)"
        }
    }
    else {
        Warn "  go not installed (grepai skipped; install: choco install golang)"
    }
}
else {
    Log "7b. SKIP_MEMORY=1, skipping memory stack"
}
Write-Host ""

# ─── 7d. Ponytail — lazy senior dev ruleset (portable: mac/linux/win) ───
# Mirrors setup/install-mac.sh section 9c. DietrichGebert/ponytail v4.9.0 (MIT).
# Default `full` (env-override via $env:PONYTAIL_DEFAULT_MODE). Idempotent, never
# aborts the whole install — worst case is AGENTS.md fallback (which most hosts
# already read). keep in sync with install-mac.sh PONYTAIL_VERSION.
if (-not $env:SKIP_PONYTAIL) {
    $ponytailVersion = if ($env:PONYTAIL_VERSION) { $env:PONYTAIL_VERSION } else { "4.9.0" }
    $ponytailDefault = if ($env:PONYTAIL_DEFAULT_MODE) { $env:PONYTAIL_DEFAULT_MODE } else { "full" }
    Log "7d. Ponytail $ponytailVersion (default: $ponytailDefault) — DietrichGebert/ponytail..."

    # 7d.1 — per-machine config (%APPDATA%\ponytail\config.json on win, ~/.config/... on git-bash)
    $ponytailCfgDir = Join-Path $HomeDir ".config\ponytail"
    if ($env:APPDATA) { $ponytailCfgDir = Join-Path $env:APPDATA "ponytail" }
    $ponytailCfg = Join-Path $ponytailCfgDir "config.json"
    if (-not (Test-Path $ponytailCfgDir)) { New-Item -ItemType Directory -Path $ponytailCfgDir -Force | Out-Null }
    if (-not (Test-Path $ponytailCfg)) {
        @{ defaultMode = $ponytailDefault } | ConvertTo-Json | Set-Content -Path $ponytailCfg -Encoding utf8
        Ok "  ponytail config: $ponytailCfg (defaultMode=$ponytailDefault)"
    } else {
        try {
            $cfg = Get-Content $ponytailCfg -Raw | ConvertFrom-Json
            if (-not $cfg.PSObject.Properties['defaultMode']) {
                $cfg | Add-Member -NotePropertyName defaultMode -NotePropertyValue $ponytailDefault -Force
                $cfg | ConvertTo-Json | Set-Content -Path $ponytailCfg -Encoding utf8
                Ok "  ponytail config: merged defaultMode=$ponytailDefault into $ponytailCfg"
            } else { Ok "  ponytail config already present: $ponytailCfg" }
        } catch { Warn "  ponytail config exists at $ponytailCfg but is not valid JSON — fix manually" }
    }
    $env:PONYTAIL_DEFAULT_MODE = $ponytailDefault

    # 7d.2 — ponytail source cache (git clone --depth 1 --branch vX.Y.Z)
    $ponytailVendor = Join-Path $AIOSRoot "vendor\ponytail"
    $ponytailCache = Join-Path $HomeDir ".cache\ai-os\ponytail"
    $ponytailSrc = $null
    if ((Test-Path (Join-Path $ponytailVendor ".git")) -and (Test-Path (Join-Path $ponytailVendor "AGENTS.md"))) {
        $ponytailSrc = $ponytailVendor; Ok "  ponytail source: vendored $ponytailSrc"
    } else {
        if (Test-Path (Join-Path $ponytailCache ".git")) {
            try { Push-Location $ponytailCache; & git fetch --tags --quiet 2>$null; & git checkout -q "v$ponytailVersion" 2>$null; Pop-Location } catch {} finally { if ((Get-Location).Path -eq $ponytailCache) { Pop-Location } }
        } elseif (Get-Command git -ErrorAction SilentlyContinue) {
            New-Item -ItemType Directory -Path (Split-Path -Parent $ponytailCache) -Force | Out-Null
            try { & git clone --depth 1 --branch "v$ponytailVersion" https://github.com/DietrichGebert/ponytail.git $ponytailCache 2>$null; Ok "  ponytail cache cloned: $ponytailCache @ v$ponytailVersion" } catch { Warn "  ponytail clone failed (offline?) — fallback to AGENTS.md-less mode" }
        }
        if (Test-Path (Join-Path $ponytailCache "AGENTS.md")) { $ponytailSrc = $ponytailCache; Ok "  ponytail source: cache $ponytailSrc" }
    }

    # 7d.3 — host plugins (best-effort)
    if (Get-Command claude -ErrorAction SilentlyContinue) {
        try { if (& claude plugin list 2>$null | Select-String "ponytail") { Ok "  Claude Code: ponytail plugin already installed" } else { & claude plugin marketplace add DietrichGebert/ponytail 2>$null | Out-Null; & claude plugin add "ponytail@ponytail" 2>$null; Ok "  Claude Code: ponytail plugin installed (run /hooks and trust)" } } catch { Warn "  Claude Code: ponytail plugin add failed — AGENTS.md fallback will still apply" }
    } else { Log "  Claude Code not detected — skipping claude plugin" }
    if (Get-Command codex -ErrorAction SilentlyContinue) {
        try { if (& codex plugin list 2>$null | Select-String "ponytail") { Ok "  Codex: ponytail plugin already installed" } else { & codex plugin marketplace add DietrichGebert/ponytail 2>$null | Out-Null; & codex plugin add "ponytail@ponytail" 2>$null; Ok "  Codex: ponytail plugin installed" } } catch { Warn "  Codex: ponytail plugin add failed — AGENTS.md fallback still applies" }
    }
    if (Get-Command hermes -ErrorAction SilentlyContinue) {
        try { if (& hermes plugins list 2>$null | Select-String -Pattern "ponytail" -CaseSensitive:$false) { Ok "  Hermes: ponytail plugin already installed" } else { & hermes plugins install DietrichGebert/ponytail --enable 2>$null | Out-Null; Ok "  Hermes: ponytail plugin installed (restart Hermes)" } } catch { Warn "  Hermes: ponytail plugin install failed — AGENTS fallback still applies" }
    }
    if (Get-Command gemini -ErrorAction SilentlyContinue) {
        try { if (-not (& gemini extensions list 2>$null | Select-String "ponytail")) { & gemini extensions install https://github.com/DietrichGebert/ponytail 2>$null | Out-Null; Ok "  Gemini: ponytail extension installed" } else { Ok "  Gemini: ponytail extension already installed" } } catch { Warn "  Gemini: ponytail install failed" }
    }

    # 7d.4 — AGENTS.md fallback (append guarded block to each host's AGENTS.md)
    if ($ponytailSrc -and (Test-Path (Join-Path $ponytailSrc "AGENTS.md"))) {
        $marker = "PONYTAIL (DietrichGebert/ponytail v$ponytailVersion)"
        $agentsContent = Get-Content (Join-Path $ponytailSrc "AGENTS.md") -Raw
        foreach ($rel in @(".agents\AGENTS.md", ".codex\AGENTS.md")) {
            $agPath = Join-Path $HomeDir $rel
            if (Test-Path $agPath) {
                $existing = Get-Content $agPath -Raw -ErrorAction SilentlyContinue
                if ($existing -match "PONYTAIL") { Ok "  AGENTS fallback already in $agPath"; continue }
                Add-Content -Path $agPath -Value "`n`n<!-- $marker -->`n$agentsContent`n<!-- /PONYTAIL -->`n" -NoNewline
                Ok "  AGENTS fallback appended to $agPath"
            } else {
                New-Item -ItemType Directory -Path (Split-Path -Parent $agPath) -Force | Out-Null
                Set-Content -Path $agPath -Value $agentsContent -Encoding utf8
                Ok "  AGENTS fallback created: $agPath"
            }
        }
        # CLAUDE.md is really the bridge symlink on win — don't diverge; rely on .agents/AGENTS.md
        Log "  Cursor/Windsurf/Cline/Qoder: copy $ponytailSrc\AGENTS.md to <project>\.cursor\rules\ponytail.md as needed"
    } else { Warn "  ponytail source not available — AGENTS.md fallback skipped (plugins above remain)" }
    Ok "Ponytail $ponytailVersion wiring complete (defaultMode=$ponytailDefault, src=$ponytailSrc)"
} else { Log "7d. SKIP_PONYTAIL=1, skipping ponytail" }
Write-Host ""

# ─── 8. Terminal ───
Log "8. Terminal (Windows Terminal or WezTerm)..."
$wtInstalled = (Get-Command wt -ErrorAction SilentlyContinue) -ne $null
$weztermInstalled = (Get-Command wezterm -ErrorAction SilentlyContinue) -ne $null
if ($wtInstalled) {
    Ok "Windows Terminal detected"
}
elseif ($weztermInstalled) {
    Ok "WezTerm detected"
}
else {
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
