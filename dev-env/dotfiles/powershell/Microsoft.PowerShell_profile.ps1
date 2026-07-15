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

# Fix: long-lived shells (e.g. VS Code terminals spawned from a parent process
# that predates a PATH change) can inherit a Path with literal, unexpanded
# %VAR% placeholders instead of real directories -- seen with nvm-windows
# (nvm4w)'s self-referencing %NVM_HOME%/%NVM_SYMLINK% PATH entries, which
# breaks node/npm/pnpm resolution until VS Code is fully restarted. Expand
# defensively on every new shell so it works without a restart.
if ($env:Path -match '%\w+%') {
    $env:Path = [System.Environment]::ExpandEnvironmentVariables($env:Path)
}

# Hermes
function h { hermes }
Set-Alias -Name hc -Value "hermes chat" -Option AllScope -Force
Set-Alias -Name hcq -Value "hermes chat -q" -Option AllScope -Force

# Project shortcuts
function projects { Set-Location "$HOME\Projects" }
function personal { Set-Location "$HOME\Projects\eddremonts86" }
function work { Set-Location "$HOME\Projects\ei-schilling" }
