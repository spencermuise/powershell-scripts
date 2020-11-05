# Get & count enabled sites
$enabledSites = Get-ChildItem -Path C:\Tools\nginx\sites\ -Name
$enabledSitesCount = $enabledSites | Measure-Object -Line | Select-Object -ExpandProperty Lines

# Get & count available sites
$availableSites = Get-ChildItem -Path C:\Tools\nginx\sites-available\ -Name
$availableSitesCount = $availableSites | Measure-Object -Line | Select-Object -ExpandProperty Lines


# List Active/Enabled sites
if ($enabledSitesCount -eq 0) {
    Write-Host "No Sites Enabled"
} else {
    Write-Host "Enabled Sites [$($enabledSitesCount)]"
    Write-Host "--------------------------------------------------"
    Write-Output -InputObject $enabledSites
}

# Line Break
Write-Host "`n"

# List Available Sites
if ($availableSitesCount -eq 0) {
    Write-Host "No Sites Available"
} else {
    Write-Host "Available Sites [$($availableSitesCount)]"
    Write-Host "--------------------------------------------------"
    Write-Output -InputObject $availableSites
}