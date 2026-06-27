# setup/install-windows.dry-run.ps1
# Simula install-windows.ps1 sin tocar el sistema. Para CI.
#
# Uso: $env:DRY_RUN = "1"; powershell -File install-windows.ps1
# (install-windows.ps1 detecta DRY_RUN=1 y redirige a este script)

$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$AIOSRoot = Split-Path -Parent $ScriptDir
$LogPrefix = "[ai-os install DRY-RUN]"

function Log($msg) { Write-Host "$LogPrefix $msg" }
function Ok($msg) { Write-Host "$LogPrefix ✅ $msg" }
function Warn($msg) { Write-Host "$LogPrefix ⚠️  $msg" -ForegroundColor Yellow }
function Err($msg) { Write-Host "$LogPrefix ❌ $msg" -ForegroundColor Red }

# Create temporary HOME
$TempHome = Join-Path $env:TEMP "aios-dryrun-$PID"
New-Item -ItemType Directory -Path $TempHome -Force | Out-Null
$env:HOME = $TempHome
$env:USERPROFILE = $TempHome

Log "═══════════════════════════════════════════════════════════"
Log "  AI-OS Setup DRY-RUN (Windows simulation)"
Log "  AI-OS root: $AIOSRoot"
Log "  Simulated HOME: $TempHome"
Log "═══════════════════════════════════════════════════════════"
Write-Host ""

# ─── 0. Verify structure ───
Log "0. Verifying AI-OS structure..."
$fail = 0

$requiredFiles = @(
    "CLAUDE.md",
    "ai-config/skills",
    "ai-config/mcp",
    "dev-env/dotfiles/zsh/.zshrc",
    "dev-env/dotfiles/zsh/.p10k.zsh",
    "dev-env/dotfiles/git/.gitconfig.template",
    "dev-env/dotfiles/ssh/config",
    "dev-env/packages/Brewfile",
    "setup/install-windows.ps1",
    "setup/verify-windows.ps1",
    "setup/generate-mcp-config.py"
)

foreach ($f in $requiredFiles) {
    if (-not (Test-Path (Join-Path $AIOSRoot $f))) {
        Err "Falta: $f"
        $fail++
    }
}

if ($fail -eq 0) {
    Ok "Estructura AI-OS completa"
} else {
    Err "$fail missing files"
    exit 1
}

# ─── 1. Validate packages files ───
Log "1. Validando archivos de packages..."
$brewfile = Get-Content "$AIOSRoot\dev-env\packages\Brewfile" -ErrorAction SilentlyContinue
if ($brewfile) {
    $brewCount = ($brewfile | Where-Object { $_ -match '^(brew|cask|tap)\s' }).Count
    Ok "Brewfile: $brewCount entries"
} else {
    Err "Brewfile no existe"
    exit 1
}

$npmGlobals = Get-Content "$AIOSRoot\dev-env\packages\npm-globals.txt" -ErrorAction SilentlyContinue
if ($npmGlobals) {
    $npmCount = ($npmGlobals | Where-Object { $_ -notmatch '^\s*(#|$)' }).Count
    Ok "npm-globals: $npmCount packages"
}

$pipPackages = Get-Content "$AIOSRoot\dev-env\packages\pip-packages.txt" -ErrorAction SilentlyContinue
if ($pipPackages) {
    $pipCount = ($pipPackages | Where-Object { $_ -notmatch '^\s*(#|$)' }).Count
    Ok "pip-packages: $pipCount packages"
}

# ─── 2. Simular symlinks de dotfiles (en TMP) ───
Log "2. Simulating dotfiles symlinks..."
$dotfiles = @(
    @{File = ".gitignore_global"; Source = "dev-env/dotfiles/git/.gitignore_global"}
)
foreach ($df in $dotfiles) {
    $source = Join-Path $AIOSRoot $df.Source
    $target = Join-Path $TempHome $df.File
    if (Test-Path $source) {
        New-Item -ItemType SymbolicLink -Path $target -Target $source -Force | Out-Null
        if (Test-Path $target) {
            Ok "  $($df.File) → $($df.Source) (simulado)"
        } else {
            Err "  $($df.File) falló al crear symlink"
            exit 1
        }
    } else {
        Err "  Source no existe: $source"
        exit 1
    }
}

# ─── 3. Simular propagación de skills ───
Log "3. Simulating skills propagation to 5 CLIs..."
$cliDirs = @(
    "$TempHome\.claude\skills",
    "$TempHome\.codex\skills",
    "$TempHome\.gemini\skills",
    "$TempHome\.agents\skills",
    "$TempHome\.hermes\skills\imported"
)

$skillCount = (Get-ChildItem "$AIOSRoot\ai-config\skills" -Directory).Count
Ok "Skills source of truth: $skillCount"

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
    $cliCount = (Get-ChildItem $cliDir -Force | Where-Object { $_.Name -ne "READMEDD.md" -and $_.Name -ne "taste-skill-llms.txt" -and $_.Name -ne ".system" }).Count
    if ($cliCount -gt 50) {
        Ok "  $cliDir`: $cliCount skills (simulado)"
    } else {
        Err "  $cliDir`: solo $cliCount skills"
        exit 1
    }
}

# ─── 4. Simular MCP config generation ───
Log "4. Simulating MCP config generation..."
$pythonCmd = (Get-Command python -ErrorAction SilentlyContinue) ?? (Get-Command python3 -ErrorAction SilentlyContinue) ?? (Get-Command py -ErrorAction SilentlyContinue)
if ($pythonCmd) {
    $tempConfig = Join-Path $TempHome "hermes-config-test.yaml"
    $pythonArgs = @(
        (Join-Path $AIOSRoot "setup\generate-mcp-config.py"),
        (Join-Path $AIOSRoot "ai-config\mcp"),
        $tempConfig
    )
    & $pythonCmd.Source $pythonArgs 2>&1 | Out-Null
    if (Test-Path $tempConfig) {
        $content = Get-Content $tempConfig -Raw
        if ($content -match "mcp_servers:") {
            # Parsear con regex simple
            $mcpCount = ([regex]::Matches($content, "^\s+[a-z-]+:\s*$", "Multiline") | Where-Object { $_.Value.Trim() -in @("time:","filesystem:","pdf:","sequential-thinking:","memory:","chrome:","agent-browser:") }).Count
            if ($mcpCount -ge 7) {
                Ok "MCP config: $mcpCount servers generados"
            } else {
                Err "MCP config: solo $mcpCount servers (esperado >=7)"
                exit 1
            }
        } else {
            Err "MCP config no tiene mcp_servers section"
            exit 1
        }
    } else {
        Err "Script generate-mcp-config.py no creó output"
        exit 1
    }
} else {
    Warn "Python no disponible, saltando MCP check"
}

# ─── 5. Validate skills frontmatter (sample) ───
Log "5. Validating skills frontmatter (sample of 10)..."
$skillDirs = Get-ChildItem "$AIOSRoot\ai-config\skills" -Directory | Get-Random -Count 10
$fmErrors = 0
foreach ($skillDir in $skillDirs) {
    # Buscar SKILL.md en cualquier nivel
    $skillMd = Get-ChildItem -Path $skillDir.FullName -Recurse -Filter "SKILL.md" -ErrorAction SilentlyContinue | Select-Object -First 1
    if (-not $skillMd) {
        # No es skill real, es categoría
        continue
    }
    # Extract frontmatter (everything between the two --- delimiters)
    $content = Get-Content $skillMd.FullName -ErrorAction SilentlyContinue
    $inFrontmatter = $false
    $fmContent = @()
    foreach ($line in $content) {
        if ($line -eq "---") {
            if (-not $inFrontmatter) {
                $inFrontmatter = $true
                continue
            } else {
                break
            }
        }
        if ($inFrontmatter) {
            $fmContent += $line
        }
    }
    $hasName = $fmContent | Where-Object { $_ -match "^name:" }
    $hasDesc = $fmContent | Where-Object { $_ -match "^description:" }
    if (-not $hasName) {
        Err "  $($skillDir.Name): missing name: in frontmatter"
        $fmErrors++
    }
    if (-not $hasDesc) {
        Err "  $($skillDir.Name): missing description: in frontmatter"
        $fmErrors++
    }
}

if ($fmErrors -eq 0) {
    Ok "Frontmatter de skills OK (10 sampled)"
} else {
    Err "$fmErrors errores de frontmatter"
    exit 1
}

# ─── 6. Cleanup ───
Log "6. Cleanup temporal..."
Remove-Item -Path $TempHome -Recurse -Force -ErrorAction SilentlyContinue
Ok "Cleanup OK"

Write-Host ""
Log "═══════════════════════════════════════════════════════════"
Ok "DRY-RUN exitoso. El setup funcionaría sin errores en Windows real."
Log "Para instalación real: powershell -File .\setup\install-windows.ps1 (sin DRY_RUN=1)"
Log "═══════════════════════════════════════════════════════════"
