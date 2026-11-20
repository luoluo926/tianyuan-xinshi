param(
  [int]$Port = 8080,
  [string]$HostName = "0.0.0.0",
  [switch]$SkipPrecompile
)

$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$web = Join-Path $root "web"

if (-not (Test-Path (Join-Path $web "server.js"))) {
  throw "web/server.js not found. Run this script from the repository root."
}

if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
  throw "Node.js not found. Install Node.js 18 or 20 LTS first."
}

$env:HOST = $HostName
$env:PORT = [string]$Port
if ($SkipPrecompile) {
  $env:PRECOMPILE = "0"
}

Set-Location $web
Write-Host "Starting Tianyuan Xinshi at http://127.0.0.1:$Port"
Write-Host "For public access use http://<server-ip>:$Port"
npm start
