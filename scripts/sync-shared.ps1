# Copies the shared reference files into each skill's references/ folder.
# Skills must be self-contained, so the copies are committed; edit only the
# files in shared/ and run this script. -Check fails if any copy is stale.
param([switch]$Check)

$root = Split-Path -Parent $PSScriptRoot
$shared = Join-Path $root 'shared'
$skills = Join-Path $root 'plugins\aiwrness-geo\skills'

$map = @{
  'aiwrness-mcp.md'       = @('geo-lead','brand-fact-sheet','geo-site-audit','ai-technical-files','rewrite-for-ai','comparison-pages',
                              'aiwrness-quick-setup','geo-metrics-overview','ai-blindspot-finder','cited-sources-analysis',
                              'query-fanout-briefs','geo-action-plan')
  'brand-facts-format.md' = @('brand-fact-sheet','geo-site-audit','ai-technical-files','rewrite-for-ai','comparison-pages',
                              'aiwrness-quick-setup','query-fanout-briefs')
  'ai-crawlers.md'        = @('geo-site-audit','ai-technical-files')
}

$stale = @()
foreach ($file in $map.Keys) {
  $source = Join-Path $shared $file
  foreach ($skill in $map[$file]) {
    $dir = Join-Path $skills "$skill\references"
    $target = Join-Path $dir $file
    if ($Check) {
      if (-not (Test-Path $target) -or (Get-FileHash $source).Hash -ne (Get-FileHash $target).Hash) { $stale += "$skill/references/$file" }
    } else {
      New-Item -ItemType Directory -Force $dir | Out-Null
      Copy-Item $source $target -Force
    }
  }
}
if ($Check) {
  if ($stale.Count) { Write-Error "Stale shared copies (run scripts/sync-shared.ps1): $($stale -join ', ')"; exit 1 }
  Write-Output 'Shared copies are up to date.'
} else {
  Write-Output 'Shared references copied.'
}
