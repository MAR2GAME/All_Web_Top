$ErrorActionPreference = "Stop"

function Assert-True {
    param(
        [bool]$Condition,
        [string]$Message
    )

    if (-not $Condition) {
        throw $Message
    }
}

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$htmlPath = Join-Path $root "index.html"
$cssPath = Join-Path $root "styles.css"
$assetPaths = @(
    (Join-Path $root "assets\6142.png"),
    (Join-Path $root "assets\6143.png"),
    (Join-Path $root "assets\6144.png"),
    (Join-Path $root "assets\6145.png"),
    (Join-Path $root "assets\6146.png"),
    (Join-Path $root "assets\logo.png")
)
$bannerAsset = Get-ChildItem (Join-Path $root "assets") -File |
    Where-Object { $_.Extension -eq ".png" -and $_.Name -notin @("6142.png", "6143.png", "6144.png", "6145.png", "6146.png", "logo.png") } |
    Select-Object -First 1

Assert-True (Test-Path $htmlPath) "Missing index.html"
Assert-True (Test-Path $cssPath) "Missing styles.css"

foreach ($assetPath in $assetPaths) {
    Assert-True (Test-Path $assetPath) "Missing one or more app assets"
}
Assert-True ($null -ne $bannerAsset) "Missing banner asset"

$html = Get-Content $htmlPath -Raw
$css = Get-Content $cssPath -Raw

Assert-True ($html -match "<title>File Recovery - AI Restore") "Missing page title"
Assert-True ($html -match "File Recovery - AI Restore") "Missing app name"
Assert-True ($html -match "Recover deleted photos, videos, audio, and files") "Missing official hero message"
Assert-True ($html -match "feature-gallery") "Missing feature gallery section"
Assert-True ($html -match "privacy-section") "Missing privacy section"
Assert-True ($html -match "assets/6142.png") "Poster 6142 is not wired into the page"
Assert-True ($html -match "assets/6146.png") "Poster 6146 is not wired into the page"
Assert-True ($html -match "assets/logo.png") "Logo is not wired into the page"
Assert-True ($html -match "brand-banner") "Banner section is not wired into the page"
Assert-True ($html -match "scrollRestoration") "Missing scroll restoration guard"
Assert-True ($html -match "scrollTo\(0, 0\)") "Missing top-of-page reset"

Assert-True (-not ($html -match "LocShare")) "Page still contains LocShare wording"
Assert-True (-not ($html -match "demo")) "Page still contains demo wording"

Assert-True ($css -match "--brand-blue") "Missing design tokens"
Assert-True ($css -match "@media \(max-width: 900px\)") "Missing responsive styles"

Write-Output "File Recovery homepage checks passed."
