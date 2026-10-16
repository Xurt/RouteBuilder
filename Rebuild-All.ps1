<#
.SYNOPSIS
    Rebuilds every zone's guide: RestedXP's step order first (RxpToLock), then the build, then the addon.

.EXAMPLE
    .\Rebuild-All.ps1 -Rxp "D:\World of Warcraft\_classic_beta_\Interface\AddOns\RXPGuides\Guides\forever"

.EXAMPLE
    .\Rebuild-All.ps1 -Rxp "D:\...\Guides\forever" -Faction Horde -Zone "Zephras Isle","Durotar"

.NOTES
    Run it from the RouteBuilder folder (or anywhere: it changes to its own folder first).
    If Windows refuses to run it: powershell -ExecutionPolicy Bypass -File .\Rebuild-All.ps1 -Rxp "..."
    The full output of every run goes to rebuild.log; the console shows one or two lines per zone.
#>
param(
    # RestedXP's guide folder (the one holding its .lua guide files). Leave the \ off the end.
    [Parameter(Mandatory = $true)][string]$Rxp,
    # which factions to rebuild
    [ValidateSet('Horde', 'Alliance')][string[]]$Faction = @('Horde', 'Alliance'),
    # only these zones (default: every zone in the lists below)
    [string[]]$Zone,
    # skip RxpToLock and build from the lock files as they are
    [switch]$NoRxpToLock,
    # plan every zone from scratch (ignores and replaces the lock files; implies -NoRxpToLock)
    [switch]$Fresh,
    # also read RestedXP guides in subfolders of -Rxp (off by default: the "dungeon" folder repeats the same guides)
    [switch]$Recurse,
    # fetch the newest QuestieDB first
    [switch]$Update,
    # don't run Make-Addon.ps1 at the end
    [switch]$NoAddon,
    # don't write suggested next zones into the guides (RouteBuilder link)
    [switch]$NoLink,
    [double]$Effort = 1
)

$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
$Rxp = $Rxp.Trim().TrimEnd('"').TrimEnd('\', '/')
if (-not (Test-Path -LiteralPath $Rxp -PathType Container)) { throw "RestedXP folder not found: $Rxp" }

# the zones to build for each faction (as in the old build.cmd; the capital cities are planned with their zone:
# Orgrimmar with Durotar, Thunder Bluff with Mulgore, Undercity with Tirisfal Glades, Stormwind City with
# Elwynn Forest, Ironforge with Dun Morogh, Darnassus with Teldrassil)
$zones = @{
    Horde = @(
        'Durotar', 'Mulgore', 'Zephras Isle', 'Tirisfal Glades', 'Silverpine Forest',
        'The Barrens', 'Redridge Mountains', 'Westfall', 'Stonetalon Mountains', 'Ashenvale',
        'Hillsbrad Foothills', 'Thousand Needles', 'Duskwood', 'Dun Morogh', 'Stranglethorn Vale', 'Desolace',
        'Loch Modan', 'Arathi Highlands', 'Alterac Mountains', 'Swamp of Sorrows', 'Dustwallow Marsh', 'Badlands',
        'Feralas', 'The Hinterlands', 'Tanaris', 'Searing Gorge', 'Azshara', 'Felwood', "Un'Goro Crater",
        'Blasted Lands', 'Burning Steppes', 'Western Plaguelands', 'Winterspring', 'Eastern Plaguelands', 'Moonglade',
        'Silithus', 'Teldrassil'
    )
    Alliance = @(
        'Elwynn Forest', 'Teldrassil', 'Zephras Isle', 'Dun Morogh', 'Durotar',
        'Westfall', 'Darkshore', 'Loch Modan', 'Redridge Mountains', 'The Barrens', 'Ashenvale',
        'Wetlands', 'Duskwood', 'Dustwallow Marsh', 'Stonetalon Mountains', 'Riverglades', 'Hillsbrad Foothills',
        'Thousand Needles', 'Stranglethorn Vale', 'Arathi Highlands', 'Desolace', 'Alterac Mountains', 'Badlands',
        'Swamp of Sorrows', 'Feralas', 'The Hinterlands', 'Tanaris', 'Searing Gorge', 'Azshara', 'Felwood',
        "Un'Goro Crater", 'Burning Steppes', 'Blasted Lands', 'Western Plaguelands', 'Winterspring',
        'Eastern Plaguelands', 'Moonglade', 'Silithus'
    )
}

$log = Join-Path $PSScriptRoot 'rebuild.log'
Set-Content -LiteralPath $log -Value "Rebuild-All $(Get-Date -Format 'yyyy-MM-dd HH:mm')  RestedXP: $Rxp" -Encoding UTF8

Write-Host 'Compiling...'
$ErrorActionPreference = 'Continue'
& dotnet build -c Release --nologo -v q 2>&1 | ForEach-Object { "$_" } | Out-File -LiteralPath $log -Append -Encoding UTF8
if ($LASTEXITCODE -ne 0) { throw 'RouteBuilder did not compile; see rebuild.log' }
& dotnet build RxpToLock -c Release --nologo -v q 2>&1 | ForEach-Object { "$_" } | Out-File -LiteralPath $log -Append -Encoding UTF8
if ($LASTEXITCODE -ne 0) { throw 'RxpToLock did not compile; see rebuild.log' }
$routeBuilder = [IO.Path]::Combine($PSScriptRoot, 'bin', 'Release', 'net8.0', 'RouteBuilder.dll')
$rxpToLock = [IO.Path]::Combine($PSScriptRoot, 'RxpToLock', 'bin', 'Release', 'net8.0', 'RxpToLock.dll')

if ($Update) {
    Write-Host 'Updating QuestieDB...'
    & dotnet $routeBuilder update 2>&1 | ForEach-Object { "$_" } | Out-File -LiteralPath $log -Append -Encoding UTF8
    if ($LASTEXITCODE -ne 0) { throw 'update failed; see rebuild.log' }
}

$guides = @(Get-ChildItem -LiteralPath $Rxp -Filter '*.lua' -File -Recurse:$Recurse | ForEach-Object FullName)
if ($guides.Count -eq 0) { throw "no .lua guide files in $Rxp" }
Write-Host "$($guides.Count) RestedXP guide files in $Rxp"

# runs one command, keeps all of its output in the log, shows the lines worth seeing
# (Windows PowerShell 5.1 turns anything a program writes to its error output into a stopping error, so that is
# switched off here: a zone that fails is reported and the run goes on)
function Invoke-Step([string]$what, [string[]]$arguments, [string]$show) {
    $ErrorActionPreference = 'Continue'
    Add-Content -LiteralPath $log -Value "`n===== $what`n> dotnet $($arguments -join ' ')" -Encoding UTF8
    $out = & dotnet @arguments 2>&1 | ForEach-Object { if ($_ -is [System.Management.Automation.ErrorRecord]) { $_.Exception.Message } else { "$_" } }
    $code = $LASTEXITCODE
    $out | Out-File -LiteralPath $log -Append -Encoding UTF8
    $out | Where-Object { $_ -match $show } | ForEach-Object { Write-Host "    $($_.Trim())" }
    return @{ Code = $code; Out = $out }
}

$problems = @(); $failed = @(); $noRxp = @(); $skipped = @(); $done = 0
foreach ($f in $Faction) {
    # -Zone "A","B" arrives as one string "A,B" when the script is started with -File
    $list = if ($Zone) { $Zone | ForEach-Object { $_ -split ',' } | ForEach-Object { $_.Trim() } | Where-Object { $_ } } else { $zones[$f] }
    foreach ($z in $list) {
        Write-Host "$z ($f)" -ForegroundColor Cyan
        if (-not $NoRxpToLock -and -not $Fresh) {
            $r = Invoke-Step "RxpToLock $z ($f)" (@($rxpToLock, '--zone', $z, '--faction', $f, '--rxp', $Rxp) + $guides) '^\d+ steps for|None of these|^Error|not found|^No zone'
            if (($r.Out -join "`n") -match 'None of these') { $noRxp += "$z ($f)" }
        }
        $buildArgs = @($routeBuilder, 'build', '--zone', $z, '--faction', $f, '--rxp', $Rxp, '--effort', "$Effort")
        if ($Fresh) { $buildArgs += '--fresh' }
        $b = Invoke-Step "build $z ($f)" $buildArgs 'saved order for everyone:|yd on foot|training, vendor|^Error'
        $text = $b.Out -join "`n"
        if ($text -match 'is planned as part of (.+?); build') { $skipped += "$z ($f, part of $($Matches[1]))" }
        elseif ($text -match '(?m)^Error') { $failed += "$z ($f)" }
        elseif ($text -match 'PROBLEMS') { $problems += "$z ($f)" }
        else { $done++ }
    }
}

Write-Host ''
Write-Host "$done built with all checks passed." -ForegroundColor Green
if ($problems.Count) { Write-Host "Built, but the report lists problems: $($problems -join ', ')" -ForegroundColor Yellow }
if ($failed.Count) { Write-Host "Not built (see rebuild.log): $($failed -join ', ')" -ForegroundColor Red }
if ($skipped.Count) { Write-Host "Skipped, built with their zone: $($skipped -join ', ')" }
if ($noRxp.Count) { Write-Host "RestedXP's guides have nothing for these, so their lock was kept as it was: $($noRxp -join ', ')" }

# suggested next zones, from every guide in the folder (also those built before this run)
if (-not $NoLink) {
    Write-Host ''
    Write-Host 'Suggesting next zones (link)...'
    $null = Invoke-Step 'link' @($routeBuilder, 'link') '^\s+\S.*: (at |no other)|^Error|^No guide'
}

if (-not $NoAddon) {
    Write-Host ''
    & (Join-Path $PSScriptRoot 'Make-Addon.ps1')
}
