# Deploy ArchHUD-CG to Dual Universe autoconf directory
$ErrorActionPreference = "Stop"
$duCustom = "C:\ProgramData\My Dual Universe\Game\data\lua\autoconf\custom"
$repo = $PSScriptRoot

if (-not (Test-Path $duCustom)) {
    Write-Error "DU autoconf directory not found: $duCustom"
    exit 1
}

# Client updates leave existing files owned by Administrators, so overwriting them needs elevation
$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host "Requesting elevation to write to $duCustom ..."
    $proc = Start-Process -FilePath (Get-Process -Id $PID).Path -Verb RunAs -Wait -PassThru `
        -ArgumentList "-NoProfile", "-ExecutionPolicy", "Bypass", "-File", "`"$PSCommandPath`""
    exit $proc.ExitCode
}

# Ensure archhud subdirectory exists
$archDir = "$duCustom\archhud"
if (-not (Test-Path $archDir)) {
    New-Item -ItemType Directory -Path $archDir | Out-Null
}

# Copy the built conf file
Copy-Item -Path "$repo\ArchHUD.conf" -Destination "$duCustom\ArchHUD.conf" -Force
Write-Host "Deployed: ArchHUD.conf"

# Copy all archhud runtime modules from src/requires/
$files = Get-ChildItem -Path "$repo\src\requires" -Filter "*.lua"
foreach ($file in $files) {
    Copy-Item -Path $file.FullName -Destination "$archDir\$($file.Name)" -Force
    Write-Host "Deployed: archhud/$($file.Name)"
}
Write-Host "Deployed $($files.Count) archhud module(s)"

if (-not (Test-Path "$duCustom\atlas.lua")) {
    Write-Warning "atlas.lua not found in $duCustom - install it from the atlas-CG repo"
}

Write-Host "`nDeploy complete to: $duCustom"
