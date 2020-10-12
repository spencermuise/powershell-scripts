# Elevate if needed
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))  
{  
  $arguments = "& '" +$myinvocation.mycommand.definition + "'"
  Start-Process powershell -Verb runAs -ArgumentList $arguments
  Break
}

$shortcutPath = Read-Host -Prompt 'Enter path to the start menu shortcut'
$iconPath = Read-Host -Prompt 'Enter path to the icon to use'

$shortcutPath = $shortcutPath.Replace('"','') #strip out the quotes
$iconPath = $iconPath.Replace('"','') #strip out the quotes

# Get the target path of the shortcut
$sh = New-Object -COM WScript.Shell
$shortcutTarget = $sh.CreateShortcut($shortcutPath)
$targetPath = $shortcutTarget.TargetPath

$filename = Split-Path $targetPath -leaf
$folderPath = Split-Path -Path $targetPath
$filenameExtensionless = $filename.Replace('.exe','') #remove the extension of the file so the exe's filename can be used to rename the xml file

Copy-Item -Path "C:\Users\smuise\Code\appexe.VisualElementsManifest.xml" -Destination "$($folderPath)\$($filenameExtensionless).VisualElementsManifest.xml"
Copy-Item -Path $iconPath -Destination "$($folderPath)\app.png"

(ls $shortcutPath).lastwritetime = get-date