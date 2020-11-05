$SiteName=$args[0]
$Port=$args[1]

if (!$SiteName) {
    Write-Host "No site name entered, please enter a site name as the first parameter. It will set the domain to SITENAME.media.local"
    exit
} else {
    if ($SiteName -isnot [string]) {
        Write-Host "The site name must be a string"
        exit 
    }
}

if (!$Port) {
    Write-Host "No port entered, please enter the port to be used in the reverse proxy"
    exit
} else {
    if ($Port -isnot [int]) {
        Write-Host "The port must be an integer"
        exit  
    }
}

$NewFile = "C:\Tools\nginx\sites-available\$($SiteName).conf"

New-Item -ItemType File -Path $NewFile

$TemplateText = Get-Content -Path "C:\Tools\nginx\basic-nginx-media-site-template.txt" -Raw

$NewText = $TemplateText -replace 'DOMAIN', $SiteName
$NewText = $NewText -replace 'PORT', $Port

$NewText | Set-Content -Path $NewFile

Write-Host "`n"
Write-Host "Site created"
Write-Host "Site Name: $($SiteName)"
Write-Host "Domain: $($SiteName).media.local"
Write-Host "Port: $($Port)"
Write-Host "To enable this, run NGINX-Enable-Site.ps1 $($SiteName)"