# memory/windows/ai-os-tasks.ps1: the Windows stand-in for memory/launchd/. Registers the jobs AI-OS runs on a
# schedule as per-user scheduled tasks (no admin) and runs them, leaving a log whose last line says how it ended.
#
#   ai-os-tasks.ps1 [install|uninstall|status] [-Only backup,reindex,ui-start,ui-refresh] [-DryRun]
#   ai-os-tasks.ps1 run <job>    what the tasks call: appends to ~/.ai-os/logs/<job>-<date>.log, last line "exit=N"
#
# Jobs: backup (daily 13:00), reindex (every 4 h and at logon: a PC that sleeps overnight misses the night runs and
# StartWhenAvailable does not always catch up), and, only where ui-indexador is installed
# (~/.ai-os/apps/ui-indexador, as setup/install-mac.sh step 8b): ui-start (at logon) and ui-refresh (daily 11:30).
# `conhost --headless` keeps a console window from flashing but drops the exit code, so the log is the record;
# `ai-os health` reads it. Idempotent. Windows PowerShell 5.1 compatible: no &&, ?: or ??.
[CmdletBinding()]
param(
    [Parameter(Position = 0)][ValidateSet('install', 'uninstall', 'status', 'run')][string]$Cmd = 'install',
    [Parameter(Position = 1)][string]$Job,
    [string[]]$Only,
    [switch]$DryRun
)
$ErrorActionPreference = 'Stop'
$Root = Split-Path (Split-Path $PSScriptRoot)
$UiDir = Join-Path $HOME '.ai-os\apps\ui-indexador'
$LogDir = Join-Path $HOME '.ai-os\logs'
$Ollama = 'http://localhost:11500'  # AI-OS's own Ollama, not the default :11434

function Test-Ui { Test-Path (Join-Path $UiDir '.venv\Scripts\python.exe') }
function Test-BackupOn {  # `ai-os backup --disable` must survive a re-install, as in install-backup.sh
    $cfg = if ($env:AI_OS_BACKUP_CONFIG) { $env:AI_OS_BACKUP_CONFIG } else { Join-Path $HOME '.ai-os\backup.json' }
    if (-not (Test-Path $cfg)) { return $true }
    try { return ((Get-Content $cfg -Raw | ConvertFrom-Json).schedule -ne $false) } catch { return $true }
}

$Jobs = [ordered]@{
    'backup'     = @{ Task = 'AI-OS backup'; Minutes = 30; At = @('13:00'); Ready = { Test-BackupOn }
                      Why = 'daily backups are off in backup.json (ai-os backup --enable)' }
    'reindex'    = @{ Task = 'AI-OS reindex'; Minutes = 180; Logon = $true; Delay = 'PT3M'; At = @('00:00', '04:00', '08:00', '12:00', '16:00', '20:00')
                      Ready = { $true }; Why = '' }
    'ui-start'   = @{ Task = 'AI-OS ui-indexador'; Minutes = 5; Logon = $true; Ready = { Test-Ui }
                      Why = 'ui-indexador is not installed' }
    'ui-refresh' = @{ Task = 'AI-OS ui-indexador refresh'; Minutes = 60; At = @('11:30'); Ready = { Test-Ui }
                      Why = 'ui-indexador is not installed' }
}
$Names = if ($Only) { @(($Only -join ',') -split ',' | ForEach-Object { $_.Trim() } | Where-Object { $_ }) } else { @($Jobs.Keys) }
foreach ($n in $Names) { if (-not $Jobs.Contains($n)) { throw "unknown job '$n' (jobs: $($Jobs.Keys -join ', '))" } }

function Find-Python {
    $c = Get-Command python -ErrorAction SilentlyContinue
    if (-not $c) { throw 'python not found on PATH' }
    $c.Source
}
function Find-GitBash {  # not `bash` on PATH: on Windows that is often WSL's
    $git = Get-Command git -ErrorAction SilentlyContinue
    if (-not $git) { throw 'git not found on PATH' }
    $dir = Split-Path $git.Source
    foreach ($up in 1, 2) {
        $dir = Split-Path $dir
        $b = Join-Path $dir 'bin\bash.exe'
        if (Test-Path $b) { return $b }
    }
    throw "Git Bash not found next to $($git.Source)"
}

function Write-Log([string]$log, [string]$line) { Add-Content -Path $log -Value $line -Encoding UTF8 }
# Runs a native command with stdout and stderr appended to the log as UTF-8. (`*>>` writes UTF-16 on 5.1.)
function Invoke-Logged([string]$log, [scriptblock]$cmd) {
    & $cmd 2>&1 | ForEach-Object { "$_" } | Out-File -FilePath $log -Append -Encoding utf8
    $LASTEXITCODE
}

function Invoke-Job([string]$name) {
    New-Item -ItemType Directory -Force $LogDir | Out-Null
    $log = Join-Path $LogDir ('{0}-{1:yyyy-MM-dd}.log' -f $name, (Get-Date))
    $ErrorActionPreference = 'Continue'  # native stderr must land in the log, not throw
    [Console]::OutputEncoding = New-Object System.Text.UTF8Encoding $false  # the tools below print UTF-8
    $env:PYTHONUTF8 = '1'
    $env:UI_INDEXER_OLLAMA = $Ollama
    $code = 1
    try {
        $rootFwd = $Root -replace '\\', '/'
        switch ($name) {
            'backup'  { $py = Find-Python; $code = Invoke-Logged $log { & $py (Join-Path $Root 'setup\ai-os-backup.py') } }
            'reindex' { $bash = Find-GitBash; $code = Invoke-Logged $log { & $bash "$rootFwd/memory/cron-reindex.sh" } }
            'ui-start' {
                $py = Join-Path $UiDir '.venv\Scripts\python.exe'
                foreach ($s in @(@{ Port = 3040; Args = @('server.py') }, @{ Port = 3041; Args = @('mcp_server.py', '--http') })) {
                    if (Get-NetTCPConnection -LocalPort $s.Port -State Listen -ErrorAction SilentlyContinue) {
                        Write-Log $log "port $($s.Port) already listening"
                        continue
                    }
                    Start-Process $py -ArgumentList $s.Args -WorkingDirectory $UiDir -WindowStyle Hidden `
                        -RedirectStandardOutput (Join-Path $LogDir "ui-indexador-$($s.Port).out.log") `
                        -RedirectStandardError (Join-Path $LogDir "ui-indexador-$($s.Port).err.log")
                    Write-Log $log "started $($s.Args -join ' ') on $($s.Port)"
                }
                $code = 0
            }
            'ui-refresh' {
                $env:UI_INDEXER_PYTHON = '.venv/Scripts/python.exe'
                Push-Location $UiDir
                $bash = Find-GitBash
                try { $code = Invoke-Logged $log { & $bash refresh.sh } } finally { Pop-Location }
            }
        }
    }
    catch { Write-Log $log "error: $($_.Exception.Message)" }
    Write-Log $log ('exit={0} {1:s}' -f $code, (Get-Date))
    exit $code
}

function New-Triggers($d) {
    $t = @()
    if ($d.Logon) {
        $l = New-ScheduledTaskTrigger -AtLogOn -User "$env:USERDOMAIN\$env:USERNAME"
        if ($d.Delay) { $l.Delay = $d.Delay }  # let Docker and Ollama come up first
        $t += $l
    }
    if ($d.At) { $t += @($d.At | ForEach-Object { New-ScheduledTaskTrigger -Daily -At $_ }) }
    $t
}
function Show-When($d) {
    $w = if ($d.At) { 'daily at ' + ($d.At -join ', ') } else { '' }
    if ($d.Logon) { $w = if ($w) { "$w and at logon" } else { 'at logon' } }
    $w
}

function Install-Job([string]$n) {
    $d = $Jobs[$n]
    if (-not (& $d.Ready)) { return "$($d.Task): skipped, $($d.Why)" }
    if ($DryRun) { return "$($d.Task): would register ($(Show-When $d))" }
    $user = "$env:USERDOMAIN\$env:USERNAME"
    $action = New-ScheduledTaskAction -Execute 'conhost.exe' `
        -Argument "--headless powershell.exe -NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`" run $n"
    $settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable `
        -MultipleInstances IgnoreNew -ExecutionTimeLimit (New-TimeSpan -Minutes $d.Minutes)
    $principal = New-ScheduledTaskPrincipal -UserId $user -LogonType Interactive -RunLevel Limited
    Register-ScheduledTask -TaskName $d.Task -Description "AI-OS job '$n'. Log: $LogDir" -Action $action `
        -Trigger (New-Triggers $d) -Settings $settings -Principal $principal -Force | Out-Null
    "$($d.Task): registered ($(Show-When $d))"
}

function Uninstall-Job([string]$n) {
    $t = $Jobs[$n].Task
    if (Get-ScheduledTask -TaskName $t -ErrorAction SilentlyContinue) {
        if (-not $DryRun) { Unregister-ScheduledTask -TaskName $t -Confirm:$false }
        "${t}: removed"
    }
    else { "${t}: was not registered" }
}

function Show-Status([string]$n) {
    $t = $Jobs[$n].Task
    if (-not (Get-ScheduledTask -TaskName $t -ErrorAction SilentlyContinue)) { return ('{0,-28} not registered' -f $t) }
    $i = Get-ScheduledTaskInfo -TaskName $t
    $logFile = Get-ChildItem $LogDir -Filter "$n-*.log" -ErrorAction SilentlyContinue | Sort-Object LastWriteTime | Select-Object -Last 1
    $last = if ($logFile) { (Get-Content $logFile.FullName -Tail 1) } else { 'never ran' }
    '{0,-28} next {1:g}   last: {2}' -f $t, $i.NextRunTime, $last
}

if ($Cmd -eq 'run') {
    if (-not $Job -or -not $Jobs.Contains($Job)) { throw "usage: ai-os-tasks.ps1 run <$($Jobs.Keys -join '|')>" }
    Invoke-Job $Job
}
foreach ($n in $Names) {
    switch ($Cmd) {
        'install'   { Install-Job $n }
        'uninstall' { Uninstall-Job $n }
        'status'    { Show-Status $n }
    }
}
