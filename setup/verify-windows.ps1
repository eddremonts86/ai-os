# setup/verify-windows.ps1
# Verifies AI-OS on Windows.

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

# Required checks gate the exit code. Optional checks are best-effort and are
# reported separately so a partial setup never prints a false "correctly
# installed" summary and a missing optional CLI never fails the whole run.
$script:reqPass = 0
$script:reqFail = 0
$script:optOk = 0
$script:optMiss = 0
function ReqOk($msg) { Ok $msg; $script:reqPass++ }
function ReqFail($msg) { Err $msg; $script:reqFail++ }
function OptOk($msg) { Ok $msg; $script:optOk++ }
function OptMiss($msg) { Warn $msg; $script:optMiss++ }

# ─── 1. AI-OS path (required) ───
Section "1. AI-OS path"
if ((Test-Path $AIOSRoot) -and (Test-Path "$AIOSRoot\CLAUDE.md")) {
    ReqOk "AI-OS at $AIOSRoot"
} else {
    ReqFail "AI-OS not found at $AIOSRoot"
}

# ─── 2. Dotfiles (optional: personal shell preference) ───
Section "2. Dotfiles"
$dotfiles = @(".gitignore_global")
foreach ($df in $dotfiles) {
    $path = "$HomeDir\$df"
    if (-not (Test-Path $path)) {
        Warn "  $df does not exist"
        continue
    }
    $item = Get-Item $path -Force
    if (-not $item.Attributes.HasFlag([System.IO.FileAttributes]::ReparsePoint)) {
        Warn "  $df is not a symlink"
        continue
    }
    $target = $item.Target
    if ($target) {
        OptOk "  $df → $target"
    } else {
        OptMiss "  $df → broken symlink"
    }
}

# ─── 3. Global skills + CLI executables (exact-count check, not existence-only) ───
# Previously this only checked that a directory existed, so a client missing
# 1+ skills still counted as a pass. Compare against the exact source count.
Section "3. Global skills + CLI executables"
$flatSkillCount = (Get-ChildItem "$AIOSRoot\ai-config\skills" -Directory -ErrorAction SilentlyContinue |
    Where-Object { Test-Path (Join-Path $_.FullName "SKILL.md") }).Count
$gstackSkillCount = 0
if (Test-Path "$AIOSRoot\vendor\gstack") {
    $gstackSkillCount = (Get-ChildItem "$AIOSRoot\vendor\gstack" -Directory -ErrorAction SilentlyContinue |
        Where-Object { Test-Path (Join-Path $_.FullName "SKILL.md") }).Count
}
$expectedSkillCount = $flatSkillCount + $gstackSkillCount
Log "  Source of truth: $flatSkillCount flat skills + $gstackSkillCount gstack skills = $expectedSkillCount expected per client"

# id, relative path, required, executable name
$clients = @(
    @{ Id = "claude"; Path = ".claude\skills"; Required = $true; Bin = "claude" },
    @{ Id = "codex"; Path = ".codex\skills"; Required = $true; Bin = "codex" },
    @{ Id = "gemini"; Path = ".gemini\skills"; Required = $true; Bin = "gemini" },
    @{ Id = "antigravity"; Path = ".agents\skills"; Required = $true; Bin = "agy" },
    @{ Id = "hermes"; Path = ".hermes\skills\imported"; Required = $true; Bin = "hermes" }
)
foreach ($client in $clients) {
    $cliDir = Join-Path $HomeDir $client.Path
    $label = "~\$($client.Path)"

    # CLI executable presence is informational only: users legitimately may
    # not have every CLI installed, so this never fails the run on its own.
    if (Get-Command $client.Bin -ErrorAction SilentlyContinue) {
        Ok "  [$($client.Id)] executable '$($client.Bin)' found in PATH"
    } else {
        Warn "  [$($client.Id)] executable '$($client.Bin)' not found in PATH (skills stay deployed for when it's installed)"
    }

    if (-not (Test-Path $cliDir)) {
        if ($client.Required) {
            ReqFail "  [$($client.Id)] $label does not exist (run setup/install-windows.ps1)"
        } else {
            OptMiss "  [$($client.Id)] $label does not exist (optional client)"
        }
        continue
    }
    $deployed = (Get-ChildItem $cliDir -Force -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -ne "READMEDD.md" -and $_.Name -ne "taste-skill-llms.txt" -and $_.Name -ne ".system" }).Count
    if ($deployed -eq $expectedSkillCount) {
        if ($client.Required) {
            ReqOk "  [$($client.Id)] $label: $deployed/$expectedSkillCount skills (exact match)"
        } else {
            OptOk "  [$($client.Id)] $label: $deployed/$expectedSkillCount skills (exact match)"
        }
    } else {
        if ($client.Required) {
            ReqFail "  [$($client.Id)] $label: $deployed/$expectedSkillCount skills — MISMATCH (rerun setup/install-windows.ps1)"
        } else {
            OptMiss "  [$($client.Id)] $label: $deployed/$expectedSkillCount skills — mismatch (optional client)"
        }
    }
}

# ─── 3b. Global instruction bridge ───
# install-windows.ps1 renders the bridge template into a per-machine adapter
# file (path-neutral: substitutes the discovered AI-OS root) and links each
# CLI's global instruction file to that rendered file, not to the raw template.
Section "3b. Global instruction bridge"
$bridgeTemplate = "$AIOSRoot\ai-config\templates\global-bridge.md.tmpl"
$bridge = "$HomeDir\.ai-os\adapters\global-bridge.md"
if (-not (Test-Path $bridgeTemplate)) {
    ReqFail "  bridge template missing: $bridgeTemplate"
} elseif (-not (Test-Path $bridge)) {
    ReqFail "  rendered bridge missing: $bridge (run setup/install-windows.ps1)"
} elseif (-not (Select-String -Path $bridge -SimpleMatch $AIOSRoot -Quiet)) {
    ReqFail "  rendered bridge does not reference the discovered AI-OS root (stale render; run setup/install-windows.ps1)"
} else {
    ReqOk "  bridge rendered at $bridge (from $bridgeTemplate)"
}
$bridgeTargets = @(
    "$HomeDir\.claude\CLAUDE.md",
    "$HomeDir\.codex\AGENTS.md",
    "$HomeDir\.gemini\GEMINI.md",
    "$HomeDir\.agents\AGENTS.md"
)
foreach ($target in $bridgeTargets) {
    $label = $target.Substring($HomeDir.Length + 1)
    $linked = $false
    if (Test-Path $target) {
        $item = Get-Item $target -Force
        if ($item.Attributes.HasFlag([System.IO.FileAttributes]::ReparsePoint) -and $item.Target -eq $bridge) {
            $linked = $true
        }
    }
    if ($linked) {
        ReqOk "  $label → bridge"
    } else {
        ReqFail "  $label not linked to bridge (run setup/install-windows.ps1)"
    }
}
if ((Test-Path "$HomeDir\.hermes\SOUL.md") -and (Select-String -Path "$HomeDir\.hermes\SOUL.md" -SimpleMatch "AI-OS BRIDGE" -Quiet)) {
    OptOk "  ~/.hermes/SOUL.md carries AI-OS bridge block"
} else {
    OptMiss "  ~/.hermes/SOUL.md missing AI-OS bridge block (Hermes only)"
}

# ─── 4. Superpowers (required = 14) ───
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
    ReqOk "$actual/$expected superpowers skills OK"
} else {
    ReqFail "Only $actual/$expected superpowers skills installed"
}

# ─── 5. PowerShell profile (optional) ───
Section "5. PowerShell profile (optional)"
$profilePath = $PROFILE.CurrentUserAllHosts
if (Test-Path $profilePath) {
    OptOk "PowerShell profile exists"
} else {
    OptMiss "PowerShell profile not created (run install-windows.ps1)"
}

# ─── Summary ───
Section "Summary"
Write-Host ""
Log "Required: $reqPass passed, $reqFail failed"
Log "Optional/best-effort: $optOk present, $optMiss missing or not configured (does not block install)"
if ($reqFail -gt 0) {
    Err "$reqFail required check(s) failed"
    exit 1
} else {
    Ok "All required checks passed"
    if ($optMiss -gt 0) {
        Warn "$optMiss optional item(s) missing — see warnings above (not blocking)"
    }
    Write-Host ""
    Ok "AI-OS is correctly installed. 🎉"
    exit 0
}