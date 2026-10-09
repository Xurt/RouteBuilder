<#
.SYNOPSIS
    Packs RouteBuilder's guides into a small WoW addon that RestedXP loads.

.DESCRIPTION
    Writes the addon to addon\RXPGuides_ZoneRoutes next to this script. Copy that RXPGuides_ZoneRoutes
    folder into your game's Interface\AddOns folder, beside RXPGuides.

    The addon lists RXPGuides as a dependency and loads every guide .lua file from the "guides" folder,
    so nothing inside the RestedXP addon itself has to be edited. Run the script again after every
    build; the folder is rebuilt from scratch each time.

.PARAMETER GuidesPath
    Folder holding the generated .lua guides. Default: the "guides" folder next to this script.

.PARAMETER Interface
    Interface number(s) for the .toc. Default: the list RestedXP itself uses. Change it only if the
    game lists the addon as out of date.

.EXAMPLE
    .\Make-Addon.ps1
#>
[CmdletBinding()]
param(
    [string]$GuidesPath,
    [string]$Interface = '11509, 38002, 50504, 120100, 120005, 120007, 16001'
)

Set-StrictMode -Version 2.0
$ErrorActionPreference = 'Stop'

$addonName = 'RXPGuides_ZoneRoutes'
$here = $PSScriptRoot
if (-not $here) { $here = (Get-Location).Path }

if (-not $GuidesPath) { $GuidesPath = Join-Path $here 'guides' }
if (-not (Test-Path -LiteralPath $GuidesPath -PathType Container)) {
    Write-Host "Guides folder not found: $GuidesPath. Build some guides first." -ForegroundColor Red
    exit 1
}

# ---- the guides to pack
$guides = @()
$usedNames = @{}
foreach ($f in @(Get-ChildItem -LiteralPath $GuidesPath -Filter '*.lua' -File | Sort-Object Name)) {
    $text = [System.IO.File]::ReadAllText($f.FullName)
    if ($text -notmatch 'RXPGuides\.RegisterGuide') {
        Write-Warning "Skipped $($f.Name): it does not register a RestedXP guide."
        continue
    }
    # a file name the game cannot trip over: letters, digits and underscores only
    $safe = ($f.BaseName -replace '[^A-Za-z0-9]+', '_').Trim('_')
    if (-not $safe) { $safe = 'Guide' }
    $name = $safe
    $n = 2
    while ($usedNames.ContainsKey($name.ToLowerInvariant())) { $name = "${safe}_$n"; $n++ }
    $usedNames[$name.ToLowerInvariant()] = $true
    $guides += New-Object PSObject -Property @{ Source = $f.FullName; File = "$name.lua" }
}
if ($guides.Count -eq 0) {
    Write-Host "No guide .lua files in $GuidesPath." -ForegroundColor Red
    exit 1
}

# ---- rebuild the addon folder from scratch, so guides that no longer exist drop out
$target = Join-Path (Join-Path $here 'addon') $addonName
$guideDir = Join-Path $target 'Guides'
if (Test-Path -LiteralPath $target) { Remove-Item -LiteralPath $target -Recurse -Force }
New-Item -ItemType Directory -Path $guideDir -Force | Out-Null

foreach ($g in $guides) {
    Copy-Item -LiteralPath $g.Source -Destination (Join-Path $guideDir $g.File) -Force
}

$lines = @()
$lines += "## Interface: $Interface"
$lines += '## Title: RestedXP Zone Routes'
$lines += "## Notes: $($guides.Count) zone guide file(s) made by RouteBuilder, packed $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
$lines += "## Version: $(Get-Date -Format 'yyyy.MM.dd')"
$lines += '## Dependencies: RXPGuides'
$lines += ''
foreach ($g in $guides) { $lines += "Guides\$($g.File)" }
# no byte-order mark: the game reads .toc files more reliably without one
[System.IO.File]::WriteAllLines((Join-Path $target "$addonName.toc"), [string[]]$lines, (New-Object System.Text.UTF8Encoding($false)))

Write-Host ''
Write-Host "$($guides.Count) guide file(s) packed into $target"
Write-Host ''
Write-Host "Copy the $addonName folder into your game's Interface\AddOns folder, next to RXPGuides."
Write-Host 'Close the game completely and start it again when the addon is new or a guide file was added or'
Write-Host 'removed. When only the contents of existing guides changed, /reload is enough.'
