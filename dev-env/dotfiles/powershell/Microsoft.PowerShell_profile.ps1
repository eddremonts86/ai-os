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
