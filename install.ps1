$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$codexDir = Join-Path $HOME ".codex"
$claudeRulesDir = Join-Path $HOME ".claude\rules"

New-Item -ItemType Directory -Force -Path $codexDir | Out-Null
New-Item -ItemType Directory -Force -Path $claudeRulesDir | Out-Null

Copy-Item -LiteralPath (Join-Path $repoRoot "AGENTS.md") -Destination (Join-Path $codexDir "AGENTS.md") -Force
Copy-Item -LiteralPath (Join-Path $repoRoot "rules\*") -Destination $claudeRulesDir -Recurse -Force

Write-Host "Installed AI Native Codex standards:"
Write-Host "  AGENTS.md -> $codexDir\AGENTS.md"
Write-Host "  rules     -> $claudeRulesDir"
