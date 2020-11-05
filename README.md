# Powershell Scripts
These are just some powershell scripts I've written to make using Windows a little more tolerable.

I don't claim these are well written, my knowledge of Powershell is still fairly limited, but here we are.

## Scripts

| Script Filename                      | Description                                                                                   | Usage                                                                                               |
|--------------------------------------|-----------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------|
| fixStartTiles.ps1                    | Sets my start tile customizations for a few applications that have them overwritten on update | `fixStartTiles.ps1`                                                                                 |
| NGINX-Disable-Site.ps1               | Disables an NGINX site config file & restarts the NGINX service                               | `NGINX-Disable-Site.ps1 <sitename sans-extension>`                                                  |
| NGINX-Enable-Site.ps1                | Enables an NGINX site config file & restarts the NGINX service                                | `NGINX-Enable-Site.ps1 <sitename sans-extension>`                                                   |
| NGINX-List-Sites.ps1                 | Lists an NGINX site configs, broken-down into active & available                              | `NGINX-Disable-Site.ps1`                                                                            |
| updateStartMenuTileCustomization.ps1 | Semi-automates start tile customization                                                       | `updateStartMenuTileCustomization.ps1`, it'll ask for the path to the shortcut and path to the icon |
