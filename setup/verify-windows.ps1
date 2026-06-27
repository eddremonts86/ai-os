# setup/verify-windows.ps1
# Verifica AI-OS en Windows.

$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$AIOSRoot = Split-Path -Parent $ScriptDir
$HomeDir = $HOME

$LogPrefix = "[ai-os verify]"
function Log($msg) { Write-Host "$LogPrefix $msg" }
function Ok($msg) { Write-Host "$LogPrefix ✅ $msg" }
function Warn($msg) { Write-Host "$LogPrefix ⚠️  $msg" -ForegroundColor Yellow }
function Err($msg) { Write-Host "$LogPrefix ❌ $msg" -ForegroundColor Red }
function Section($name) { Write-Host ""; Write-Host "$LogPrefix ─── $name ───" }

$pass = 0
$fail = 0

# ─── 1. AI-OS path ───
Section "1. AI-OS path"
if ((Test-Path $AIOSRoot) -and (Test-Path "$AIOSRoot\CLAUDE.md")) {
    Ok "AI-OS en $AIOSRoot"
    $pass++
} else {
    Err "AI-OS no encontrado en $AIOSRoot"
    $fail++
}

# ─── 2. Dotfiles ───
Section "2. Dotfiles"
$dotfiles = @(".gitignore_global")
foreach ($df in $dotfiles) {
    $path = "$HomeDir\$df"
    if ((Test-Path $path) -and (-not (Get-Item $path -Force).Attributes.HasFlag([System.IO.FileAttributes]::ReparsePoint)) {
        Warn "  $df no es symlink"
    } elseif (Test-Path $path) {
        $target = (Get-Item $path -Force).Target
        if ($target) {
            Ok "  $df → $target"
            $pass++
        } else {
            Err "  $df → broken symlink"
            $fail++
        }
    }
}

# ─── 3. Skills en 5 CLIs ───
Section "3. Skills globales (5 CLIs)"
$cliDirs = @(
    "$HomeDir\.claude\skills",
    "$HomeDir\.codex\skills",
    "$HomeDir\.gemini\skills",
    "$HomeDir\.agents\skills",
    "$HomeDir\.hermes\skills\imported"
)
foreach ($cliDir in $cliDirs) {
    if (Test-Path $cliDir) {
        $count = (Get-ChildItem $cliDir -Force | Where-Object { $_.Name -ne "READMEDD.md" -and $_.Name -ne "taste-skill-llms.txt" -and $_.Name -ne ".system" }).Count
        $label = $cliDir.Substring($HomeDir.Length + 1)
        Ok "  ~/$label : $count skills"
        $pass++
    } else {
        Err "  $cliDir no existe"
        $fail++
    }
}

# ─── 4. Superpowers ───
Section "4. Superpowers skills (REQUIRED = 14)"
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
if ($actual -eq $expected) {
    Ok "$actual/$expected superpowers skills OK"
    $pass++
} else {
    Err "Solo $actual/$expected superpowers skills instaladas"
    $fail++
}

# ─── 5. PowerShell profile ───
Section "5. PowerShell profile"
$profilePath = $PROFILE.CurrentUserAllHosts
if (Test-Path $profilePath) {
    Ok "PowerShell profile existe"
    $pass++
} else {
    Warn "PowerShell profile no creado (correr install-windows.ps1)"
}

# ─── Resumen ───
Section "Resumen"
Write-Host ""
Log "Pasados: $pass"
if ($fail -gt 0) {
    Err "Fallados: $fail"
    exit 1
} else {
    Ok "Fallados: 0"
    Write-Host ""
    Ok "AI-OS is correctly installed. 🎉"
    exit 0
}
