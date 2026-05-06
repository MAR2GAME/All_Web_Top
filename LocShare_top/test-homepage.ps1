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
$posterPaths = @(
    (Join-Path $root "assets\poster-1.png"),
    (Join-Path $root "assets\poster-2.png"),
    (Join-Path $root "assets\poster-3.png"),
    (Join-Path $root "assets\poster-4.png"),
    (Join-Path $root "assets\poster-5.png")
)

Assert-True (Test-Path $htmlPath) "Missing index.html"
Assert-True (Test-Path $cssPath) "Missing styles.css"

foreach ($posterPath in $posterPaths) {
    Assert-True (Test-Path $posterPath) "Missing one or more poster assets"
}

$html = Get-Content $htmlPath -Raw
$css = Get-Content $cssPath -Raw

Assert-True ($html -match "<title>") "Missing page title"
Assert-True ($html -match "LocShare: GPS Locator") "Missing brand name"
Assert-True ($html -match "Stay close with precise live location sharing") "Missing official hero message"
Assert-True ($html -match "feature-gallery") "Missing feature gallery section"
Assert-True ($html -match "privacy-section") "Missing privacy section"
Assert-True ($html -match "assets/poster-1.png") "Poster 1 is not wired into the page"
Assert-True ($html -match "assets/poster-5.png") "Poster 5 is not wired into the page"
Assert-True ($html -match "scrollRestoration") "Missing scroll restoration guard"
Assert-True ($html -match "scrollTo\(0, 0\)") "Missing top-of-page reset"

Assert-True (-not ($html -match "review")) "Page still contains review wording"
Assert-True (-not ($html -match "demo")) "Page still contains demo wording"
Assert-True (-not ($html -match "审核")) "Page still contains audit wording"

Assert-True ($css -match "--brand-blue") "Missing design tokens"
Assert-True ($css -match "@media \(max-width: 900px\)") "Missing responsive styles"

Write-Output "Homepage checks passed."
