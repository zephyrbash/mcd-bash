$moduleDir = Join-Path $HOME "Documents/PowerShell"
$moduleFile = Join-Path $moduleDir "mcd.ps1"

if (!(Test-Path $moduleDir)) {
    New-Item -ItemType Directory -Path $moduleDir -Force | Out-Null
}

@'
function mcd {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Path
    )

    New-Item -ItemType Directory -Path $Path -Force | Out-Null
    Set-Location $Path
}
'@ | Set-Content -Path $moduleFile -Encoding UTF8

$profilePath = $PROFILE.CurrentUserCurrentHost
$profileDir = Split-Path $profilePath

if (!(Test-Path $profileDir)) {
    New-Item -ItemType Directory -Path $profileDir -Force | Out-Null
}

if (!(Test-Path $profilePath)) {
    New-Item -ItemType File -Path $profilePath -Force | Out-Null
}

$sourceLine = '. "$HOME/Documents/PowerShell/mcd.ps1"'

if (!(Select-String -LiteralPath $profilePath -Pattern $sourceLine -SimpleMatch -Quiet -ErrorAction SilentlyContinue)) {
    Add-Content -Path $profilePath -Value "`n$sourceLine"
}

. $moduleFile

Write-Host "mcd installed successfully."
Write-Host "Restart PowerShell or run '. `$PROFILE' to reload your profile."