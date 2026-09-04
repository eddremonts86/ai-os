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
}
else {
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
    }
    else {
        OptMiss "  $df → broken symlink"
    }
}

# ─── 3. Global skills + CLI executables (exact name-set check, not count-only) ───
# Previously this only checked that a directory existed, so a client missing
# 1+ skills still counted as a pass. A plain count comparison also breaks the
# moment ECC or claude.tools/gstack are installed (they legitimately add more
# names on top of the baseline). Compare against the exact set of expected
# skill NAMES instead — catches a real gap no matter what optional bundles are
# also installed.
Section "3. Global skills + CLI executables"
$expectedSkillNames = @()
$expectedSkillNames += Get-ChildItem "$AIOSRoot\ai-config\skills" -Directory -ErrorAction SilentlyContinue |
Where-Object { Test-Path (Join-Path $_.FullName "SKILL.md") } | ForEach-Object { $_.Name }
if (Test-Path "$AIOSRoot\vendor\gstack") {
    $expectedSkillNames += Get-ChildItem "$AIOSRoot\vendor\gstack" -Directory -ErrorAction SilentlyContinue |
    Where-Object { Test-Path (Join-Path $_.FullName "SKILL.md") } | ForEach-Object { $_.Name }
}
$expectedSkillNames = $expectedSkillNames | Sort-Object -Unique
$expectedSkillCount = $expectedSkillNames.Count
Log "  Source of truth: $expectedSkillCount expected skill names per client (flat + gstack)"

# id, relative path, required, executable name
# Hermes is intentionally absent here: it natively supports skills.external_dirs
# (confirmed against https://hermes-agent.nousresearch.com/docs/user-guide/features/skills
# on 2026-07-12) and reads ~/.agents/skills directly instead of getting a
# symlinked copy under ~/.hermes/skills/imported/ (P1-2). See the dedicated
# check right after this loop.
$clients = @(
    @{ Id = "claude"; Path = ".claude\skills"; Required = $true; Bin = "claude" },
    @{ Id = "codex"; Path = ".codex\skills"; Required = $true; Bin = "codex" },
    @{ Id = "gemini"; Path = ".gemini\skills"; Required = $true; Bin = "gemini" },
    @{ Id = "antigravity"; Path = ".agents\skills"; Required = $true; Bin = "agy" },
    @{ Id = "antigravity-global"; Path = ".gemini\config\skills"; Required = $false; Bin = "agy" }
)
foreach ($client in $clients) {
    $cliDir = Join-Path $HomeDir $client.Path
    $label = "~\$($client.Path)"

    # CLI executable presence is informational only: users legitimately may
    # not have every CLI installed, so this never fails the run on its own.
    if (Get-Command $client.Bin -ErrorAction SilentlyContinue) {
        Ok "  [$($client.Id)] executable '$($client.Bin)' found in PATH"
    }
    else {
        Warn "  [$($client.Id)] executable '$($client.Bin)' not found in PATH (skills stay deployed for when it's installed)"
    }

    if (-not (Test-Path $cliDir)) {
        if ($client.Required) {
            ReqFail "  [$($client.Id)] $label does not exist (run setup/install-windows.ps1)"
        }
        else {
            OptMiss "  [$($client.Id)] $label does not exist (optional client)"
        }
        continue
    }
    $deployedNames = @(Get-ChildItem $cliDir -Force -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -ne "READMEDD.md" -and $_.Name -ne "taste-skill-llms.txt" -and $_.Name -ne ".system" } |
        ForEach-Object { $_.Name })
    $missingNames = @($expectedSkillNames | Where-Object { $deployedNames -notcontains $_ })
    if ($missingNames.Count -eq 0) {
        if ($client.Required) {
            ReqOk "  [$($client.Id)] ${label}: $($deployedNames.Count)/$expectedSkillCount+ skills (all expected names present)"
        }
        else {
            OptOk "  [$($client.Id)] ${label}: $($deployedNames.Count)/$expectedSkillCount+ skills (all expected names present)"
        }
    }
    else {
        $missingList = $missingNames -join ", "
        if ($client.Required) {
            ReqFail "  [$($client.Id)] ${label}: missing $($missingNames.Count) expected skill(s) (rerun setup/install-windows.ps1): $missingList"
        }
        else {
            OptMiss "  [$($client.Id)] ${label}: missing $($missingNames.Count) expected skill(s) (optional client): $missingList"
        }
    }
}

# Hermes: executable presence (informational) + skills.external_dirs check
# (required only when Hermes is actually installed, mirroring the MCP check).
if (Get-Command hermes -ErrorAction SilentlyContinue) {
    Ok "  [hermes] executable 'hermes' found in PATH"
    $hermesConfig = "$HomeDir\.hermes\config.yaml"
    if ((Test-Path $hermesConfig) -and (Select-String -Path $hermesConfig -SimpleMatch "$HomeDir\.agents\skills" -Quiet)) {
        ReqOk "  [hermes] ~/.hermes/config.yaml declares ~/.agents/skills under skills.external_dirs"
    }
    else {
        ReqFail "  [hermes] ~/.hermes/config.yaml missing ~/.agents/skills under skills.external_dirs (run setup/install-windows.ps1)"
    }
}
else {
    Warn "  [hermes] executable 'hermes' not found in PATH (skills stay available for when it's installed)"
    OptMiss "  [hermes] not installed, skipping skills.external_dirs check"
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
}
elseif (-not (Test-Path $bridge)) {
    ReqFail "  rendered bridge missing: $bridge (run setup/install-windows.ps1)"
}
elseif (-not (Select-String -Path $bridge -SimpleMatch $AIOSRoot -Quiet)) {
    ReqFail "  rendered bridge does not reference the discovered AI-OS root (stale render; run setup/install-windows.ps1)"
}
else {
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
    }
    else {
        ReqFail "  $label not linked to bridge (run setup/install-windows.ps1)"
    }
}
if ((Test-Path "$HomeDir\.hermes\SOUL.md") -and (Select-String -Path "$HomeDir\.hermes\SOUL.md" -SimpleMatch "AI-OS BRIDGE" -Quiet)) {
    OptOk "  ~/.hermes/SOUL.md carries AI-OS bridge block"
}
else {
    OptMiss "  ~/.hermes/SOUL.md missing AI-OS bridge block (Hermes only)"
}
# VS Code (GitHub Copilot Chat) carries the bridge block inside its global
# custom-instructions file (path varies per account; glob for it).
$vscodeBridgeFound = 0
foreach ($ghDir in @(
        (Join-Path $HomeDir "AppData\Roaming\Code\User\globalStorage\github.copilot-chat\github"),
        (Join-Path $HomeDir "AppData\Roaming\Code - Insiders\User\globalStorage\github.copilot-chat\github")
    )) {
    if (-not (Test-Path $ghDir)) { continue }
    Get-ChildItem $ghDir -Directory -ErrorAction SilentlyContinue | ForEach-Object {
        $instrFile = Join-Path $_.FullName "instructions\default.instructions.md"
        if ((Test-Path $instrFile) -and (Select-String -Path $instrFile -SimpleMatch "AI-OS BRIDGE" -Quiet)) {
            $script:vscodeBridgeFound++
        }
    }
}
if ($vscodeBridgeFound -gt 0) {
    OptOk "  VS Code Copilot Chat instructions carry AI-OS bridge block ($vscodeBridgeFound file(s))"
}
else {
    OptMiss "  VS Code Copilot Chat instructions missing AI-OS bridge block (OK if unused; run install-windows.ps1)"
}

# ─── 3c. IDE/CLI MCP servers ───
# install-windows.ps1 step 7c wires ai-config/mcp/*.yaml into each installed
# client's own MCP config (VS Code mcp.json, Codex config.toml, Claude Code
# .claude.json, Gemini settings.json). All optional: a client not installed
# on this machine is skipped, not failed.
Section "3c. IDE/CLI MCP servers (VS Code, Codex, Claude Code, Gemini)"
function Test-McpMarker($path, $marker) {
    (Test-Path $path) -and (Select-String -Path $path -SimpleMatch $marker -Quiet)
}
$vscodeMcp = Join-Path $HomeDir "AppData\Roaming\Code\User\mcp.json"
if (Test-Path (Split-Path -Parent $vscodeMcp)) {
    if (Test-McpMarker $vscodeMcp "grepai") { OptOk "  VS Code mcp.json wired (grepai present)" }
    else { OptMiss "  VS Code mcp.json missing AI-OS servers (run install-windows.ps1)" }
}
else {
    OptMiss "  VS Code not detected, skipping"
}
$codexToml = Join-Path $HomeDir ".codex\config.toml"
if (Test-Path (Join-Path $HomeDir ".codex")) {
    if (Test-McpMarker $codexToml "mcp_servers.grepai") { OptOk "  Codex config.toml wired (grepai present)" }
    else { OptMiss "  Codex config.toml missing AI-OS servers (run install-windows.ps1)" }
}
else {
    OptMiss "  Codex not detected, skipping"
}
$claudeJson = Join-Path $HomeDir ".claude.json"
if (Test-Path $claudeJson) {
    if (Test-McpMarker $claudeJson "grepai") { OptOk "  Claude Code .claude.json wired (grepai present)" }
    else { OptMiss "  Claude Code .claude.json missing AI-OS servers (run install-windows.ps1)" }
}
else {
    OptMiss "  Claude Code not detected, skipping"
}
$geminiSettings = Join-Path $HomeDir ".gemini\settings.json"
if (Test-Path (Join-Path $HomeDir ".gemini")) {
    if (Test-McpMarker $geminiSettings "grepai") { OptOk "  Gemini settings.json wired (grepai present)" }
    else { OptMiss "  Gemini settings.json missing AI-OS servers (run install-windows.ps1)" }
}
else {
    OptMiss "  Gemini not detected, skipping"
}

# ─── 3d. Ponytail — lazy senior dev ruleset (optional, never blocks install) ───
Section "3d. Ponytail (optional — DietrichGebert/ponytail v4.9.0)"
$ponytailCfg = Join-Path $HomeDir ".config\ponytail\config.json"
if ($env:APPDATA) { $ponytailCfg = Join-Path $env:APPDATA "ponytail\config.json" }
if (Test-Path $ponytailCfg) {
    try {
        $pcfg = Get-Content $ponytailCfg -Raw | ConvertFrom-Json
        if ($pcfg.PSObject.Properties['defaultMode']) { OptOk "ponytail config present: $ponytailCfg (defaultMode=$($pcfg.defaultMode))" }
        else { OptMiss "ponytail config at $ponytailCfg has no defaultMode — edit manually" }
    } catch { OptMiss "ponytail config at $ponytailCfg is not valid JSON" }
} else { OptMiss "ponytail config not found at $ponytailCfg (run setup/install-windows.ps1 or set SKIP_PONYTAIL=1)" }
foreach ($pony in @(
    @{ Id="claude"; Bin="claude"; Check={ param($b) & $b plugin list 2>$null | Select-String "ponytail" } },
    @{ Id="codex"; Bin="codex"; Check={ param($b) & $b plugin list 2>$null | Select-String "ponytail" } },
    @{ Id="hermes"; Bin="hermes"; Check={ param($b) & $b plugins list 2>$null | Select-String -Pattern "ponytail" -CaseSensitive:$false } }
)) {
    if (-not (Get-Command $pony.Bin -ErrorAction SilentlyContinue)) { OptMiss "  [$($pony.Id)] $($pony.Bin) not in PATH — skipping ponytail plugin check"; continue }
    try { $hit = & $pony.Check $pony.Bin; if ($hit) { OptOk "  [$($pony.Id)] ponytail plugin/extension installed" } else {
        if ((Test-Path (Join-Path $HomeDir ".agents\AGENTS.md")) -and (Select-String -Path (Join-Path $HomeDir ".agents\AGENTS.md") -Pattern "PONYTAIL" -Quiet)) { OptOk "  [$($pony.Id)] ponytail via AGENTS.md fallback (plugin not needed)" }
        else { OptMiss "  [$($pony.Id)] ponytail plugin not detected and no AGENTS.md fallback (run install-windows.ps1)" }
    }} catch { OptMiss "  [$($pony.Id)] ponytail plugin check failed" }
}
if ((Test-Path (Join-Path $HomeDir ".agents\AGENTS.md")) -and (Select-String -Path (Join-Path $HomeDir ".agents\AGENTS.md") -Pattern "PONYTAIL" -Quiet)) { OptOk "  ~/.agents/AGENTS.md carries ponytail rules" } else { OptMiss "  ~/.agents/AGENTS.md missing ponytail block (run install-windows.ps1)" }
Section "3e. intent/ home (optional — AI-native SDLC)"
if ((Test-Path (Join-Path $AIOSRoot "intent")) -and (Test-Path (Join-Path $AIOSRoot "intent\intent-template.md"))) {
    $ic = @(Get-ChildItem (Join-Path $AIOSRoot "intent") -Filter "2*.md" -ErrorAction SilentlyContinue).Count; OptOk "intent/ home present: intent/intent-template.md + $ic intent(s)"
} else { OptMiss "intent/ home missing — run install-windows.ps1 or create intent/intent-template.md" }
if ((Test-Path (Join-Path $AIOSRoot "ai-config\skills\intent-to-spec")) -and (Test-Path (Join-Path $AIOSRoot "ai-config\skills\intent-to-spec\SKILL.md"))) { OptOk "  skill intent-to-spec present" } else { OptMiss "  skill intent-to-spec missing" }

# ─── 3f. Strategic-compact hook (optional — mirrors verify.sh section 3f) ───
Section "3f. Strategic-compact hook (optional — Claude Code PreToolUse)"
$wireScript = Join-Path $AIOSRoot "setup\wire-compact-hook.mjs"
if (-not (Get-Command node -ErrorAction SilentlyContinue)) { OptMiss "node not in PATH — cannot check the hook (it is a node script)" }
elseif (-not (Test-Path $wireScript)) { OptMiss "setup/wire-compact-hook.mjs missing" }
else {
    $hookStatus = (& node $wireScript --check 2>&1 | Out-String).Trim()
    $hookStatus = $hookStatus -replace '^\[compact-hook\] (OK )?', ''
    if ($LASTEXITCODE -eq 0) { OptOk $hookStatus } else { OptMiss $hookStatus }
}
# Dangling skill links are invisible to the loops that create them (the source
# dir is gone, so the name is never revisited) — count them explicitly.
$brokenLinks = 0
foreach ($cliPath in @(".claude\skills", ".codex\skills", ".gemini\skills", ".agents\skills", ".gemini\config\skills")) {
    $dir = Join-Path $HomeDir $cliPath
    if (-not (Test-Path $dir)) { continue }
    foreach ($link in @(Get-ChildItem $dir -Force -ErrorAction SilentlyContinue)) {
        if (-not ($link.Attributes -band [IO.FileAttributes]::ReparsePoint)) { continue }
        # Test-Path on the LINK is True even when it dangles (verified on PS 7,
        # 2026-09-04) — a directory symlink exists as an entry regardless of its
        # target. The target is what has to be probed.
        $linkTarget = $link.Target
        if (-not $linkTarget) { continue }
        if (Test-Path -LiteralPath $linkTarget) { continue }
        Warn "  BROKEN $cliPath\$($link.Name) → $linkTarget"
        $brokenLinks++
    }
}
if ($brokenLinks -eq 0) { OptOk "  no dangling skill links in the CLI skill dirs" }
else { OptMiss "  $brokenLinks dangling skill link(s) — re-run install-windows.ps1 to prune" }

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
}
else {
    ReqFail "Only $actual/$expected superpowers skills installed"
}

# ─── 5. PowerShell profile (optional) ───
Section "5. PowerShell profile (optional)"
$profilePath = $PROFILE.CurrentUserAllHosts
if (Test-Path $profilePath) {
    OptOk "PowerShell profile exists"
}
else {
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
}
else {
    Ok "All required checks passed"
    if ($optMiss -gt 0) {
        Warn "$optMiss optional item(s) missing — see warnings above (not blocking)"
    }
    Write-Host ""
    Ok "AI-OS is correctly installed."
    exit 0
}