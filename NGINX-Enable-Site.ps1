$SiteName=$args[0]

$FileExists = Test-Path "C:\Tools\nginx\sites-available\$($SiteName).conf"

if ($FileExists) {
    # Create Symlink
    New-Item -ItemType SymbolicLink -Path "C:\Tools\nginx\sites\$($SiteName).conf" -Target "C:\Tools\nginx\sites-available\$($SiteName).conf"
    Write-Host "Symlink for $($SiteName) created"

    # Restart NGINX Service
    Restart-Service NGINX
    Write-Host "NGINX Service Restarted"
} else {
    Write-Host "$($SiteName) was not found as an available site"
}

