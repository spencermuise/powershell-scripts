# Check for elevation
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))  
{  
  Write-Output "This must be run from an elevated terminal, please re-reun as admin"
  Write-Output "Press any key to continue..."
  $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
  exit
}

$SiteName=$args[0]

$FileExists = Test-Path "C:\Tools\nginx\sites\$($SiteName).conf"

if ($FileExists) {
    # Remove Symlink
    Remove-Item -Path "C:\Tools\nginx\sites\$($SiteName).conf"
    Write-Host "Symlink for $($SiteName) removed"

    # Restart NGINX Service
    Restart-Service NGINX
    Write-Host "NGINX Service Restarted"
} else {
    Write-Host "$($SiteName) was not found as an enabled site"
}

