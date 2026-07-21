$navBlock = (Get-Content -Raw "index.html") -replace "(?s).*?(<nav[\s\S]*?</nav>).*", '$1'
Get-ChildItem -Path "*.html" -Exclude "index.html" | ForEach-Object {
  $content = Get-Content -Raw $_.FullName
  $newContent = $content -replace "(?s)<nav[\s\S]*?</nav>", $navBlock
  Set-Content -Path $_.FullName -Value $newContent -Encoding UTF8
}
Write-Host "Navigation bars updated in all HTML files."
