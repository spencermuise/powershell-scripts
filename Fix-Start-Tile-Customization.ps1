# This script will fix start tiles for apps that overwrite on updates.

# To add a new application, duplicate the template line in the "apps" array.

# Elevate if needed
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))  
{  
  Write-Output "This must be run from an elevated terminal, please re-reun as admin"
  Write-Output "Press any key to continue..."
  $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
  exit
}

$apps = @(
    # Template Line below, duplicate it and uncomment to add a new application
    # [pscustomobject]@{shortcut='<replace me with the path to the shortcut, no double quotes>';icon='<replace me with the path to the icon, no double quotes>'}
    [pscustomobject]@{shortcut='C:\ProgramData\Microsoft\Windows\Start Menu\Programs\EA\EA Desktop.lnk';icon='C:\Users\smuise\OneDrive\Pictures\App Icons\Blagoicons-Style EA Desktop Icon.png'}
    [pscustomobject]@{shortcut='C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk';icon='C:\Users\smuise\OneDrive\Pictures\App Icons\Blagoicons-Style Edge Icon.png'}
    [pscustomobject]@{shortcut='C:\Users\smuise\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Visual Studio Code\Visual Studio Code.lnk';icon='C:\Users\smuise\OneDrive\Pictures\App Icons\Blagoicons-Style CodeIcon.png'}
    [pscustomobject]@{shortcut='C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Firefox.lnk';icon='C:\Users\smuise\OneDrive\Pictures\App Icons\mozilla_firefox___icon_by_blagoicons_dda0jnl.png'}
    [pscustomobject]@{shortcut='C:\Users\smuise\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Spotify.lnk';icon='C:\Users\smuise\OneDrive\Pictures\App Icons\spotify___icon_by_blagoicons_dd9ygxa.png'}
    [pscustomobject]@{shortcut='C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Epic Games Launcher.lnk';icon='C:\Users\smuise\OneDrive\Pictures\App Icons\Blagoicons-Style Epic Icon.png'}
)

foreach ($app in $apps) {
    $shortcut = $app[0].shortcut
    $icon = $app[0].icon

    $sh = New-Object -COM WScript.Shell
    $shortcutTarget = $sh.CreateShortcut($shortcut)
    $targetPath = $shortcutTarget.TargetPath

    $filename = Split-Path $targetPath -leaf
    $folderPath = Split-Path -Path $targetPath
    $filenameExtensionless = $filename.Replace('.exe','') #remove the extension of the file so the exe's filename can be used to rename the xml file
    
    Copy-Item -Path $icon -Destination "$($folderPath)\app.png"
    Copy-Item -Path "C:\Users\smuise\Code\appexe.VisualElementsManifest.xml" -Destination "$($folderPath)\$($filenameExtensionless).VisualElementsManifest.xml"

    (Get-ChildItem $shortcut).lastwritetime = get-date # update the updated date/time of the shortcut, if this isn't done the tile will never change in the start menu.
}
